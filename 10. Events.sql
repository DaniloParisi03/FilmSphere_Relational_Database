USE filmsphere;
SET GLOBAL event_scheduler = ON;

-- Scheduled event: check server loads every 3 minutes
DELIMITER $$
CREATE EVENT EvtCheckServerLoad
ON SCHEDULE EVERY 3 MINUTE
DO
    CALL CheckAllServersLoad();
$$
DELIMITER ;

-- Scheduled event: compute film recommendations for every user once per day
DELIMITER $$
CREATE EVENT EvtComputeUserRecommendations
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    DECLARE done     BOOL    DEFAULT FALSE;
    DECLARE userCode CHAR(14) DEFAULT ' ';

    DECLARE UserCursor CURSOR FOR (SELECT p.ProfileCode FROM Profile p);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN UserCursor;
    FETCH UserCursor INTO userCode;
    WHILE (NOT done) DO
        CALL RecommendFilmsByGenre(userCode);
        FETCH UserCursor INTO userCode;
    END WHILE;
    CLOSE UserCursor;
END;
$$
DELIMITER ;