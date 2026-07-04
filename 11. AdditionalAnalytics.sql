-- Additional analytics: given a user profile, return their annual statistics

DELIMITER $$
CREATE PROCEDURE AnnualUserReport(IN _ProfileCode CHAR(14))
BEGIN
    DECLARE totalViewingHours    INT;
    DECLARE totalFilmsWatched    INT;
    DECLARE totalGBDownloaded    INT;
    DECLARE totalFilmsDownloaded INT;

    -- Top 3 most-watched actors
    -- Top 3 most-watched directors
    -- Top 3 most-watched films

    -- Total hours watched (file size in GB / 60 to convert minutes to hours)
    SET totalViewingHours = (
        SELECT SUM(f.FileSize) / 60
        FROM Viewing v
            NATURAL JOIN Format f
        WHERE v.ProfileCode = _ProfileCode
    );

    -- Total distinct films watched
    SET totalFilmsWatched = (
        SELECT COUNT(DISTINCT v.FilmId)
        FROM Viewing v
        WHERE v.ProfileCode = _ProfileCode
    );

    -- Total GB downloaded
    SET totalGBDownloaded = CAST((
        SELECT SUM(f.FileSize)
        FROM Download d
            NATURAL JOIN Format f
        WHERE d.ProfileCode = _ProfileCode
    ) AS SIGNED INTEGER);

    -- Total films downloaded
    SET totalFilmsDownloaded = (
        SELECT COUNT(d.FilmId)
        FROM Download d
            NATURAL JOIN Format f
        WHERE d.ProfileCode = _ProfileCode
    );

    -- Most-watched films with highest rating (top 3)
    SELECT v.FilmId, df.Title
    FROM Viewing v
        NATURAL JOIN FilmDescription df
    WHERE v.ProfileCode  = _ProfileCode
      AND df.LanguageName = 'English'
    GROUP BY v.FilmId
    ORDER BY COUNT(*) DESC
    LIMIT 3;

    -- Directors of the most-watched films (top 3)
    SELECT p.FiscalCode, c.Name, c.Surname
    FROM Viewing v
        NATURAL JOIN Participation p
        NATURAL JOIN CastMember    c
    WHERE v.ProfileCode = _ProfileCode
      AND c.Role = 'Director'
    GROUP BY p.FiscalCode
    ORDER BY COUNT(v.FilmId) DESC
    LIMIT 3;
END $$
DELIMITER ;