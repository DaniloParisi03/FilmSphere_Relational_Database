USE filmsphere;

-- Caching: pre-load recommended films onto each user's nearest server
DELIMITER $$
CREATE PROCEDURE CacheRecommendedFilms()
BEGIN
    DECLARE filmId      INT;
    DECLARE profileCode CHAR(14);
    DECLARE lastServerForUser   INT;
    DECLARE filmAlreadyOnServer INT DEFAULT 0;
    DECLARE done INT DEFAULT 0;

    DECLARE Cursor1 CURSOR FOR (SELECT FilmId, ProfileCode FROM RecommendedFilms);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN Cursor1;
    ReadLoop: LOOP
        FETCH Cursor1 INTO filmId, profileCode;
        IF done THEN LEAVE ReadLoop; END IF;

        -- Find the last server used by this user
        SET lastServerForUser = (
            SELECT ServerIP
            FROM ConnectionHistory
                NATURAL JOIN Interface
            WHERE ProfileCode = profileCode
            ORDER BY ConnectionStart DESC
            LIMIT 1
        );

        -- Check whether the film is already available on that server
        SET filmAlreadyOnServer = (
            SELECT COUNT(*)
            FROM PointOfPresence
            WHERE ServerIP = lastServerForUser AND FilmId = filmId
        );

        -- Add the film to the server only if it is not already there
        IF filmAlreadyOnServer = 0 THEN
            INSERT INTO PointOfPresence(ServerIP, FilmId)
            VALUES (lastServerForUser, filmId);
        END IF;
    END LOOP;
    CLOSE Cursor1;
END $$
DELIMITER ;