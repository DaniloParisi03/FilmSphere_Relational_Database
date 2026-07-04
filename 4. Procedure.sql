USE filmsphere;

-- ============================================================
-- Server load redundancy management
-- ============================================================

-- Connect a device to a streaming server
DELIMITER $$
CREATE PROCEDURE StartConnection(
    IN _ServerIP    INT,
    IN _DeviceId    INT,
    IN _DeviceIP    BIGINT,
    IN _ConnTime    DATETIME
)
BEGIN
    DECLARE serverMaxUsers    INT DEFAULT 0;
    DECLARE serverCurrentLoad INT DEFAULT 0;

    (SELECT ss.MaxUsers, ss.CurrentLoad
     FROM StreamingServer ss
     WHERE ss.ServerIP = _ServerIP
     LIMIT 1)
    INTO serverMaxUsers, serverCurrentLoad;

    IF serverMaxUsers = serverCurrentLoad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Server at maximum capacity';
    END IF;

    INSERT INTO ConnectionHistory(DeviceId, ServerIP, DeviceIP, ConnectionStart, ConnectionEnd)
    VALUES (_DeviceId, _ServerIP, _DeviceIP, _ConnTime, NULL);
END $$
DELIMITER ;

-- Disconnect a device from a streaming server
DELIMITER $$
CREATE PROCEDURE EndConnection(
    IN _ServerIP  INT,
    IN _DeviceId  INT,
    IN _DeviceIP  BIGINT,
    IN _ConnTime  DATETIME
)
BEGIN
    UPDATE ConnectionHistory ch
    SET ch.ConnectionEnd = _ConnTime
    WHERE ch.ConnectionEnd IS NULL
      AND ch.ServerIP   = _ServerIP
      AND ch.DeviceId   = _DeviceId
      AND _DeviceIP     = ch.DeviceIP;

    UPDATE StreamingServer
    SET CurrentLoad = CurrentLoad - 1
    WHERE ServerIP = _ServerIP;
END $$
DELIMITER ;

-- ============================================================
-- Core procedures (operations described in the access tables)
-- ============================================================

-- 1) Most watched film of the day (frequency: once per day)
DELIMITER $$
CREATE PROCEDURE FilmOfTheDay()
BEGIN
    DECLARE filmOfDayId INT DEFAULT 0;
    DECLARE viewCount   INT DEFAULT 0;

    SELECT f1.FilmId, COUNT(*) AS ViewCount
    INTO filmOfDayId, viewCount
    FROM Film f1
        NATURAL JOIN Viewing v
    WHERE DATE(v.ViewDate) = CURRENT_DATE()
    GROUP BY f1.FilmId
    ORDER BY ViewCount DESC, f1.ReleaseYear
    LIMIT 1;

    SELECT filmOfDayId, viewCount;
END $$
DELIMITER ;

-- 2) Genres with average rating above 3 (both critics and users)
DELIMITER $$
CREATE PROCEDURE GenresAboveRatingThree()
BEGIN
    SELECT DISTINCT g.GenreName
    FROM Genre g
        NATURAL JOIN Membership
        NATURAL JOIN (
            SELECT f.FilmId FROM Film f WHERE f.Rating > 3
        ) AS FilmsAboveThreshold
    ORDER BY g.GenreName;
END $$
DELIMITER ;

-- 3) Given a device, find the nearest server with lowest load that hosts the requested film
DELIMITER $$
CREATE PROCEDURE FindServerForDevice(
    IN  _DeviceId   INT,
    IN  _DeviceIP   BIGINT,
    IN  _FilmId     INT,
    OUT _ServerIP   INT
)
BEGIN
    WITH ServerSelection AS (
        SELECT ServerIP, ABS(_DeviceIP - ServerIP) AS Distance
        FROM PointOfPresence pp
            NATURAL JOIN StreamingServer
        WHERE FilmId = _FilmId
        ORDER BY Distance
        LIMIT 1
    )
    SELECT ServerIP INTO _ServerIP
    FROM ServerSelection;
END $$
DELIMITER ;

-- 4) Find a critic's reviews after a given date
DELIMITER $$
CREATE PROCEDURE FindCriticReviews(IN _CriticId CHAR(17), IN _FromDate DATE)
BEGIN
    SELECT FilmId, Title, Score
    FROM Critic
        NATURAL JOIN CriticReview
        NATURAL JOIN Film
        NATURAL JOIN FilmDescription
    WHERE CriticId   = _CriticId
      AND ReviewDate > _FromDate;
END $$
DELIMITER ;

-- 5) Create a new account with subscription (paid invoice)
DELIMITER $$
CREATE PROCEDURE CreateAccount(
    IN _profileCode  CHAR(14),
    IN _name         VARCHAR(50),
    IN _surname      VARCHAR(50),
    IN _email        VARCHAR(50),
    IN _nickname     VARCHAR(50),
    IN _password     VARCHAR(50),
    IN _planName     VARCHAR(50),
    IN _cardCode     VARCHAR(50)
)
BEGIN
    INSERT INTO Profile(ProfileCode, Name, Surname, Email, Nickname, PasswordHash)
    VALUES (_profileCode, _name, _surname, _email, _nickname, _password);

    INSERT INTO Subscription(ProfileCode, PlanName)
    VALUES (_profileCode, _planName);

    INSERT INTO Card(CardCode)
    VALUES (_cardCode);

    INSERT INTO Invoice(IssueDate, ExpiryDate, PlanName)
    VALUES (CURDATE(), DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH), _planName);

    SET @invoiceNumber = (SELECT MAX(InvoiceId) FROM Invoice);

    INSERT INTO Paid
    VALUES (_profileCode, @invoiceNumber, CURDATE());

    INSERT INTO Payment
    VALUES(@invoiceNumber, _cardCode);
END $$
DELIMITER ;

-- 6) Check server load
DELIMITER $$
CREATE PROCEDURE CheckServer(
    IN  _ServerIP          INT,
    OUT _ConnectedUsers    INT,
    OUT _LoadPercentage    INT
)
BEGIN
    SELECT CurrentLoad, ((CurrentLoad / MaxUsers) * 100)
    INTO _ConnectedUsers, _LoadPercentage
    FROM StreamingServer
    WHERE ServerIP = _ServerIP;
END $$
DELIMITER ;

-- 7) Popularity of a cast member (actor or director)
/*
  Popularity = weighted average (total weight: 16):
    Average film rating  (weight 5)
    Film awards won      (weight 4)
    Personal awards won  (weight 7)
*/
DELIMITER $$
CREATE PROCEDURE CastPopularity(IN _fiscalCode CHAR(17), IN _role VARCHAR(16))
BEGIN
    WITH
    SelectedCast AS (
        SELECT FiscalCode
        FROM CastMember
        WHERE Role = _role
    ),
    FilmAwardsCount AS (
        SELECT FiscalCode, COUNT(*) AS FilmAwards
        FROM Film
            NATURAL JOIN Participation
            NATURAL JOIN FilmAwarding
        GROUP BY FiscalCode
    ),
    PersonalAwardsCount AS (
        SELECT FiscalCode, COUNT(*) AS PersonalAwards
        FROM SelectedCast
            NATURAL JOIN CastAwarding
        GROUP BY FiscalCode
    ),
    FilmRatingAvg AS (
        SELECT FiscalCode, AVG(Rating) AS AvgFilmRating
        FROM Film
            NATURAL JOIN Participation
        WHERE Role = _role
        GROUP BY FiscalCode
    ),
    GlobalScore AS (
        SELECT *,
            ((AvgFilmRating * 5) + (FilmAwards * 4) + (PersonalAwards * 7)) / 16 AS TotalScore
        FROM FilmAwardsCount
            NATURAL JOIN PersonalAwardsCount
            NATURAL JOIN FilmRatingAvg
    ),
    GlobalRanking AS (
        SELECT *, RANK() OVER (ORDER BY TotalScore DESC) AS Ranking
        FROM GlobalScore
    )
    SELECT Ranking
    FROM GlobalRanking
    WHERE FiscalCode = _fiscalCode;
END $$
DELIMITER ;

-- 8) Insert a user review
DELIMITER $$
CREATE PROCEDURE InsertUserReview(
    IN _FilmId       INT,
    IN _ProfileCode  CHAR(14),
    IN _Score        DECIMAL(2,1)
)
BEGIN
    -- Validation checks
    SET @filmExists = (SELECT COUNT(*) FROM Film    WHERE FilmId     = _FilmId);
    SET @userExists = (SELECT COUNT(*) FROM Profile WHERE ProfileCode = _ProfileCode);

    IF (@filmExists <> 1 OR @userExists <> 1 OR _Score NOT BETWEEN 0 AND 5) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: invalid input parameters';
    END IF;

    INSERT INTO UserReview
    VALUES (_ProfileCode, _FilmId, CURDATE(), _Score);
END $$
DELIMITER ;