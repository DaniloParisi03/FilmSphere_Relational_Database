USE filmsphere;

CREATE TABLE IF NOT EXISTS RecommendedFilms(
    ProfileCode  CHAR(14) NOT NULL,
    FilmId       INT      NOT NULL,
    PRIMARY KEY(ProfileCode, FilmId),
    FOREIGN KEY (FilmId)       REFERENCES Film(FilmId)          ON DELETE CASCADE,
    FOREIGN KEY (ProfileCode)  REFERENCES Profile(ProfileCode)  ON DELETE CASCADE
);

DELIMITER $$
CREATE PROCEDURE AddToRecommended(IN _UserId CHAR(14), IN _FilmId INT)
BEGIN
    INSERT INTO RecommendedFilms
    VALUES(_UserId, _FilmId);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE RecommendFilmsByGenre(IN _UserId CHAR(14))
BEGIN
    DECLARE done BOOL DEFAULT FALSE;
    DECLARE filmCode INT DEFAULT NULL;

    DECLARE FilmsByGenre CURSOR FOR (
        -- Search for films not yet watched by the user to recommend
        WITH UnwatchedFilms AS (
            SELECT v.FilmId
            FROM Viewing v
            WHERE v.FilmId NOT IN (
                SELECT v1.FilmId FROM Viewing v1 WHERE v1.ProfileCode = _UserId
            )
        ),
        -- Select the three genres most watched by the user
        TopGenresForUser AS (
            SELECT g.GenreName
            FROM Viewing v
                INNER JOIN Membership a ON v.FilmId = a.FilmId
                INNER JOIN Genre g     ON a.GenreName = g.GenreName
            WHERE v.ProfileCode = _UserId
            GROUP BY g.GenreName
            ORDER BY COUNT(v.FilmId) DESC
            LIMIT 3
        )
        -- Select unwatched films belonging to top genres
        SELECT uf.FilmId
        FROM UnwatchedFilms uf
            INNER JOIN Membership a ON uf.FilmId = a.FilmId
        WHERE a.GenreName IN (SELECT tgu.GenreName FROM TopGenresForUser tgu)
    );
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN FilmsByGenre;
    FETCH FilmsByGenre INTO filmCode;
    WHILE (NOT done) DO
        CALL AddToRecommended(_UserId, filmCode);
        FETCH FilmsByGenre INTO filmCode;
    END WHILE;
    CLOSE FilmsByGenre;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE RecommendFilmsByDirector(IN _UserId CHAR(14))
BEGIN
    DECLARE done BOOL DEFAULT FALSE;
    DECLARE filmCode INT DEFAULT NULL;

    DECLARE FilmsByDirector CURSOR FOR (
        -- Search for films not yet watched by the user to recommend
        WITH UnwatchedFilms AS (
            SELECT v.FilmId
            FROM Viewing v
            WHERE v.FilmId NOT IN (
                SELECT v1.FilmId FROM Viewing v1 WHERE v1.ProfileCode = _UserId
            )
        ),
        -- Select directors whose films the user rated >= 4 on average
        PreferredDirectors AS (
            SELECT p1.FiscalCode
            FROM CastMember c1
                INNER JOIN Participation p1 ON c1.FiscalCode = p1.FiscalCode
                INNER JOIN UserReview    r1 ON r1.FilmId = p1.FilmId
            WHERE r1.ProfileCode = _UserId
              AND c1.Role = 'Director'
            GROUP BY p1.FiscalCode
            HAVING AVG(r1.Score) >= 4
            ORDER BY COUNT(p1.FilmId) DESC
        )
        -- Select unwatched films directed by preferred directors
        SELECT DISTINCT uf.FilmId
        FROM UnwatchedFilms uf
            INNER JOIN Participation    p  ON uf.FilmId = p.FilmId
            INNER JOIN PreferredDirectors pd ON p.FiscalCode = pd.FiscalCode
        LIMIT 3
    );

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN FilmsByDirector;
    FETCH FilmsByDirector INTO filmCode;

    WHILE (NOT done) DO
        CALL AddToRecommended(_UserId, filmCode);
        FETCH FilmsByDirector INTO filmCode;
    END WHILE;
    CLOSE FilmsByDirector;
END $$
DELIMITER ;