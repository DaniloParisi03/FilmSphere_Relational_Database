use filmsphere;




INSERT INTO film (PaeseDiProduzione, AnnoDiUscita, Durata)
VALUES
    ('Italy', '1960-02-05', 145), -- La Dolce Vita - ID: 1
    ('France', '1959-05-04', 112), -- I 400 Colpi - ID: 2
    ('United States', '1984-06-01', 201), -- Once Upon a Time in America - ID: 3
    ('United States', '1979-08-15', 175), -- Apocalypse Now - ID: 4
    ('United States', '2007-12-26', 183), -- There Will Be Blood - ID: 5
    ('China', '2000-09-29', 197), -- In the Mood for Love - ID: 6
    ('China', '1994-09-14', 88), -- Chunking Express - ID: 7
    ('Russia', '1979-05-13', 190), -- Stalker - ID: 8
    ('United States', '2007-11-21', 160), -- No Country for Old Men - ID: 9
    ('United States', '1976-02-08', 102), -- Taxi Driver - ID: 10
    ('Sweden', '1966-10-18', 195), -- Persona - ID: 11
    ('Sweden', '1968-02-19', 85), -- L'Ora del Lupo - ID: 12
    ('Russia', '1975-03-07', 202), -- Lo Specchio - ID: 13
    ('United States', '1982-06-25', 168), -- The Thing - ID: 14
    ('United States', '1941-05-01', 120), -- Citizen Kane - ID: 15
    ('United States', '2017-12-25', 155), -- The Manster - ID: 16
    ('Spain', '1999-03-19', 175), -- Todo sobre mi madre - ID: 17
    ('Canada', '2010-09-17', 198), -- Incendies - ID: 18
    ('South Korea', '2019-05-21', 90), -- Parasite - ID: 19
    ('South Korea', '2003-05-02', 175), -- Memories of Murder - ID: 20
    ('Italy', '1966-12-23', 140), -- Il Buono, il Brutto e il Cattivo - ID: 21
    ('Italy', '1963-02-14', 80), -- 8 1/2 - ID: 22
    ('United Kingdom', '1971-12-19', 180), -- A Clockwork Orange - ID: 23
    ('United Kingdom', '1975-12-18', 150), -- Barry Lyndon - ID: 24
    ('United Kingdom', '1975-12-18', 175); -- 2001 Odissea nello spazio - ID: 25


# 15 registi
INSERT INTO casts (CodFiscale, Settore, Nome, Cognome)
VALUES
    ('ABC123XYZ4567890A', 'Regista', 'Woody', 'Allen'),
    ('DEF456UVW7890123B', 'Regista', 'Federico', 'Fellini'),
    ('GHI789LMN0123456C', 'Regista', 'François', 'Truffaut'),
    ('JKL012OPQ3456789D', 'Regista', 'Sergio', 'Leone'),
    ('MNO345PQR6789012E', 'Regista', 'Francis Ford', 'Coppola'),
    ('PQR678STU9012345F', 'Regista', 'Paul Thomas', 'Anderson'),
    ('STU901VWX2345678G', 'Regista', 'Wong', 'Kar-wai'),
    ('VWX234YZA5678901H', 'Regista', 'Andrei', 'Tarkovsky'),
    ('YZA567BCD8901234I', 'Regista', 'Joel', 'Coen'),
    ('BCD890EFG0123456J', 'Regista', 'Ethan', 'Coen'),
    ('EFG012HIJ3456789K', 'Regista', 'Martin', 'Scorsese'),
    ('HIJ345KLM6789012L', 'Regista', 'Ingmar', 'Bergman'),
    ('KLM678NOP9012345M', 'Regista', 'John', 'Carpenter'),
    ('NOP901QRS2345678N', 'Regista', 'Orson', 'Welles'),
    ('QRS234TUV5678901O', 'Regista', 'Pedro', 'Almodóvar'),
    ('TUV567WXY8901234P', 'Regista', 'Denis', 'Villeneuve'),
    ('WXY890ZAB0123456Q', 'Regista', 'Bong', 'Joon-ho'),
    ('ZAB012CDE3456789R', 'Regista', 'Stanley', 'Kubrick');
    
# 30 attori
INSERT INTO casts (CodFiscale, Settore, Nome, Cognome)
VALUES
    ('AAAAAA11B22C333D1', 'Attore', 'Marcello', 'Mastroianni'),
    ('BBBBBB22C33D44441', 'Attore', 'Jean-Pierre', 'Léaud'),
    ('CCCCC33D44E5555F1', 'Attore', 'Robert', 'De Niro'),
    ('DDDDDD44E55F66661', 'Attore', 'Martin', 'Sheen'),
    ('EEEEEE55F66G77771', 'Attore', 'Daniel', 'Day-Lewis'),
    ('FFFFFF66G77H88881', 'Attore', 'Tony', 'Leung'),
    ('GGGGGG77H88I99991', 'Attrice', 'Maggie', 'Cheung'),
    ('HHHHHH88I99J00001', 'Attrice', 'Brigitte', 'Lin'),
    ('IIIIII99J00K11111', 'Attore', 'Takeshi', 'Kaneshiro'),
    ('JJJJJJ00K11L22221', 'Attore', 'Aleksandr', 'Kaidanovsky'),
    ('KKKKK11L22M3333N1', 'Attore', 'Josh', 'Brolin'),
    ('LLLLL22M33N4444O1', 'Attore', 'Tommy', 'Lee Jones'),
    ('MMMMM33N44O5555P1', 'Attore', 'Javier', 'Bardem'),
    ('NNNNN44O55P6666Q1', 'Attrice', 'Liv', 'Ullmann'),
    ('OOOOO55P66Q7777R1', 'Attrice', 'Bibi', 'Andersson'),
    ('PPPPPP66Q77R88881', 'Attore', 'Max', 'von Sydow'),
    ('QQQQQQ77R88S99991', 'Attrice', 'Margarita', 'Terekhova'),
    ('RRRRRR88S99T00001', 'Attore', 'Kurt', 'Russell'),
    ('NOP901QRS2345678N', 'Attore', 'Orson', 'Welles'),
    ('TTTTTT00U11V22221', 'Attrice', 'Cecilia', 'Roth'),
    ('UUUUUU11V22W33331', 'Attrice', 'Lubna', 'Azabal'),
    ('VVVVVV22W33X44441', 'Attore', 'Song', 'Kang-ho'),
    ('WWWWWW33X44Y55551', 'Attore', 'Lee', 'Sun-kyun'),
    ('XXXXXXXX44Y55Z6A1', 'Attrice', 'Cho', 'Yeo-jeong'),
    ('CLNI45HI4534IPP55', 'Attore', 'Clint', 'Eastwood'),
    ('YYYYYYYY55Z66A7B1', 'Attore', 'Lee', 'Van Cleef'),
    ('ZZZZZZZZ66A77B8C1', 'Attore', 'Eli', 'Wallach'),
    ('AAAAAAAA77B88C9D1', 'Attore', 'Malcolm', 'McDowell'),
    ('BBBBBBBB88C99D0E1', 'Attore', 'Ryan', 'ONeal'),
    ('CCCCCCCC99D00E1F1', 'Attore', 'Keir', 'Dullea'),
    ('DDDD00E131F2222G1', 'Attore', 'Gary', 'Lockwood');

INSERT INTO Partecipazione (CodFiscale, Settore, Identificatore)
VALUES 
	# LA DOLCE VITA
	('DEF456UVW7890123B', 'Regista', 1),
	('AAAAAA11B22C333D1', 'Attore', 1),
	# I 400 Colpi
	('GHI789LMN0123456C', 'Regista', 2),
	('BBBBBB22C33D44441', 'Attore', 2),
	# Once Upon a Time in America
	('JKL012OPQ3456789D', 'Regista', 3),
	('CCCCC33D44E5555F1', 'Attore', 3),
	# Apocalypse Now
	('MNO345PQR6789012E', 'Regista', 4),
	('DDDDDD44E55F66661', 'Attore', 4),
	# There Will Be Blood
	('PQR678STU9012345F', 'Regista', 5),
	('EEEEEE55F66G77771', 'Attore', 5),
	# In the Mood for Love
	('STU901VWX2345678G', 'Regista', 6),
	('FFFFFF66G77H88881', 'Attore', 6),
	('GGGGGG77H88I99991', 'Attrice', 6),
	# Chunking Express
	('STU901VWX2345678G', 'Regista', 7),
	('FFFFFF66G77H88881', 'Attore', 7),
	('HHHHHH88I99J00001', 'Attrice', 7),
	('IIIIII99J00K11111', 'Attore', 7),
	# Stalker
	('VWX234YZA5678901H', 'Regista', 8),
	('JJJJJJ00K11L22221', 'Attore', 8),
	# No Country for Old Men
	('YZA567BCD8901234I', 'Regista', 9),
	('BCD890EFG0123456J', 'Regista', 9),
	('KKKKK11L22M3333N1', 'Attore', 9),
	('LLLLL22M33N4444O1', 'Attore', 9),
	('MMMMM33N44O5555P1', 'Attore', 9),
	# Taxi Driver
	('EFG012HIJ3456789K', 'Regista', 10),
	('CCCCC33D44E5555F1', 'Attore', 10),
	# Persona
	('HIJ345KLM6789012L', 'Regista', 11),
	('NNNNN44O55P6666Q1', 'Attrice', 11),
	('OOOOO55P66Q7777R1', 'Attrice', 11),
	# L'Ora del Lupo (Hour of the Wolf)
	('HIJ345KLM6789012L', 'Regista', 12),
	('NNNNN44O55P6666Q1', 'Attrice', 12),
	('PPPPPP66Q77R88881', 'Attore', 12),
	# Lo Specchio (The Mirror)
	('VWX234YZA5678901H', 'Regista', 13),
	('QQQQQQ77R88S99991', 'Attrice', 13),
	# The Thing
	('KLM678NOP9012345M', 'Regista', 14),
	('RRRRRR88S99T00001', 'Attore', 14),
	# Citizen Kane
	('NOP901QRS2345678N', 'Regista', 15),
	('NOP901QRS2345678N', 'Attore', 15),
    
	#  The Manster - ID: 16
	('PQR678STU9012345F', 'Regista', 16),
	# Todo Sobre Mi Madre (All About My Mother)
	('QRS234TUV5678901O', 'Regista', 17),
	('TTTTTT00U11V22221', 'Attrice', 17),
	# Incendies
	('TUV567WXY8901234P', 'Regista', 18),
	('UUUUUU11V22W33331', 'Attrice', 18),
	# Parasite
	('WXY890ZAB0123456Q', 'Regista', 19),
	('VVVVVV22W33X44441', 'Attore', 19),
	('WWWWWW33X44Y55551', 'Attore', 19),
	('XXXXXXXX44Y55Z6A1', 'Attrice', 19),
	# Memories of Murder
	('WXY890ZAB0123456Q', 'Regista', 20),
	('VVVVVV22W33X44441', 'Attore', 20),
	# Il Buono, il Brutto e il Cattivo (The Good, the Bad and the Ugly)
	('JKL012OPQ3456789D', 'Regista', 21),
	('CLNI45HI4534IPP55', 'Attore', 21),
	('YYYYYYYY55Z66A7B1', 'Attore', 21),
	('ZZZZZZZZ66A77B8C1', 'Attore', 21),
	# 8 1/2
	('DEF456UVW7890123B', 'Regista', 22),
	('AAAAAA11B22C333D1', 'Attore', 22),
	# A Clockwork Orange
	('ZAB012CDE3456789R', 'Regista', 23),
	('AAAAAAAA77B88C9D1', 'Attore', 23),
	# Barry Lyndon
	('ZAB012CDE3456789R', 'Regista', 24),
	('BBBBBBBB88C99D0E1', 'Attore', 24),
	# 2001: Odissea nello Spazio (2001: A Space Odyssey)
	('ZAB012CDE3456789R', 'Regista', 25),
	('CCCCCCCC99D00E1F1', 'Attore', 25),
	('DDDD00E131F2222G1', 'Attore', 25);

    
    
INSERT INTO DescrizioneFilm (Identificatore, NomeLingua, Titolo, Descrizione)
VALUES
    (1, 'Italian', 'La Dolce Vita', 'Un film italiano classico diretto da Federico Fellini.'),
    (1, 'English', 'The Sweet Life', 'A classic Italian film directed by Federico Fellini.'),
    (1, 'French', ' La douceur de vivre', 'Un film classique italien réalisé par Federico Fellini.'),
    (1, 'Russian', 'Сладкая жизнь', 'Классический итальянский фильм в режиссуре Федерико Феллини.'),
    (1, 'Korean', '달콤한 삶', '페데리코 펠리니 감독의 이탈리아 클래식 영화.'),
    
    (2, 'Italian', 'I 400 Colpi', 'Un film francese iconico diretto da François Truffaut.'),
    (2, 'English', 'the 400 blows', 'An iconic French film directed by François Truffaut.'),
    (2, 'French', 'Les 400 Coups', 'Un film emblématique français réalisé par François Truffaut.'),
    
    (3, 'Italian', 'C''era una volta in America', 'Un epico film americano diretto da Sergio Leone.'),
    (3, 'English', 'Once Upon a Time in America', 'An epic American film directed by Sergio Leone.'),
    (3, 'Russian', 'Имало едно време в Америка', 'Эпический американский фильм в режиссуре Серджио Леоне.'),
    (3, 'Korean', '원스 어폰 어 타임 인 아메리카', '세르지오 레오네 감독의 서사 시대극.'),
    (3, 'French', 'Il était une fois en Amérique', 'Un film épique américain réalisé par Sergio Leone.'),
    
    (4, 'Italian', 'Apocalypse Now', 'Un capolavoro bellico diretto da Francis Ford Coppola.'),
    (4, 'English', 'Apocalypse Now', 'A war masterpiece directed by Francis Ford Coppola.'),
    
    (5, 'Italian', 'Il Petroliere', 'Un dramma americano diretto da Paul Thomas Anderson.'),
    (5, 'English', 'There Will Be Blood', 'An American drama directed by Paul Thomas Anderson.'),
    
    (6, 'Italian', 'In the Mood for Love', 'Un film romantico cinese diretto da Wong Kar-wai.'),
    (6, 'English', 'In the Mood for Love', 'A Chinese romantic film directed by Wong Kar-wai.'),
    
    (7, 'Italian', 'Hong Kong Exspress', 'Un film drammatico cinese diretto da Wong Kar-wai.'),
    (7, 'English', 'Chungking Express', 'A Chinese drama film directed by Wong Kar-wai.'),
    (7, 'Russian', 'Чунгкинг Экспресс', 'Драматический китайский фильм в режиссуре Вонг Кар-вая.'),
    (7, 'Korean', '충칭 익스프레스', '봉 카와이 감독의 중국 드라마 영화.'),
    (7, 'French', 'Chungking Express', 'Un film dramatique chinois réalisé par Wong Kar-wai.'),
    
    (8, 'Russian', 'Сталкер', 'Шедевр российского кинематографа, режиссёр Андрей Тарковский.'),
    (8, 'English', 'Stalker', 'A masterpiece of Russian cinema, directed by Andrei Tarkovsky.'),
    
    (9, 'Italian', 'Non è un Paese per Vecchi', 'Un thriller americano diretto dai fratelli Coen.'),
    (9, 'English', 'No Country for Old Men', 'An American thriller directed by the Coen brothers.'),
    
    (10, 'Italian', 'Taxi Driver', 'Un classico americano diretto da Martin Scorsese.'),
    (10, 'English', 'Taxi Driver', 'An American classic directed by Martin Scorsese.'),
    
    (11, 'Italian', 'Persona', 'Un film svedese diretto da Ingmar Bergman.'),
    (11, 'English', 'Persona', 'A Swedish film directed by Ingmar Bergman.'),
    
    (12, 'Italian', 'L''Ora del Lupo', 'Un film svedese diretto da Ingmar Bergman.'),
    (12, 'English', 'Hour of the Wolf', 'A Swedish film directed by Ingmar Bergman.'),
    
    (13, 'Italian', 'Lo Specchio', 'Un film svedese diretto da Andrei Tarkovsky.'),
    (13, 'English', 'The Mirror', 'A Swedish film directed by Andrei Tarkovsky.'),
    
    (14, 'Italian', 'La Cosa', 'Un film americano di fantascienza diretto da John Carpenter.'),
    (14, 'English', 'The Thing', 'An American science fiction film directed by John Carpenter.'),
    
    (15, 'Italian', 'Quarto Potere', 'Un classico americano diretto da Orson Welles.'),
    (15, 'English', 'Citizen Kane', 'An American classic directed by Orson Welles.'),
    
    (16, 'Italian', 'The Manster', 'Un film americano di fantascienza '),
    (16, 'English', 'The Manster', 'An American science fiction film '),
    
    (17, 'Italian', 'Tutto su mia madre', 'Un film spagnolo diretto da Pedro Almodóvar.'),
    (17, 'English', 'All About My Mother', 'A Spanish film directed by Pedro Almodóvar.'),
    
    (18, 'Italian', 'La donna che canta', 'Un film canadese diretto da Denis Villeneuve.'),
    (18, 'English', 'Incendies', 'A Canadian film directed by Denis Villeneuve.'),
    
    (19, 'Italian', 'Parasite', 'Un film sudcoreano diretto da Bong Joon-ho.'),
    (19, 'English', 'Parasite', 'A South Korean film directed by Bong Joon-ho.'),
    
    (20, 'Italian', 'Memorie di un assassino', 'Un film sudcoreano diretto da Bong Joon-ho.'),
    (20, 'English', 'Memories of Murder', 'A South Korean film directed by Bong Joon-ho.'),
    
    (21, 'Italian', 'Il Buono, il Brutto, il Cattivo', 'Un classico italiano diretto da Sergio Leone.'),
    (21, 'English', 'The Good, the Bad and the Ugly', 'An Italian classic directed by Sergio Leone.'),
    
    (22, 'Italian', '8 1/2', 'Un film italiano diretto da Federico Fellini.'),
    (22, 'English', '8 1/2', 'An Italian film directed by Federico Fellini.'),
    
    (23, 'Italian', 'Arancia Meccanica', 'Un film britannico diretto da Stanley Kubrick.'),
    (23, 'English', 'A Clockwork Orange', 'A British film directed by Stanley Kubrick.'),
    
    (24, 'Italian', 'Barry Lyndon', 'Un film britannico diretto da Stanley Kubrick.'),
    (24, 'English', 'Barry Lyndon', 'A British film directed by Stanley Kubrick.'),
    
    (25, 'Italian', '2001: Odissea nello spazio', 'Un film britannico diretto da Stanley Kubrick.'),
    (25, 'English', '2001: A Space Odyssey', 'A British film directed by Stanley Kubrick.');

INSERT INTO PremioFilm (Nome, Tipo)
VALUES
    ('Oscar', 'Miglior Film'),
    ('Golden Globe', 'Miglior Film'),
    ('Cannes Film Festival', 'Miglior Film'),
    ('Grammy', 'Miglior Film'),
    ('Venice Film Festival',  'Miglior Film'),

	('Oscar', 'Miglior Film Straniero'),
    ('Golden Globe','Miglior Film Straniero'),
    ('Cannes Film Festival', 'Miglior Film Straniero'),
    ('Grammy', 'Miglior Film Straniero'),
    ('Venice Film Festival',  'Miglior Film Straniero'),
    
    ('Oscar', 'Miglior Colonna Sonora'),
    ('Golden Globe', 'Miglior Colonna Sonora'),
    ('Cannes Film Festival', 'Miglior Colonna Sonora'),
    ('Grammy', 'Miglior Colonna Sonora'),
	('Venice Film Festival', 'Miglior Colonna Sonora'),

    ('Oscar', 'Miglior Film Straniero'),
    ('Golden Globe', 'Miglior Film Straniero'),
	('Cannes Film Festival', 'Miglior Film Straniero'),
    ('Grammy', 'Miglior Film Straniero'),
	('Venice Film Festival', 'Miglior Film Straniero'),
   
	('Oscar','Miglior Sceneggiatura'),
    ('Golden Globe', 'Miglior Sceneggiatura'),
	('Cannes Film Festival', 'Miglior Sceneggiatura'),
    ('Grammy', 'Miglior Sceneggiatura'),
	('Venice Film Festival', 'Miglior Sceneggiatura');

INSERT INTO PremiazioneFilm (Nome, Tipo, Identificatore)
VALUES
    ('Cannes Film Festival', 'Miglior Film', 1),
    ('Venice Film Festival', 'Miglior Film Straniero', 2),
    ('Oscar', 'Miglior Colonna Sonora', 3),
    ('Golden Globe', 'Miglior Film', 3),
    ('Cannes Film Festival', 'Miglior Film', 4),
    ('Golden Globe', 'Miglior Film', 5),
    ('Cannes Film Festival', 'Miglior Film Straniero', 6),
    ('Cannes Film Festival', 'Miglior Sceneggiatura', 7),
    ('Venice Film Festival', 'Miglior Sceneggiatura', 7),
    ('Cannes Film Festival', 'Miglior Sceneggiatura', 8),
    ('Oscar', 'Miglior Film', 9),
    ('Oscar', 'Miglior Film Straniero', 13),
    ('Grammy', 'Miglior Film', 14),
    ('Grammy', 'Miglior Film', 14),
    ('Oscar', 'Miglior Film', 15),
    ('Golden Globe', 'Miglior Film', 15),
    ('Venice Film Festival', 'Miglior Film Straniero', 16),
    ('Oscar', 'Miglior Film Straniero', 18),
    ('Golden Globe', 'Miglior Colonna Sonora', 18),
    ('Oscar', 'Miglior Colonna Sonora', 20),
    ('Golden Globe', 'Miglior Colonna Sonora', 20),
    ('Venice Film Festival', 'Miglior Film', 21);

INSERT INTO PremioCast(Nome, Tipo)
VALUES
    ('Oscar', 'Miglior Regia'),
    ('Golden Globe', 'Miglior Regia'),
    ('Cannes Film Festival', 'Miglior Regia'),
    ('Grammy', 'Miglior Regia'),
    ('Venice Film Festival', 'Miglior Regia'),

	('Oscar', 'Miglior Attore Protagonista'),
    ('Golden Globe','Miglior Attore Protagonista'),
    ('Cannes Film Festival', 'Miglior Attore Protagonista'),
    ('Grammy', 'Miglior Attore Protagonista'),
    ('Venice Film Festival',  'Miglior Attore Protagonista'),
    
    ('Oscar',  'Miglior Attore Secondario'),
    ('Golden Globe', 'Miglior Attore Secondario'),
    ('Cannes Film Festival',  'Miglior Attore Secondario'),
    ('Grammy',  'Miglior Attore Secondario'),
	('Venice Film Festival',  'Miglior Attore Secondario')
    ;

INSERT INTO PremiazioneCast (Nome, Tipo, AnnoVittoria, CodFiscale, Settore)
SELECT
    lp.Nome,
    lp.Tipo,
	FLOOR(AnnoMinFilm + RAND() * (AnnoMaxFilm - AnnoMinFilm + 1))  AS AnnoVittoria,
    c.CodFiscale,
    c.Settore
FROM
    (SELECT DISTINCT Nome, Tipo FROM ListaPremiCast WHERE RAND() < 0.65 and nome not like "%regia" ORDER BY RAND() LIMIT 5) AS lp cross join
    (SELECT c1.CodFiscale, c1.Settore,  max(f.AnnoUscita) AS AnnoMaxFilm, Min(f.AnnoUscita) AS AnnoMinFilm 
		from casts c1 natural join partecipare p natural join film f
		WHERE RAND() < 0.75 and c1.settore = 'attore'
		group by c.CodFiscale 
        order BY RAND() LIMIT 5) AS c;
 

 # Inserisci i generi nella tabella "Genere" (inclusi "Animation", "Mystery" e "Western")
INSERT INTO Genere (NomeGenere)
VALUES
    ('Action'),
    ('Comedy'),
    ('Drama'),
    ('Horror'),
    ('Sci-Fi'),
    ('Fantasy'),
    ('Romance'),
    ('Thriller'),
    ('Adventure'),
    ('Animation'),
    ('Mystery'),
    ('Western');
   
   -- Inserimento dati nella tabella Appartenenza
INSERT INTO Appartenenza (NomeGenere, Identificatore)
VALUES
    ('Drama', 1), -- La Dolce Vita
    ('Drama', 2), -- I 400 Colpi
    ('Crime', 3), -- Once Upon a Time in America
    ('Drama', 4), -- Apocalypse Now
    ('Drama', 5), -- There Will Be Blood
    ('Drama', 6), -- In the Mood for Love
    ('Romance', 6),
    ('Drama', 7), -- Chungking Express
    ('Romance', 7),
    ('Drama', 8), -- Stalker
    ('Sci-Fi', 8),
    ('Crime', 9), -- No Country for Old Men
	('Western', 9),
    ('Drama', 10), -- Taxi Driver
    ('Thriller', 10),
    ('Drama', 11), -- Persona
    ('Drama', 12), -- L'ora del Lupo
    ('Fantasy', 12),
    ('Drama', 13), -- Lo Specchio
    ('Sci-Fi', 14), -- The Thing
    ('Horror', 14),
    ('Mystery', 14),
    ('Drama', 15), -- Citizen Kane
    ('Horror', 16), -- The Manster
    ('Comedy', 17), -- Todo sobre mi madre
    ('Drama', 18), -- Incendies
    ('Crime', 18),
    ('Drama', 19), -- Parasite
    ('Crime', 19),
    ('Mystery', 19),
    ('Drama', 20), -- Memories of Murder
    ('Crime', 20),
    ('Mystery', 20),
    ('Western', 21), -- Il Buono, il Brutto e il Cattivo
    ('Drama', 22), -- 8 1/2
    ('Crime', 22),
    ('Drama', 23), -- A Clockwork Orange
    ('Drama', 24), -- Barry Lyndon
    ('Adventure', 24),
    ('Sci-Fi', 25), -- 2001: Odissea nello Spazio
    ('Adventure', 25);