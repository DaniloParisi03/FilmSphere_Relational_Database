USE filmsphere;

DELIMITER $$
CREATE PROCEDURE BalanceControl(IN _ServerIP INT, IN _ServerLoad INT, IN _FilmId INT)
BEGIN
    DECLARE avgLoad       INT DEFAULT -1;
    DECLARE newServerIP   INT DEFAULT -1;

    -- Compute average load across all servers
    SET avgLoad = (
        SELECT AVG(CurrentLoad)
        FROM StreamingServer
    );

    -- Select the nearest, least-loaded server that does not yet host the requested film
    SET newServerIP = (
        WITH LightServers AS (
            SELECT ServerIP, CurrentLoad
            FROM StreamingServer
            WHERE CurrentLoad < avgLoad
        )
        SELECT DISTINCT sl.ServerIP, ABS(_ServerIP - sl.ServerIP) AS ServerDistance
        FROM LightServers sl
            NATURAL JOIN PointOfPresence pp
        WHERE pp.FilmId <> _FilmId
        ORDER BY (ServerDistance / CurrentLoad)
        LIMIT 1
    );

    -- Identify users currently streaming the film from the origin server
    WITH LastViewingPerUser AS (
        SELECT v.ProfileCode, MAX(ViewDate) AS LatestView
        FROM Viewing v
        WHERE v.FilmId = _FilmId
        GROUP BY v.ProfileCode
    )
    SELECT NULL
    FROM (
        SELECT ch.DeviceId
        FROM ConnectionHistory ch
            NATURAL JOIN Device      d
            NATURAL JOIN Interface   i
            NATURAL JOIN LastViewingPerUser lv
        WHERE ServerIP = _ServerIP AND ConnectionEnd IS NULL
    ) AS ActiveStreamingDevices;

    -- Open new connections on the new server for affected devices
    INSERT INTO ConnectionHistory (DeviceId, ServerIP, DeviceIP, ConnectionStart)
    SELECT ch.DeviceId, newServerIP, ch.DeviceIP, NOW()
    FROM ConnectionHistory ch
    WHERE ch.ServerIP = _ServerIP
      AND ch.ConnectionEnd IS NULL
      AND ch.DeviceId IN (ActiveStreamingDevices);

    -- Close old connections on the origin server
    UPDATE ConnectionHistory
    SET ConnectionEnd = NOW()
    WHERE ServerIP      = _ServerIP
      AND ConnectionEnd IS NULL
      AND DeviceId IN (ActiveStreamingDevices);

    -- Update load on origin server
    UPDATE StreamingServer
    SET CurrentLoad = CurrentLoad - COUNT(ActiveStreamingDevices)
    WHERE ServerIP = _ServerIP;

    -- Update load on new server
    UPDATE StreamingServer
    SET CurrentLoad = CurrentLoad + COUNT(ActiveStreamingDevices)
    WHERE ServerIP = newServerIP;

    -- Update film catalogue: move PoP entry to the new server
    UPDATE PointOfPresence
    SET ServerIP = newServerIP
    WHERE ServerIP = _ServerIP AND FilmId = _FilmId;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE LoadBalancing()
BEGIN
    DECLARE done             BOOL DEFAULT FALSE;
    DECLARE serverIP         INT  DEFAULT -1;
    DECLARE serverLoad       INT  DEFAULT -1;
    DECLARE requestedFilmId  INT  DEFAULT -1;
    DECLARE avgLoad          INT  DEFAULT -1;

    -- Cursor over servers hosting high-demand films
    DECLARE FilmRequestCursor CURSOR FOR (
        WITH FilmRequestCounts AS (
            SELECT v.FilmId, COUNT(*) AS RequestCount
            FROM Viewing v
            GROUP BY v.FilmId
        ),
        HighDemandFilms AS (
            SELECT FilmId
            FROM FilmRequestCounts
            WHERE RequestCount > (SELECT AVG(RequestCount) FROM FilmRequestCounts)
        )
        SELECT DISTINCT ss.ServerIP, ss.CurrentLoad, fr.FilmId
        FROM StreamingServer ss
            NATURAL JOIN PointOfPresence pop
            NATURAL JOIN HighDemandFilms fr
    );

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET avgLoad = (
        SELECT AVG(CurrentLoad)
        FROM StreamingServer
    );

    OPEN FilmRequestCursor;
    FETCH FilmRequestCursor INTO serverIP, serverLoad, requestedFilmId;
    WHILE (NOT done) DO
        -- Trigger balancing only if the server load exceeds the average
        IF serverLoad > avgLoad THEN
            CALL BalanceControl(serverIP, serverLoad, requestedFilmId);
        END IF;
        FETCH FilmRequestCursor INTO serverIP, serverLoad, requestedFilmId;
    END WHILE;
    CLOSE FilmRequestCursor;
END $$
DELIMITER ;

-- Reassign users of a specific server to alternative servers
DELIMITER $$
CREATE PROCEDURE ManageServerLoad(
    IN  _ServerIP      INT,
    IN  _maxUsers      INT,
    IN  _currentLoad   INT,
    OUT targetServerIP INT,
    OUT userCode       CHAR(14)
)
BEGIN
    DECLARE done          BOOL    DEFAULT FALSE;
    DECLARE destIP        INT     DEFAULT 0;
    DECLARE deviceCode    CHAR(14) DEFAULT '';
    DECLARE deviceIP      INT     DEFAULT 0;
    DECLARE destDistance  INT     DEFAULT 0;
    DECLARE destLoad      INT     DEFAULT 0;
    DECLARE destCapacity  INT     DEFAULT 0;

    DECLARE Cursor1 CURSOR FOR (
        WITH
        -- For each connected user, select the last film watched
        UserLastViewing AS (
            SELECT i.ProfileCode, DeviceId, DeviceIP,
                   (SELECT FilmId FROM Viewing v WHERE i.ProfileCode = v.ProfileCode
                    ORDER BY ViewDate DESC LIMIT 1) AS FilmId
            FROM ConnectionHistory s
                NATURAL JOIN Interface i
            WHERE s.ServerIP = _ServerIP AND ConnectionEnd IS NULL
        ),
        -- Servers that host the film
        AvailableServers AS (
            SELECT *
            FROM PointOfPresence p
                NATURAL JOIN UserLastViewing
            WHERE ServerIP <> _ServerIP
        )
        -- Select the nearest available server for each user
        SELECT ServerIP,
               DeviceId,
               DeviceIP,
               ABS(((_ServerIP - (_ServerIP % 10000)) / 10000)
                   - ((ServerIP - (ServerIP % 10000)) / 10000)) AS DistanceToServer,
               CurrentLoad AS DestLoad,
               MaxUsers    AS DestCapacity
        FROM AvailableServers
            NATURAL JOIN StreamingServer
        ORDER BY DistanceToServer
    );
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN Cursor1;
    Scan: LOOP
        FETCH Cursor1 INTO destIP, deviceCode, deviceIP, destDistance, destLoad, destCapacity;
        IF (done = TRUE) THEN LEAVE Scan;
        END IF;
        -- Migrate the user only if the destination server is below 85% capacity
        IF ((destLoad / destCapacity) * 100 < 85) THEN
            CALL EndConnection(_ServerIP, deviceCode);
            CALL StartConnection(destIP, deviceCode, deviceIP);
        END IF;
    END LOOP;
    CLOSE Cursor1;
END $$
DELIMITER ;

-- Scans all servers and triggers ManageServerLoad when load exceeds 85%
-- Called by the scheduled event EvtCheckServerLoad
DELIMITER $$
CREATE PROCEDURE CheckAllServersLoad()
BEGIN
    DECLARE done            BOOL DEFAULT FALSE;
    DECLARE ip              INT;
    DECLARE serverCapacity  INT DEFAULT 0;
    DECLARE serverLoad      INT DEFAULT 0;

    DECLARE ServerCursor CURSOR FOR (
        SELECT ServerIP, MaxCapacity, CurrentLoad
        FROM StreamingServer
    );
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN ServerCursor;
    ReadLoop: LOOP
        FETCH ServerCursor INTO ip, serverCapacity, serverLoad;
        IF done THEN LEAVE ReadLoop;
        END IF;
        -- 85% is the threshold above which rebalancing is triggered
        IF (serverLoad / serverCapacity) * 100 > 85 THEN
            CALL ManageServerLoad(ip, serverCapacity, serverLoad);
        END IF;
    END LOOP;
    CLOSE ServerCursor;
END $$
DELIMITER ;