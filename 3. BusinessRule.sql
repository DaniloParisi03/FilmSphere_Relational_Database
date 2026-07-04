USE filmsphere;

DELIMITER $$
CREATE TRIGGER TrgAwardYear
BEFORE INSERT ON FilmAwarding
FOR EACH ROW
BEGIN
    IF NEW.WinYear IS NULL THEN
        SET NEW.WinYear = (SELECT YEAR(ReleaseYear) FROM Film WHERE FilmId = NEW.FilmId);
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TrgCheckQualityIndex
BEFORE INSERT ON AudioFormat
FOR EACH ROW
BEGIN
    IF (NEW.QualityIndex NOT BETWEEN 0 AND 5) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid quality index';
    END IF;
END $$

DELIMITER $$
CREATE TRIGGER TrgCheckReview
BEFORE INSERT ON UserReview
FOR EACH ROW
BEGIN
    DECLARE filmReleaseDate DATE;
    SET filmReleaseDate = (SELECT ReleaseYear FROM Film WHERE FilmId = NEW.FilmId);
    IF (NEW.ReviewDate < filmReleaseDate) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid review date: cannot review a film not yet released';
    END IF;
    IF (NEW.Score < 0.0 OR NEW.Score > 5.0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid score';
    END IF;
    UPDATE Film
    SET
        Film.ReviewCount = Film.ReviewCount + 1,
        Film.Rating      = (Film.Rating * (Film.ReviewCount - 1) + NEW.Score) / Film.ReviewCount
    WHERE Film.FilmId = NEW.FilmId;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TrgCheckPlanCost
BEFORE INSERT ON Plan
FOR EACH ROW
BEGIN
    IF (NEW.Cost < 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid plan cost';
    END IF;
END $$

DELIMITER $$
CREATE TRIGGER TrgCheckBitrate
BEFORE INSERT ON VideoFormat
FOR EACH ROW
BEGIN
    IF (NEW.Bitrate < 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid bitrate';
    END IF;
END $$

DELIMITER $$
CREATE TRIGGER TrgCheckCriticReview
BEFORE INSERT ON CriticReview
FOR EACH ROW
BEGIN
    DECLARE filmReleaseDate DATE;
    IF (NEW.Score NOT BETWEEN 0.1 AND 10.0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid critic score';
    END IF;
    SET filmReleaseDate = (SELECT ReleaseYear FROM Film WHERE FilmId = NEW.FilmId);
    IF (NEW.ReviewDate > filmReleaseDate) THEN
        SET NEW.ReviewDate = CURDATE();
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TrgAddGeoIndexing
AFTER INSERT ON ConnectionHistory
FOR EACH ROW
BEGIN
    SET @stateOfDevice = (NEW.DeviceIP - (NEW.DeviceIP % 10000));
    INSERT INTO GeoIndexing(DeviceId, ServerIP, DeviceIP, ConnectionStart, StateIP)
    VALUES (NEW.DeviceId, NEW.ServerIP, NEW.DeviceIP, NEW.ConnectionStart, @stateOfDevice);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TrgCheckCastRole
BEFORE INSERT ON CastMember
FOR EACH ROW
BEGIN
    IF NEW.Role NOT IN ('Actor', 'Actress', 'Director') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Unknown cast role';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TrgCheckCodecType
BEFORE INSERT ON Codec
FOR EACH ROW
BEGIN
    IF NEW.CodecType NOT IN ('Audio', 'Video') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Unknown codec type';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TrgUpdateServerLoad
AFTER INSERT ON ConnectionHistory
FOR EACH ROW
BEGIN
    UPDATE StreamingServer
    SET CurrentLoad = CurrentLoad + 1
    WHERE ServerIP = NEW.ServerIP;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TrgRemoveWatchedRecommendations
AFTER INSERT ON Viewing
FOR EACH ROW
BEGIN
    DELETE FROM RecommendedFilms
    WHERE FilmId = NEW.FilmId AND ProfileCode = NEW.ProfileCode;
END$$
DELIMITER ;