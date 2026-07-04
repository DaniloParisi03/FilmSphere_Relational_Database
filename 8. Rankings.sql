USE filmsphere;

-- ============================================================
-- Analytics: Film Rankings
-- Rankings by: global views, format, geographic state, plan
-- ============================================================

DELIMITER $$
CREATE PROCEDURE GlobalFilmRanking()
BEGIN
    SELECT FilmId, DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS Popularity
    FROM Viewing
    GROUP BY FilmId;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE MostWatchedFormats()
BEGIN
    WITH FilmsByPopularity AS (
        SELECT FilmId, DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS Popularity
        FROM Viewing
        GROUP BY FilmId
    )
    SELECT FilmId, AudioCode, VideoCode,
           DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS FormatPopularity
    FROM FilmsByPopularity
        NATURAL JOIN Format
    GROUP BY FilmId, AudioCode, VideoCode;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE MostPopularFilmByState()
BEGIN
    WITH
    FilmViewingInfo AS (
        SELECT *
        FROM Viewing
            NATURAL JOIN Interface
            NATURAL JOIN ConnectionHistory
            NATURAL JOIN GeoIndexing
            NATURAL JOIN GeoState
        WHERE ViewDate = ConnectionStart
    ),
    ViewingCountByState AS (
        SELECT FilmId, StateName, COUNT(*) AS ViewCount
        FROM FilmViewingInfo
        GROUP BY FilmId, StateName
    ),
    Ranking AS (
        SELECT StateName, FilmId,
               DENSE_RANK() OVER (PARTITION BY StateName ORDER BY ViewCount DESC) AS FilmRank
        FROM ViewingCountByState
    )
    SELECT StateName, FilmId
    FROM Ranking
    WHERE FilmRank = 1;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE MostWatchedFilmByPlan()
BEGIN
    WITH
    AllSubscriptions AS (
        SELECT ProfileCode, PlanName, IssueDate, ExpiryDate
        FROM Profile
            NATURAL JOIN Paid
            NATURAL JOIN Invoice
        UNION
        SELECT ProfileCode, PlanName, IssueDate, ExpiryDate
        FROM Profile
            NATURAL JOIN ToPay
            NATURAL JOIN Invoice
    ),
    ViewingCountByPlan AS (
        SELECT FilmId, PlanName, COUNT(*) AS ViewCount
        FROM Viewing v
            NATURAL JOIN AllSubscriptions
        WHERE ViewDate BETWEEN IssueDate AND ExpiryDate
        GROUP BY FilmId, PlanName
    ),
    Ranking AS (
        SELECT FilmId, PlanName, ViewCount,
               DENSE_RANK() OVER (PARTITION BY PlanName ORDER BY ViewCount DESC) AS RankPosition
        FROM ViewingCountByPlan
    )
    SELECT FilmId, PlanName
    FROM Ranking
    WHERE RankPosition = 1;
END $$
DELIMITER ;