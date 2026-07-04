use filmsphere;


INSERT INTO Participation (FiscalCode, Role, FilmId)
VALUES 
    -- LA DOLCE VITA
    ('DEF456UVW7890123B', 'Director', 1),
    ('AAAAAA11B22C333D1', 'Actor', 1),
    -- I 400 Colpi
    ('GHI789LMN0123456C', 'Director', 2),
    ('BBBBBB22C33D44441', 'Actor', 2),
    -- Once Upon a Time in America
    ('JKL012OPQ3456789D', 'Director', 3),
    ('CCCCC33D44E5555F1', 'Actor', 3),
    -- Apocalypse Now
    ('MNO345PQR6789012E', 'Director', 4),
    ('DDDDDD44E55F66661', 'Actor', 4),
    -- There Will Be Blood
    ('PQR678STU9012345F', 'Director', 5),
    ('EEEEEE55F66G77771', 'Actor', 5),
    -- In the Mood for Love
    ('STU901VWX2345678G', 'Director', 6),
    ('FFFFFF66G77H88881', 'Actor', 6),
    ('GGGGGG77H88I99991', 'Actor', 6),
    -- Chunking Express
    ('STU901VWX2345678G', 'Director', 7),
    ('FFFFFF66G77H88881', 'Actor', 7),
    ('HHHHHH88I99J00001', 'Actor', 7),
    ('IIIIII99J00K11111', 'Actor', 7),
    -- Stalker
    ('VWX234YZA5678901H', 'Director', 8),
    ('JJJJJJ00K11L22221', 'Actor', 8),
    -- No Country for Old Men
    ('YZA567BCD8901234I', 'Director', 9),
    ('BCD890EFG0123456J', 'Director', 9),
    ('KKKKK11L22M3333N1', 'Actor', 9),
    ('LLLLL22M33N4444O1', 'Actor', 9),
    ('MMMMM33N44O5555P1', 'Actor', 9),
    -- Taxi Driver
    ('EFG012HIJ3456789K', 'Director', 10),
    ('CCCCC33D44E5555F1', 'Actor', 10),
    -- Persona
    ('HIJ345KLM6789012L', 'Director', 11),
    ('NNNNN44O55P6666Q1', 'Actor', 11),
    ('OOOOO55P66Q7777R1', 'Actor', 11),
    -- L'Ora del Lupo (Hour of the Wolf)
    ('HIJ345KLM6789012L', 'Director', 12),
    ('NNNNN44O55P6666Q1', 'Actor', 12),
    ('PPPPPP66Q77R88881', 'Actor', 12),
    -- Lo Specchio (The Mirror)
    ('VWX234YZA5678901H', 'Director', 13),
    ('QQQQQQ77R88S99991', 'Actor', 13),
    -- The Thing
    ('KLM678NOP9012345M', 'Director', 14),
    ('RRRRRR88S99T00001', 'Actor', 14),
    -- Citizen Kane
    ('NOP901QRS2345678N', 'Director', 15),
    ('NOP901QRS2345678N', 'Actor', 15),
    -- The Manster
    ('PQR678STU9012345F', 'Director', 16),
    -- Todo Sobre Mi Madre (All About My Mother)
    ('QRS234TUV5678901O', 'Director', 17),
    ('TTTTTT00U11V22221', 'Actor', 17),
    -- Incendies
    ('TUV567WXY8901234P', 'Director', 18),
    ('UUUUUU11V22W33331', 'Actor', 18),
    -- Parasite
    ('WXY890ZAB0123456Q', 'Director', 19),
    ('VVVVVV22W33X44441', 'Actor', 19),
    ('WWWWWW33X44Y55551', 'Actor', 19),
    ('XXXXXXXX44Y55Z6A1', 'Actor', 19),
    -- Memories of Murder
    ('WXY890ZAB0123456Q', 'Director', 20),
    ('VVVVVV22W33X44441', 'Actor', 20),
    -- Il Buono, il Brutto e il Cattivo (The Good, the Bad and the Ugly)
    ('JKL012OPQ3456789D', 'Director', 21),
    ('CLNI45HI4534IPP55', 'Actor', 21),
    ('YYYYYYYY55Z66A7B1', 'Actor', 21),
    ('ZZZZZZZZ66A77B8C1', 'Actor', 21),
    -- 8 1/2
    ('DEF456UVW7890123B', 'Director', 22),
    ('AAAAAA11B22C333D1', 'Actor', 22),
    -- A Clockwork Orange
    ('ZAB012CDE3456789R', 'Director', 23),
    ('AAAAAAAA77B88C9D1', 'Actor', 23),
    -- Barry Lyndon
    ('ZAB012CDE3456789R', 'Director', 24),
    ('BBBBBBBB88C99D0E1', 'Actor', 24),
    -- 2001: Odissea nello Spazio (2001: A Space Odyssey)
    ('ZAB012CDE3456789R', 'Director', 25),
    ('CCCCCCCC99D00E1F1', 'Actor', 25),
    ('DDDD00E131F2222G1', 'Actor', 25);
    
    
INSERT INTO FilmDescription (FilmId, LanguageName, Title, Description)
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

-- Actors
INSERT INTO CastAwarding (Name, Type, WinYear, FiscalCode, Role)
VALUES
    ('Oscar', 'Best Lead Actor', '2021-01-05', 'AAAAAA11B22C333D1', 'Actor'),
    ('Golden Globe', 'Best Lead Actor', '2021-03-19', 'BBBBBB22C33D44441', 'Actor'),
    ('Cannes Film Festival', 'Best Lead Actor', '2021-05-28', 'CCCCC33D44E5555F1', 'Actor'),
    ('Grammy', 'Best Lead Actor', '2021-07-11', 'DDDDDD44E55F66661', 'Actor'),
    ('Venice Film Festival', 'Best Lead Actor', '2021-11-09', 'EEEEEE55F66G77771', 'Actor'),
    ('Oscar', 'Best Supporting Actor', '2021-01-15', 'FFFFFF66G77H88881', 'Actor'),
    ('Golden Globe', 'Best Supporting Actor', '2021-03-23', 'GGGGGG77H88I99991', 'Actor'),
    ('Cannes Film Festival', 'Best Supporting Actor', '2021-05-30', 'HHHHHH88I99J00001', 'Actor'),
    ('Grammy', 'Best Supporting Actor', '2021-07-14', 'IIIIII99J00K11111', 'Actor'),
    ('Venice Film Festival', 'Best Supporting Actor', '2021-11-12', 'JJJJJJ00K11L22221', 'Actor'),
    ('Oscar', 'Best Lead Actor', '2022-02-17', 'KKKKK11L22M3333N1', 'Actor'),
    ('Golden Globe', 'Best Lead Actor', '2022-04-09', 'LLLLL22M33N4444O1', 'Actor'),
    ('Cannes Film Festival', 'Best Lead Actor', '2022-06-30', 'MMMMM33N44O5555P1', 'Actor'),
    ('Grammy', 'Best Lead Actor', '2022-08-14', 'NNNNN44O55P6666Q1', 'Actor'),
    ('Venice Film Festival', 'Best Lead Actor', '2022-10-22', 'OOOOO55P66Q7777R1', 'Actor'),
    ('Oscar', 'Best Supporting Actor', '2022-02-22', 'PPPPPP66Q77R88881', 'Actor'),
    ('Golden Globe', 'Best Supporting Actor', '2022-04-11', 'QQQQQQ77R88S99991', 'Actor'),
    ('Cannes Film Festival', 'Best Supporting Actor', '2022-06-25', 'RRRRRR88S99T00001', 'Actor'),
    ('Grammy', 'Best Supporting Actor', '2022-08-19', 'NOP901QRS2345678N', 'Actor'),
    ('Venice Film Festival', 'Best Supporting Actor', '2022-10-30', 'TTTTTT00U11V22221', 'Actor'),
    ('Oscar', 'Best Lead Actor', '2023-03-15', 'UUUUUU11V22W33331', 'Actor'),
    ('Golden Globe', 'Best Lead Actor', '2023-05-22', 'VVVVVV22W33X44441', 'Actor'),
    ('Cannes Film Festival', 'Best Lead Actor', '2023-07-10', 'WWWWWW33X44Y55551', 'Actor'),
    ('Grammy', 'Best Lead Actor', '2023-09-28', 'XXXXXXXX44Y55Z6A1', 'Actor'),
    ('Venice Film Festival', 'Best Lead Actor', '2023-11-03', 'CLNI45HI4534IPP55', 'Actor'),
    ('Oscar', 'Best Supporting Actor', '2023-03-20', 'YYYYYYYY55Z66A7B1', 'Actor'),
    ('Golden Globe', 'Best Supporting Actor', '2023-05-25', 'ZZZZZZZZ66A77B8C1', 'Actor'),
    ('Cannes Film Festival', 'Best Supporting Actor', '2023-07-15', 'AAAAAAAA77B88C9D1', 'Actor'),
    ('Grammy', 'Best Supporting Actor', '2023-09-30', 'BBBBBBBB88C99D0E1', 'Actor'),
    ('Venice Film Festival', 'Best Supporting Actor', '2023-11-08', 'CCCCCCCC99D00E1F1', 'Actor');

-- Directors
INSERT INTO CastAwarding (Name, Type, WinYear, FiscalCode, Role)
VALUES
	('Oscar', 'Best Director', '2022-05-15', 'ABC123XYZ4567890A', 'Director'),
	('Golden Globe', 'Best Director', '2021-02-10', 'DEF456UVW7890123B', 'Director'),
	('Cannes Film Festival', 'Best Director', '2023-07-20', 'GHI789LMN0123456C', 'Director'),
	('Grammy', 'Best Director', '2022-11-30', 'JKL012OPQ3456789D', 'Director'),
	('Venice Film Festival', 'Best Director', '2023-09-25', 'MNO345PQR6789012E', 'Director'),
	('Oscar', 'Best Director', '2021-03-18', 'PQR678STU9012345F', 'Director'),
	('Golden Globe', 'Best Director', '2023-04-05', 'STU901VWX2345678G', 'Director'),
	('Cannes Film Festival', 'Best Director', '2022-06-10', 'VWX234YZA5678901H', 'Director'),
	('Grammy', 'Best Director', '2021-07-22', 'YZA567BCD8901234I', 'Director'),
	('Venice Film Festival', 'Best Director', '2023-10-17', 'BCD890EFG0123456J', 'Director'),
	('Oscar', 'Best Director', '2022-03-05', 'EFG012HIJ3456789K', 'Director'),
	('Golden Globe', 'Best Director', '2023-05-29', 'HIJ345KLM6789012L', 'Director'),
	('Cannes Film Festival', 'Best Director', '2021-08-12', 'KLM678NOP9012345M', 'Director'),
	('Grammy', 'Best Director', '2023-09-02', 'NOP901QRS2345678N', 'Director'),
	('Venice Film Festival', 'Best Director', '2022-11-08', 'QRS234TUV5678901O', 'Director'),
	('Oscar', 'Best Director', '2021-03-25', 'TUV567WXY8901234P', 'Director'),
	('Golden Globe', 'Best Director', '2022-04-14', 'WXY890ZAB0123456Q', 'Director'),
	('Cannes Film Festival', 'Best Director', '2023-07-01', 'ZAB012CDE3456789R', 'Director');

   -- Inserting data into the Membership table
INSERT INTO Membership (GenreName, FilmId)
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
INSERT INTO VideoRestriction (VideoCode, StateIP)
VALUES
    ('VID12345678901234', 11110000),
    ('VID98765432109876', 11110000),
    ('VID45678901234567', 22220000),
    ('VID12309876543210', 22220000),
    ('VID12345678901234', 33330000),
    ('VID98765432109876', 33330000),
    ('VID78901234567890', 44440000),
    ('VID98765432109876', 44440000),
    ('VID12309876543210', 55550000),
    ('VID45678901234567', 55550000),
    ('VID45678901234567', 66660000),
    ('VID78901234567890', 66660000),
    ('VID12345678901234', 77770000),
    ('VID98765432109876', 77770000),
    ('VID12345678901234', 88880000),
    ('VID98765432109876', 88880000),
    ('VID12345678901234', 99990000),
    ('VID78901234567890', 99990000),
    ('VID12345678901234', 12120000),
    ('VID21098765432109', 12120000);
    
INSERT INTO AudioRestriction (AudioCode, StateIP)
VALUES
    ('AUD12345678901234', 11110000),
    ('AUD98765432109876', 11110000),
    ('AUD45678901234567', 22220000),
    ('AUD34567890123456', 22220000),
    ('AUD12345678901234', 33330000),
    ('AUD98765432109876', 33330000),
    ('AUD78901234567890', 44440000),
    ('AUD98765432109876', 44440000),
    ('AUD34567890123456', 55550000),
    ('AUD45678901234567', 55550000),
    ('AUD45678901234567', 66660000),
    ('AUD78901234567890', 66660000),
    ('AUD12345678901234', 77770000),
    ('AUD98765432109876', 77770000),
    ('AUD12345678901234', 88880000),
    ('AUD98765432109876', 88880000),
    ('AUD12345678901234', 99990000),
    ('AUD78901234567890', 99990000),
    ('AUD12345678901234', 12120000),
    ('AUD56789012345678', 12120000);


INSERT INTO Format (FilmId, AudioCode, VideoCode, ReleaseDate, FileSize)
VALUES
    (1, 'AUD12345678901234', 'VID12345678901234', '1959-01-01', 1.75), -- Example with size in GB < 2
    (1, 'AUD45678901234567', 'VID45678901234567', '1959-01-01', 2.1),  -- Example with size in GB > 2
    (1, 'AUD56789012345678', 'VID21098765432109', '1959-01-01', 0.601), -- Example with size in megabit > 0.600
    (2, 'AUD98765432109876', 'VID98765432109876', '1958-01-01', 1.95),
    (2, 'AUD34567890123456', 'VID78901234567890', '1958-01-01', 0.85),
    (2, 'AUD78901234567890', 'VID21098765432109', '1958-01-01', 2.3),
    (3, 'AUD12345678901234', 'VID21098765432109', '1983-01-01', 1.2),
    (3, 'AUD98765432109876', 'VID12309876543210', '1983-01-01', 3.0),
    (3, 'AUD45678901234567', 'VID78901234567890', '1983-01-01', 0.75),
    (4, 'AUD34567890123456', 'VID98765432109876', '1979-01-01', 2.5),
    (4, 'AUD56789012345678', 'VID12309876543210', '1979-01-01', 1.05),
    (4, 'AUD78901234567890', 'VID21098765432109', '1979-01-01', 1.8),
    (5, 'AUD12345678901234', 'VID12345678901234', '2007-12-26', 1.6),
    (5, 'AUD45678901234567', 'VID45678901234567', '2007-12-26', 2.8),
    (5, 'AUD56789012345678', 'VID21098765432109', '2007-12-26', 0.95),
    (6, 'AUD98765432109876', 'VID98765432109876', '2000-09-29', 1.2),
    (6, 'AUD34567890123456', 'VID78901234567890', '2000-09-29', 2.4),
    (6, 'AUD78901234567890', 'VID21098765432109', '2000-09-29', 0.7),
    (7, 'AUD12345678901234', 'VID12345678901234', '1994-09-14', 1.8),
    (7, 'AUD45678901234567', 'VID45678901234567', '1994-09-14', 2.6),
    (7, 'AUD56789012345678', 'VID21098765432109', '1994-09-14', 0.63),
    (8, 'AUD34567890123456', 'VID98765432109876', '1979-05-13', 1.9),
    (8, 'AUD56789012345678', 'VID12309876543210', '1979-05-13', 2.2),
    (8, 'AUD78901234567890', 'VID21098765432109', '1979-05-13', 0.59),
    (9, 'AUD12345678901234', 'VID12345678901234', '2007-11-21', 1.4),
    (9, 'AUD98765432109876', 'VID98765432109876', '2007-11-21', 2.1),
    (9, 'AUD45678901234567', 'VID78901234567890', '2007-11-21', 0.45),
    (10, 'AUD98765432109876', 'VID98765432109876', '1976-02-08', 2.3),
    (10, 'AUD34567890123456', 'VID78901234567890', '1976-02-08', 1.15),
    (10, 'AUD78901234567890', 'VID21098765432109', '1976-02-08', 0.78),
    (11, 'AUD12345678901234', 'VID12345678901234', '1966-10-18', 1.9),
    (11, 'AUD45678901234567', 'VID45678901234567', '1966-10-18', 1.25),
    (11, 'AUD56789012345678', 'VID21098765432109', '1966-10-18', 2.05),
    (12, 'AUD34567890123456', 'VID98765432109876', '1968-02-19', 2.6),
    (12, 'AUD56789012345678', 'VID12309876543210', '1968-02-19', 0.7),
    (12, 'AUD78901234567890', 'VID21098765432109', '1968-02-19', 1.35),
    (13, 'AUD12345678901234', 'VID12345678901234', '1975-03-07', 1.1),
    (13, 'AUD45678901234567', 'VID45678901234567', '1975-03-07', 2.9),
    (13, 'AUD56789012345678', 'VID21098765432109', '1975-03-07', 0.88),
    (14, 'AUD34567890123456', 'VID98765432109876', '1982-06-25', 1.75),
    (14, 'AUD56789012345678', 'VID12309876543210', '1982-06-25', 2.3),
    (14, 'AUD78901234567890', 'VID21098765432109', '1982-06-25', 0.68),
    (15, 'AUD12345678901234', 'VID12345678901234', '1941-05-01', 1.3),
    (15, 'AUD45678901234567', 'VID45678901234567', '1941-05-01', 2.4),
    (15, 'AUD56789012345678', 'VID21098765432109', '1941-05-01', 0.77),
    (16, 'AUD34567890123456', 'VID98765432109876', '1999-03-19', 1.8),
    (16, 'AUD56789012345678', 'VID12309876543210', '1999-03-19', 2.1),
    (16, 'AUD78901234567890', 'VID21098765432109', '1999-03-19', 0.62),
    (17, 'AUD12345678901234', 'VID12345678901234', '2010-09-17', 1.7),
    (17, 'AUD45678901234567', 'VID45678901234567', '2010-09-17', 2.2),
    (17, 'AUD56789012345678', 'VID21098765432109', '2010-09-17', 0.58),
    (18, 'AUD34567890123456', 'VID98765432109876', '2019-05-21', 1.6),
    (18, 'AUD56789012345678', 'VID12309876543210', '2019-05-21', 2.7),
    (18, 'AUD78901234567890', 'VID21098765432109', '2019-05-21', 0.95),
    (19, 'AUD12345678901234', 'VID12345678901234', '2003-05-02', 1.4),
    (19, 'AUD45678901234567', 'VID45678901234567', '2003-05-02', 2.9),
    (19, 'AUD56789012345678', 'VID21098765432109', '2003-05-02', 0.75),
    (20, 'AUD34567890123456', 'VID98765432109876', '1966-12-23', 1.9),
    (20, 'AUD56789012345678', 'VID12309876543210', '1966-12-23', 1.2),
    (20, 'AUD78901234567890', 'VID21098765432109', '1966-12-23', 2.1),
    (21, 'AUD12345678901234', 'VID12345678901234', '1963-02-14', 1.5),
    (21, 'AUD45678901234567', 'VID45678901234567', '1963-02-14', 2.8),
    (21, 'AUD56789012345678', 'VID21098765432109', '1963-02-14', 0.68),
    (22, 'AUD98765432109876', 'VID98765432109876', '1971-12-19', 2.2),
    (22, 'AUD34567890123456', 'VID45678901234567', '1971-12-19', 1.4),
    (22, 'AUD78901234567890', 'VID21098765432109', '1971-12-19', 0.89),
    (23, 'AUD12345678901234', 'VID12345678901234', '1975-12-18', 1.6),
    (23, 'AUD45678901234567', 'VID45678901234567', '1975-12-18', 2.3),
    (23, 'AUD56789012345678', 'VID21098765432109', '1975-12-18', 0.75),
    (24, 'AUD34567890123456', 'VID98765432109876', '1975-12-18', 1.8),
    (24, 'AUD56789012345678', 'VID45678901234567', '1975-12-18', 2.6),
    (24, 'AUD78901234567890', 'VID21098765432109', '1975-12-18', 0.68),
    (25, 'AUD12345678901234', 'VID12345678901234', '1975-12-18', 3.0),
    (25, 'AUD98765432109876', 'VID45678901234567', '1975-12-18', 1.4),
    (25, 'AUD34567890123456', 'VID12309876543210', '1975-12-18', 2.1);

INSERT INTO VideoVersion (CodecName, DistributionDate, VideoCode)
VALUES
    ('H.264', '2003-07-15', 'VID12345678901234'),
    ('VP9', '2013-09-12', 'VID98765432109876'),
    ('H.265', '2013-03-23', 'VID45678901234567'),
    ('MPEG-2', '1995-11-30', 'VID78901234567890'),
    ('H.264', '2003-07-15', 'VID12309876543210'),
    ('VP9', '2013-09-12', 'VID21098765432109'),
    ('H.265', '2013-03-23', 'VID12345678901234'),
    ('MPEG-2', '1995-11-30', 'VID98765432109876');

-- Insertions into the AudioVersion table
INSERT INTO AudioVersion (CodecName, DistributionDate, AudioCode)
VALUES
    ('AAC', '2020-01-15', 'AUD12345678901234'),
    ('MP3', '2000-05-20', 'AUD98765432109876'),
    ('Dolby Digital', '1992-03-10', 'AUD12345678901234'),
    ('DTS', '1993-12-05', 'AUD98765432109876'),
    ('FLAC', '2001-08-30', 'AUD78901234567890'),
    ('AC-3', '1992-05-12', 'AUD12345678901234');
    
    -- Inserting film language data (dubbing)
INSERT INTO Dubbing (FilmId, LanguageName)
VALUES
    (1, 'Italian'), (1, 'English'),
    (2, 'French'), (2, 'English'),
    (3, 'English'),
    (4, 'English'),
    (5, 'English'),
    (6, 'Chinese'), (6, 'English'),
    (7, 'Chinese'), (7, 'English'),
    (8, 'Russian'), (8, 'English'),
    (9, 'English'),
    (10, 'English'),
    (11, 'Swedish'), (11, 'English'),
    (12, 'Swedish'), (12, 'English'),
    (13, 'Russian'), (13, 'English'),
    (14, 'English'),
    (15, 'English'),
    (16, 'English'),
    (17, 'Spanish'),
    (18, 'French'), (18, 'English'),
    (19, 'Korean'), (19, 'English'),
    (20, 'Korean'), (20, 'English'),
    (21, 'Italian'), (21, 'English'),
    (22, 'Italian'), (22, 'English'),
    (23, 'English'),
    (24, 'English'),
    (25, 'English');

    
  -- Inserting subtitle languages for each film (4 languages per pair)
INSERT INTO Subtitle (FilmId, LanguageName)
VALUES
    (1, 'Italian'), (1, 'English'), (1, 'Spanish'), (1, 'French'),
    (2, 'French'), (2, 'English'), (2, 'Spanish'), (2, 'Swedish'),
    (3, 'English'), (3, 'Italian'), (3, 'Portuguese'), (3, 'Russian'),
    (4, 'English'), (4, 'Portuguese'), (4, 'Russian'), (4, 'Chinese'),
    (5, 'English'), (5, 'Russian'), (5, 'Chinese'), (5, 'Korean'),
    (6, 'Chinese'), (6, 'English'), (6, 'Korean'), (6, 'Swedish'),
    (7, 'Chinese'), (7, 'English'), (7, 'Korean'), (7, 'Italian'),
    (8, 'Russian'), (8, 'English'), (8, 'Spanish'), (8, 'French'),
    (9, 'English'), (9, 'Italian'), (9, 'Portuguese'), (9, 'Chinese'),
    (10, 'English'), (10, 'Swedish'), (10, 'Russian'), (10, 'Spanish'),
    (11, 'Swedish'), (11, 'English'), (11, 'Italian'), (11, 'Portuguese'),
    (12, 'Swedish'), (12, 'English'), (12, 'Portuguese'), (12, 'Russian'),
    (13, 'Russian'), (13, 'English'), (13, 'Chinese'), (13, 'Korean'),
    (14, 'English'), (14, 'Chinese'), (14, 'Russian'), (14, 'Portuguese'),
    (15, 'English'), (15, 'Spanish'), (15, 'Italian'), (15, 'Portuguese'),
    (16, 'English'), (16, 'French'), (16, 'Russian'), (16, 'Italian'),
    (17, 'Spanish'), (17, 'French'), (17, 'Russian'), (17, 'Chinese'),
    (18, 'French'), (18, 'English'), (18, 'Korean'), (18, 'Swedish'),
    (19, 'Korean'), (19, 'English'), (19, 'Chinese'), (19, 'Russian'),
    (20, 'Korean'), (20, 'English'), (20, 'Swedish'), (20, 'Spanish'),
    (21, 'Italian'), (21, 'English'), (21, 'Portuguese'), (21, 'Russian'),
    (22, 'Italian'), (22, 'English'), (22, 'Chinese'), (22, 'Korean'),
    (23, 'English'), (23, 'Swedish'), (23, 'Spanish'), (23, 'Russian'),
    (24, 'English'), (24, 'Russian'), (24, 'Italian'), (24, 'Portuguese'),
    (25, 'English'), (25, 'Chinese'), (25, 'Korean'), (25, 'French');
  
INSERT INTO CriticReview (CriticId, FilmId, ReviewDate, Score)
VALUES
	-- Reviews for film 'La Dolce Vita'

    ('CC456789012345678', 1, '1961-02-10', 7),
    ('CC234567890123456', 1, '1961-02-15', 8),
    ('CC567890123456789', 1, '1961-02-17', 5),
    ('CC789012345678901', 1, '1961-02-20', 6),
    ('CC123098765432109', 1, '1961-02-22', 2),
    
    -- Reviews for film 'I 400 Colpi'
    ('CC567890123456789', 2, '1959-05-02', 7),
    ('CC789012345678901', 2, '1959-05-04', 8),
    ('CC123098765432109', 2, '1959-05-06', 4),
    ('CC654321098765432', 2, '1959-05-08', 5),
    ('CC890123456789012', 2, '1959-05-10', 2),
    
    -- Reviews for film 'Once Upon a Time in America'
    ('CC123098765432109', 3, '1984-06-15', 9),
    ('CC654321098765432', 3, '1984-06-18', 7),
    ('CC345678901234567', 3, '1984-06-20', 6),
    ('CC567890123456789', 3, '1984-06-23', 4),
    ('CC456789012345678', 3, '1984-06-25', 2),
    
    -- Reviews for film 'Apocalypse Now'
    ('CC123456789012345', 4, '1979-08-20', 8),
    ('CC987654321098765', 4, '1979-08-22', 9),
    ('CC456789012345678', 4, '1979-08-24', 5),
    ('CC789012345678901', 4, '1979-08-26', 4),
    ('CC345678901234567', 4, '1979-08-28', 2),
    
    -- Reviews for film 'There Will Be Blood'
    ('CC345678901234567', 5, '2007-12-30', 8),
    ('CC567890123456789', 5, '2008-01-04', 9),
    ('CC789012345678901', 5, '2008-01-06', 4),
    ('CC234567890123456', 5, '2008-01-09', 5),
    ('CC456789012345678', 5, '2008-01-11', 2),
    
    -- Reviews for film 'In the Mood for Love'
    ('CC789012345678901', 6, '2000-10-01', 9),
    ('CC234567890123456', 6, '2000-10-05', 8),
    ('CC890123456789012', 6, '2000-10-07', 4),
    ('CC123098765432109', 6, '2000-10-09', 5),
    ('CC567890123456789', 6, '2000-10-11', 2),
    
    -- Reviews for film 'Chungking Express'
    ('CC890123456789012', 7, '1994-09-20', 8),
    ('CC123098765432109', 7, '1994-09-25', 7),
    ('CC567890123456789', 7, '1994-09-27', 6),
    ('CC234567890123456', 7, '1994-09-29', 5),
    ('CC456789012345678', 7, '1994-10-01', 2),
    
    -- Reviews for film 'Stalker'
    ('CC654321098765432', 8, '1980-05-10', 7),
    ('CC123456789012345', 8, '1980-05-15', 8),
    ('CC890123456789012', 8, '1980-05-17', 4),
    ('CC987654321098765', 8, '1980-05-19', 5),
    ('CC345678901234567', 8, '1980-05-21', 2),
    
    -- Reviews for film 'No Country for Old Men'
    ('CC987654321098765', 9, '2007-11-25', 9),
    ('CC456789012345678', 9, '2007-11-30', 8),
    ('CC345678901234567', 9, '2007-12-02', 4),
    ('CC567890123456789', 9, '2007-12-04', 5),
    ('CC890123456789012', 9, '2007-12-06', 2),
    
    -- Reviews for film 'Taxi Driver'
    ('CC345678901234567', 10, '1976-02-10', 8),
    ('CC567890123456789', 10, '1976-02-13', 7),
    ('CC789012345678901', 10, '1976-02-15', 5),
    ('CC234567890123456', 10, '1976-02-17', 4),
    ('CC456789012345678', 10, '1976-02-19', 2),
    
    -- Reviews for film 'Persona'
    ('CC789012345678901', 11, '1966-10-22', 9),
    ('CC234567890123456', 11, '1966-10-25', 8),
    ('CC890123456789012', 11, '1966-10-27', 4),
    ('CC123098765432109', 11, '1966-10-29', 5),
    ('CC567890123456789', 11, '1966-10-31', 2),
    
    -- Reviews for film 'L'Ora del Lupo'
    ('CC123098765432109', 12, '1968-03-30', 7),
    ('CC654321098765432', 12, '1968-04-02', 8),
    ('CC345678901234567', 12, '1968-04-05', 5),
    ('CC567890123456789', 12, '1968-04-07', 4),
    ('CC890123456789012', 12, '1968-04-09', 2),
    
    -- Reviews for film 'Lo Specchio'
    ('CC890123456789012', 13, '1979-05-15', 8),
    ('CC123456789012345', 13, '1979-05-20', 7),
    ('CC567890123456789', 13, '1979-05-25', 5),
    ('CC789012345678901', 13, '1979-05-27', 4),
    ('CC234567890123456', 13, '1979-05-29', 2),
    
    -- Reviews for film 'The Thing'
    ('CC234567890123456', 14, '1982-07-20', 7),
    ('CC890123456789012', 14, '1982-07-25', 8),
    ('CC123098765432109', 14, '1982-07-27', 4),
    ('CC654321098765432', 14, '1982-07-29', 5),
    ('CC567890123456789', 14, '1982-07-31', 2),
    
    -- Reviews for film 'Citizen Kane'
    ('CC123098765432109', 15, '1942-05-05', 9),
    ('CC654321098765432', 15, '1942-05-10', 8),
    ('CC567890123456789', 15, '1942-05-12', 5),
    ('CC789012345678901', 15, '1942-05-14', 4),
    ('CC456789012345678', 15, '1942-05-16', 2),
    
    -- Reviews for film 'The Manster'
    ('CC123456789012345', 16, '2018-01-10', 8),
    ('CC987654321098765', 16, '2018-01-15', 7),
    ('CC456789012345678', 16, '2018-01-17', 5),
    ('CC789012345678901', 16, '2018-01-19', 4),
    ('CC345678901234567', 16, '2018-01-21', 2),
    
    -- Reviews for film 'Todo Sobre Mi Madre'
    ('CC456789012345678', 17, '1999-03-15', 9),
    ('CC345678901234567', 17, '1999-03-20', 8),
    ('CC123456789012345', 17, '1999-03-25', 5),
    ('CC567890123456789', 17, '1999-03-27', 4),
    ('CC789012345678901', 17, '1999-03-29', 2),
    
    -- Reviews for film 'Incendies'
    ('CC567890123456789', 18, '2010-09-22', 7),
    ('CC789012345678901', 18, '2010-09-27', 8),
    ('CC234567890123456', 18, '2010-09-29', 5),
    ('CC890123456789012', 18, '2010-10-01', 4),
    ('CC456789012345678', 18, '2010-10-03', 2),
    
    -- Reviews for film 'Parasite'
    ('CC234567890123456', 19, '2019-05-10', 8),
    ('CC890123456789012', 19, '2019-05-15', 7),
    ('CC123456789012345', 19, '2019-05-20', 5),
    ('CC456789012345678', 19, '2019-05-25', 4),
    ('CC345678901234567', 19, '2019-05-27', 2),
    
    -- Reviews for film 'Memories of Murder'
    ('CC123098765432109', 20, '2003-05-10', 9),
    ('CC654321098765432', 20, '2003-05-15', 7),
    ('CC789012345678901', 20, '2003-05-20', 5),
    ('CC234567890123456', 20, '2003-05-25', 4),
    ('CC567890123456789', 20, '2003-05-27', 2),
    
    -- Reviews for film 'Il Buono, Il Brutto, Il Cattivo'
    ('CC345678901234567', 21, '1967-01-10', 9),
    ('CC567890123456789', 21, '1967-01-13', 8),
    ('CC789012345678901', 21, '1967-01-15', 5),
    ('CC890123456789012', 21, '1967-01-17', 4),
    ('CC123098765432109', 21, '1967-01-19', 2),
    
    -- Reviews for film '8 1/2'
    ('CC789012345678901', 22, '1963-03-12', 8),
    ('CC234567890123456', 22, '1963-03-15', 7),
    ('CC890123456789012', 22, '1963-03-17', 4),
    ('CC123098765432109', 22, '1963-03-19', 5),
    ('CC567890123456789', 22, '1963-03-21', 2),
    
    -- Reviews for film 'A Clockwork Orange'
    ('CC890123456789012', 23, '1971-12-25', 7),
    ('CC123098765432109', 23, '1971-12-30', 8),
    ('CC234567890123456', 23, '1972-01-01', 5),
    ('CC456789012345678', 23, '1972-01-03', 4),
    ('CC567890123456789', 23, '1972-01-05', 2),
    
    -- Reviews for film 'Barry Lyndon'
    ('CC654321098765432', 24, '1975-12-30', 8),
    ('CC123456789012345', 24, '1976-01-02', 9),
    ('CC567890123456789', 24, '1976-01-05', 5),
    ('CC789012345678901', 24, '1976-01-07', 4),
    ('CC234567890123456', 24, '1976-01-09', 2),
    
    -- Reviews for film '2001: A Space Odyssey'
    ('CC234567890123456', 25, '1968-05-30', 9),
    ('CC890123456789012', 25, '1968-06-02', 7),
    ('CC123098765432109', 25, '1968-06-05', 4),
    ('CC567890123456789', 25, '1968-06-07', 5),
    ('CC456789012345678', 25, '1968-06-09', 2);
INSERT INTO UserReview (ProfileCode, FilmId, Score, ReviewDate)
VALUES
    ('MN3456OP7890QR', 1, 4.5, '2023-03-15'),
    ('ST9012UV3456WX', 2, 4.0, '2023-04-22'),
    ('YZ6789AB1234CD', 3, 5.0, '2023-05-07'),
    ('EF2345GH9012IJ', 4, 4.8, '2023-05-12'),
    ('KL5678MN3456OP', 5, 4.6, '2023-04-18'),
    ('QR7890ST9012UV', 6, 4.7, '2023-03-25'),
    ('WX1234YZ6789AB', 7, 4.3, '2023-04-30'),
    ('CD3456EF2345GH', 8, 4.9, '2023-04-14'),
    ('IJ9012KL5678MN', 9, 4.7, '2023-03-11'),
    ('OP7890QR7890ST', 10, 4.5, '2023-03-06'),
    ('CD3456EF2345GH', 11, 4.8, '2023-04-09'),
    ('IJ9012KL5678MN', 12, 4.2, '2023-05-02'),
    ('OP7890QR7890ST', 13, 4.6, '2023-05-15'),
    ('OP7890QR7890ST', 14, 4.4, '2023-04-20'),
    ('QR7890ST9012UV', 15, 4.1, '2023-05-08'),
    ('WX1234YZ6789AB', 16, 3.8, '2023-04-13'),
    ('EF2345GH9012IJ', 17, 4.0, '2023-04-02'),
    ('KL5678MN3456OP', 18, 4.7, '2023-04-07'),
    ('YZ6789AB1234CD', 19, 4.8, '2023-03-29'),
    ('ST9012UV3456WX', 20, 4.6, '2023-05-05'),
    ('MN3456OP7890QR', 21, 4.9, '2023-05-10'),
    ('MN3456OP7890QR', 22, 4.7, '2023-04-25'),
    ('CD3456EF2345GH', 23, 4.5, '2023-03-22'),
    ('CD3456EF2345GH', 24, 4.8, '2023-05-18'),
    ('CD3456EF2345GH', 25, 4.0, '2023-03-18'),
    ('EF2345GH9012IJ', 25, 2.9, '2023-05-17'),
    ('KL5678MN3456OP', 24, 4.2, '2023-04-16'),
    ('QR7890ST9012UV', 23, 4.3, '2023-03-30'),
    ('WX1234YZ6789AB', 22, 2.7, '2023-04-28'),
    ('CD3456EF2345GH', 21, 2.5, '2023-05-11'),
    ('IJ9012KL5678MN', 20, 3.0, '2023-03-20'),
    ('OP7890QR7890ST', 19, 3.1, '2023-04-05'),
    ('CD3456EF2345GH', 18, 2.8, '2023-04-22'),
    ('IJ9012KL5678MN', 17, 2.3, '2023-05-14'),
    ('OP7890QR7890ST', 16, 3.2, '2023-05-03'),
    ('OP7890QR7890ST', 15, 2.6, '2023-05-16'),
    ('QR7890ST9012UV', 14, 2.9, '2023-03-26'),
    ('WX1234YZ6789AB', 13, 2.3, '2023-05-19'),
    ('EF2345GH9012IJ', 12, 3.0, '2023-04-04'),
    ('KL5678MN3456OP', 11, 3.2, '2023-03-13'),
    ('YZ6789AB1234CD', 10, 3.1, '2023-04-15'),
    ('ST9012UV3456WX', 9, 3.3, '2023-04-01'),
    ('MN3456OP7890QR', 8, 4.5, '2023-04-26'),
    ('CD3456EF2345GH', 7, 4.6, '2023-05-06'),
    ('IJ9012KL5678MN', 6, 4.8, '2023-03-17'),
    ('OP7890QR7890ST', 5, 4.4, '2023-04-11'),
    ('CD3456EF2345GH', 4, 4.0, '2023-03-27'),
    ('CD3456EF2345GH', 3, 4.5, '2023-04-08'),
    ('CD3456EF2345GH', 2, 4.2, '2023-03-05'),
    ('CD3456EF2345GH', 1, 3.7, '2023-05-09');

INSERT INTO Offering (PlanName, FeatureName)
VALUES
	('Basic', 'Access to a limited selection of films.'),
	('Basic', 'Streaming in standard definition (SD).'),
	('Basic', 'Advertisements during film playback.'),
	('Basic', 'Access to a single screen at a time.'),
	('Basic', 'Offline viewing not available.'),
	('Premium', 'Access to a vast library of films and TV series.'),
	('Premium', 'Streaming in high definition (HD) and 4K, where available.'),
	('Premium', 'Ad-free playback.'),
	('Premium', 'Access to two screens simultaneously.'),
	('Premium', 'Ability to create personalised lists (playlists).'),
	('Pro', 'Early access to films releasing in cinemas.'),
	('Pro', 'Exclusive content available only for Pro subscribers.'),
	('Pro', 'Personalised recommendation feature based on viewing history.'),
	('Pro', 'Access to three screens simultaneously.'),
	('Pro', 'Ability to download films and TV series for offline viewing.'),
	('Deluxe', 'Access to live events and exclusive previews.'),
	('Deluxe', '3D content library, if supported.'),
	('Deluxe', 'Unlimited streaming across multiple devices.'),
	('Deluxe', 'Ability to create separate user profiles.'),
	('Deluxe', 'Access to extra content, such as documentaries and behind the scenes.'),
	('Ultimate', 'Access to a vast library of global content.'),
    ('Ultimate', 'Support for smart TV devices and gaming consoles.'),
    ('Ultimate', 'Access to VR content (virtual reality), where available.'),
    ('Ultimate', 'Priority customer support 24/7.');
    
## Subscription
INSERT INTO Subscription (ProfileCode, PlanName)
VALUES
    ('MN3456OP7890QR', 'Deluxe'), #V
    ('ST9012UV3456WX', 'Premium'), #V
    ('YZ6789AB1234CD', 'Premium'), #V
    ('EF2345GH9012IJ', 'Basic'), #V
    ('KL5678MN3456OP', 'Ultimate'), #V
    ('QR7890ST9012UV', 'Pro'), #V 
    ('WX1234YZ6789AB', 'Deluxe'), #V
    ('CD3456EF2345GH', 'Ultimate'), #V
    ('IJ9012KL5678MN', 'Basic'), #V
    ('OP7890QR7890ST', 'Pro'); #V
    
INSERT INTO ToPay(ProfileCode, InvoiceId)
VALUES
	('IJ9012KL5678MN', 1),
    ('YZ6789AB1234CD', 2),
    ('QR7890ST9012UV', 3),
    ('WX1234YZ6789AB', 4),
    ('KL5678MN3456OP', 5),
    ('EF2345GH9012IJ', 6),
    ('ST9012UV3456WX', 7),
    ('OP7890QR7890ST', 8),
    ('MN3456OP7890QR', 9),
    ('CD3456EF2345GH', 10);

INSERT INTO Paid (ProfileCode, InvoiceId, PaymentDate)
VALUES
    ('MN3456OP7890QR', 11, DATE_ADD('2023-08-15', INTERVAL 7 DAY)),
    ('MN3456OP7890QR', 12, DATE_ADD('2023-08-14', INTERVAL 10 DAY)),
    ('MN3456OP7890QR', 13, DATE_ADD('2023-08-13', INTERVAL 2 DAY)),
    ('ST9012UV3456WX', 14, DATE_ADD('2023-08-12', INTERVAL 5 DAY)),
    ('ST9012UV3456WX', 15, DATE_ADD('2023-08-11', INTERVAL 8 DAY)),
    ('ST9012UV3456WX', 16, DATE_ADD('2023-08-10', INTERVAL 6 DAY)),
    ('YZ6789AB1234CD', 17, DATE_ADD('2023-08-09', INTERVAL 3 DAY)),
    ('YZ6789AB1234CD', 18, DATE_ADD('2023-08-08', INTERVAL 4 DAY)),
    ('YZ6789AB1234CD', 19, DATE_ADD('2023-08-07', INTERVAL 1 DAY)),
    ('EF2345GH9012IJ', 20, DATE_ADD('2023-08-06', INTERVAL 12 DAY)),
    ('EF2345GH9012IJ', 21, DATE_ADD('2023-08-05', INTERVAL 15 DAY)),
    ('EF2345GH9012IJ', 22, DATE_ADD('2023-08-04', INTERVAL 18 DAY)),
    ('KL5678MN3456OP', 23, DATE_ADD('2023-08-03', INTERVAL 14 DAY)),
    ('KL5678MN3456OP', 24, DATE_ADD('2023-08-02', INTERVAL 17 DAY)),
    ('KL5678MN3456OP', 25, DATE_ADD('2023-08-01', INTERVAL 9 DAY)),
    ('QR7890ST9012UV', 26, DATE_ADD('2023-07-31', INTERVAL 11 DAY)),
    ('QR7890ST9012UV', 27, DATE_ADD('2023-07-30', INTERVAL 13 DAY)),
    ('QR7890ST9012UV', 28, DATE_ADD('2023-07-29', INTERVAL 16 DAY)),
    ('WX1234YZ6789AB', 29, DATE_ADD('2023-07-28', INTERVAL 19 DAY)),
    ('WX1234YZ6789AB', 30, DATE_ADD('2023-07-27', INTERVAL 7 DAY)),
    ('WX1234YZ6789AB', 31, DATE_ADD('2023-07-26', INTERVAL 5 DAY)),
    ('CD3456EF2345GH', 32, DATE_ADD('2023-07-25', INTERVAL 3 DAY)),
    ('CD3456EF2345GH', 33, DATE_ADD('2023-07-24', INTERVAL 14 DAY)),
    ('CD3456EF2345GH', 34, DATE_ADD('2023-07-23', INTERVAL 12 DAY)),
    ('IJ9012KL5678MN', 35, DATE_ADD('2023-07-22', INTERVAL 10 DAY)),
    ('IJ9012KL5678MN', 36, DATE_ADD('2023-07-21', INTERVAL 8 DAY)),
    ('IJ9012KL5678MN', 37, DATE_ADD('2023-07-20', INTERVAL 6 DAY)),
    ('OP7890QR7890ST', 38, DATE_ADD('2023-07-19', INTERVAL 4 DAY)),
    ('OP7890QR7890ST', 39, DATE_ADD('2023-07-18', INTERVAL 2 DAY)),
    ('OP7890QR7890ST', 40, DATE_ADD('2023-07-17', INTERVAL 1 DAY));


## Payment
INSERT INTO Payment(InvoiceId, CardCode)
VALUES
	(11,'1234-5678-9012-3456'),
    (12,'1234-5678-9012-3456'),
    (13,'1234-5678-9012-3456'),
	(14,'9876-5432-1098-7654'),
    (15,'9876-5432-1098-7654'),
    (16,'9876-5432-1098-7654'),
	(17,'4567-8901-2345-6789'),
    (18,'4567-8901-2345-6789'),
    (19,'4567-8901-2345-6789'),
	(20,'7890-1234-5678-9012'),
    (21,'7890-1234-5678-9012'),
    (22,'7890-1234-5678-9012'),
	(23,'3456-7890-1234-5678'),
    (24,'3456-7890-1234-5678'),
    (25,'3456-7890-1234-5678'),
	(26,'6789-0123-4567-8901'),
    (27,'6789-0123-4567-8901'),
    (28,'6789-0123-4567-8901'),
	(29,'2345-6789-0123-4567'),
    (30,'2345-6789-0123-4567'),
    (31,'2345-6789-0123-4567'),
	(32,'5678-9012-3456-7890'),
    (33,'5678-9012-3456-7890'),
    (34,'5678-9012-3456-7890'),
	(35,'9012-3456-7890-1234'),
    (36,'9012-3456-7890-1234'),
    (37,'9012-3456-7890-1234'),
	(38,'4321-8765-0987-6543'),
    (39,'4321-8765-0987-6543'),
    (40,'4321-8765-0987-6543');
    
    
## Interface
INSERT INTO Interface(ProfileCode, DeviceId)
VALUES
	('MN3456OP7890QR', 1), #V
    ('ST9012UV3456WX', 2), #V
    ('YZ6789AB1234CD', 3), #V
    ('EF2345GH9012IJ', 4), #V
    ('KL5678MN3456OP', 5), #V
    ('QR7890ST9012UV', 10), #V 
    ('WX1234YZ6789AB', 6), #V
    ('CD3456EF2345GH', 7), #V
    ('IJ9012KL5678MN', 8), #V
    ('OP7890QR7890ST', 9); #V

## Composition
INSERT INTO Composition(DeviceId, Model)
VALUES
	(1, "SoundWave Pro"),
    (1, "GraphicForce RTX"),
    (2, "SonicMaster X1"),
    (2, "PixelPower Pro"),
    (3, "AudioFidelity 2000"),
    (3, "VisualFX 2X"),
    (4, "HarmonySound DS"),
    (4, "UltraVision GTX"),
    (5, "CrystalClear Audio"),
    (5, "GraphicForce RTX"),
    (6, "SonicMaster X1"),
    (6, "VisualFX 2X"),
    (7, "CrystalClear Audio"),
    (7, "VideoMaster 5000"),
    (8, "HarmonySound DS"),
    (8, "PixelPower Pro"),
    (9, "SoundWave Pro"),
    (9, "UltraVision GTX"),
    (10, "AudioFidelity 2000"),
    (10, "VideoMaster 5000");
INSERT INTO AudioEncoding (CodecName, DistributionDate, Model)
VALUES
    ('AAC', '2020-01-15', 'SoundWave Pro'),
    ('MP3', '2000-05-20', 'SoundWave Pro'),
    ('Dolby Digital', '1992-03-10', 'SoundWave Pro'),
    ('DTS', '1993-12-05', 'SoundWave Pro'),
    ('AAC', '2020-01-15', 'SonicMaster X1'),
    ('FLAC', '2001-08-30', 'SonicMaster X1'),
    ('AC-3', '1992-05-12', 'SonicMaster X1'),
    ('DTS', '1993-12-05', 'SonicMaster X1'),
    ('MP3', '2000-05-20', 'AudioFidelity 2000'),
    ('Dolby Digital', '1992-03-10', 'AudioFidelity 2000'),
    ('DTS', '1993-12-05', 'AudioFidelity 2000'),
    ('AC-3', '1992-05-12', 'AudioFidelity 2000'),
    ('AAC', '2020-01-15', 'HarmonySound DS'),
    ('Dolby Digital', '1992-03-10', 'HarmonySound DS'),
    ('FLAC', '2001-08-30', 'HarmonySound DS'),
    ('AC-3', '1992-05-12', 'HarmonySound DS'),
    ('MP3', '2000-05-20', 'CrystalClear Audio'),
    ('Dolby Digital', '1992-03-10', 'CrystalClear Audio'),
    ('DTS', '1993-12-05', 'CrystalClear Audio'),
    ('AC-3', '1992-05-12', 'CrystalClear Audio');    

INSERT INTO VideoEncoding (CodecName, DistributionDate, Model)
VALUES
    ('H.264', '2003-07-15', 'UltraVision GTX'),
    ('VP9', '2013-09-12', 'UltraVision GTX'),
    ('H.265', '2013-03-23', 'UltraVision GTX'),
    ('H.264', '2003-07-15', 'VideoMaster 5000'),
    ('MPEG-2', '1995-11-30', 'VideoMaster 5000'),
    ('VP9', '2013-09-12', 'VideoMaster 5000'),
    ('VP9', '2013-09-12', 'VisualFX 2X'),
    ('H.265', '2013-03-23', 'VisualFX 2X'),
    ('MPEG-2', '1995-11-30', 'VisualFX 2X'),
    ('H.265', '2013-03-23', 'PixelPower Pro'),
    ('MPEG-2', '1995-11-30', 'PixelPower Pro'),
    ('H.264', '2003-07-15', 'PixelPower Pro'),
    ('MPEG-2', '1995-11-30', 'GraphicForce RTX'),
    ('H.264', '2003-07-15', 'GraphicForce RTX'),
    ('VP9', '2013-09-12', 'GraphicForce RTX');

## Download
INSERT INTO Download (ProfileCode, FilmId, DownloadDate)
VALUES
    ('MN3456OP7890QR', 1, '2023-08-17 14:23:45'),
    ('MN3456OP7890QR', 2, '2023-08-15 09:32:18'),
    ('MN3456OP7890QR', 3, '2023-08-28 21:07:36'),
    ('ST9012UV3456WX', 4, '2023-08-03 06:54:12'),
    ('ST9012UV3456WX', 5, '2023-08-20 16:45:29'),
    ('ST9012UV3456WX', 6, '2023-08-10 11:28:50'),
    ('YZ6789AB1234CD', 7, '2023-08-26 18:37:04'),
    ('YZ6789AB1234CD', 8, '2023-08-12 08:15:59'),
    ('YZ6789AB1234CD', 9, '2023-08-23 13:42:27'),
    ('KL5678MN3456OP', 10, '2023-08-04 02:19:51'),
    ('KL5678MN3456OP', 11, '2023-08-25 04:30:14'),
    ('KL5678MN3456OP', 12, '2023-08-11 19:08:07'),
    ('QR7890ST9012UV', 13, '2023-08-02 23:59:59'),
    ('QR7890ST9012UV', 14, '2023-08-19 07:41:33'),
    ('QR7890ST9012UV', 15, '2023-08-06 17:10:05'),
    ('WX1234YZ6789AB', 16, '2023-08-29 22:56:42'),
    ('WX1234YZ6789AB', 17, '2023-08-08 12:37:59'),
    ('WX1234YZ6789AB', 18, '2023-08-16 03:06:23'),
    ('CD3456EF2345GH', 19, '2023-08-27 10:51:58'),
    ('CD3456EF2345GH', 20, '2023-08-07 21:23:17'),
    ('CD3456EF2345GH', 21, '2023-08-13 05:49:03'),
    ('OP7890QR7890ST', 22, '2023-08-24 15:04:27'),
    ('OP7890QR7890ST', 23, '2023-08-01 08:29:45'),
    ('OP7890QR7890ST', 24, '2023-08-18 01:14:30');
    
    ## ConnectionHistory
INSERT INTO PointOfPresence (ServerIP, FilmId)
VALUES
    (11110321, 13),
    (22220578, 4),
    (33330124, 7),
    (44440756, 9),
    (66660287, 20),
    (77770654, 17),
    (88880189, 11),
    (99990765, 6),
    (12120543, 18),
    (11110001, 2),
    (33330054, 12),
    (44440233, 14),
    (55550567, 3),
    (66660258, 5),
    (77770176, 16),
    (88880294, 15),
    (99990240, 1),
    (12120704, 8),
    (66660287, 10),
    (77770654, 19),
    (88880189, 21),
    (99990765, 22),
    (12120543, 23),
    (11110001, 24),
    (33330054, 25);
    
DELIMITER $$
Create procedure ControlloVisione()
BEGIN
	Declare CodAlfanum char(14);
    DECLARE IpStatoUsato int default 0;
    DECLARE IpDispositivoUsato int default 0;
    DECLARE FilmScelto int default 0;
    DECLARE DataVisioneFilm DATETIME;
    Declare AudioUsato char(17);
    Declare VideoUsato char(17);
    Declare CheckAudio int default 0;
    Declare CheckVideo int default 0;
    
    DECLARE Finito int DEFAULT 0;
	DECLARE Cursore CURSOR FOR(
		SELECT CodAlfanumerico, Identificatore, IpDispositivo % 10000, IpStato, CodAudio, CodVideo, DataVisione
        FROM Visione NATURAL JOIN Interfaccia NATURAL JOIN StoricoConnessione NATURAL JOIN Indicizzazione
        Where DataVisione = DataInizioConnessione
    );
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET Finito = 1;
    OPEN Cursore;
    loopLettura: LOOP
		FETCH Cursore INTO CodAlfanum, FilmScelto, IpDispositivoUsato, IpStatoUsato, AudioUsato, VideoUsato, DataVisioneFilm;
        IF Finito then LEAVE loopLettura; END IF;
        Set CheckAudio = (Select Count(*) from RestrizioneAudio where IpStato = IpStatoUsato and CodAudio = AudioUsato);
        Set CheckVideo = (Select Count(*) from RestrizioneVideo where IpStato = IpStatoUsato and CodVideo = VideoUsato);
        IF (CheckAudio <> 0 OR CheckVideo <> 0) THEN
			DELETE FROM Visione
            WHERE CodAlfanumerico = CodAlfanum AND Identificatore = FilmScelto AND CodVideo = VideoUsato AND CodAudio = AudioUsato AND DataVisione = DataVisioneFilm;
		END IF;
    END LOOP;
    CLOSE Cursore;
END $$
DELIMITER ;
    
DELIMITER $$
CREATE TRIGGER InserisciVisione
AFTER INSERT ON Visione
FOR EACH ROW
BEGIN
	DECLARE idDispositivo int;
	DECLARE ipDispositivo int;
    DECLARE ControlloStato int DEFAULT 0;
    DECLARE ipServer int;
    DECLARE DurataFilm int;
    
	Select CodDispositivo into idDispositivo
	FROM Profilo NATURAL JOIN Interfaccia
	WHERE CodAlfanumerico = NEW.CodAlfanumerico;
    
    SET ipDispositivo = (
		SELECT
			CASE
				WHEN RAND() <= 0.1 THEN 11110000
				WHEN RAND() <= 0.2 THEN 22220000
				WHEN RAND() <= 0.3 THEN 33330000
				WHEN RAND() <= 0.4 THEN 44440000
				WHEN RAND() <= 0.5 THEN 55550000
				WHEN RAND() <= 0.6 THEN 66660000
				WHEN RAND() <= 0.7 THEN 77770000
				WHEN RAND() <= 0.8 THEN 88880000
				WHEN RAND() <= 0.9 THEN 99990000
				ELSE 12120000
			END
    );
		SET ipDispositivo = ipDispositivo + (SELECT LPAD(FLOOR(RAND() * 10000), 4, '0'));
		CALL ServerDispositivo(idDispositivo, ipDispositivo, NEW.Identificatore, ipServer);
		CALL IniziaConnessione(ipServer, idDispositivo, ipDispositivo, NEW.DataVisione);
		SET DurataFilm = (SELECT Durata FROM Film WHERE Identificatore = NEW.Identificatore);
		CALL TerminaConnessione(ipServer, idDispositivo, ipDispositivo, DATE_ADD(NEW.DataVisione, INTERVAL DurataFilm MINUTE));
END $$
DELIMITER ;  

INSERT INTO Viewing (ProfileCode, FilmId, AudioCode, VideoCode, ViewDate)
VALUES
('MN3456OP7890QR', 1, 'AUD12345678901234', 'VID12345678901234',  '2023-09-16 15:42:56'),
('ST9012UV3456WX', 1, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 15:43:56'),
('YZ6789AB1234CD', 1, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 15:44:56'),
('MN3456OP7890QR', 2, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 15:45:56'),
('ST9012UV3456WX', 2, 'AUD34567890123456', 'VID78901234567890', '2023-09-16 15:46:56'),
('YZ6789AB1234CD', 2, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 15:47:56'),
('MN3456OP7890QR', 3, 'AUD12345678901234', 'VID21098765432109', '2023-09-16 15:48:56'),
('ST9012UV3456WX', 3, 'AUD98765432109876', 'VID12309876543210', '2023-09-16 15:49:56'),
('YZ6789AB1234CD', 3, 'AUD45678901234567', 'VID78901234567890', '2023-09-16 15:50:56'),
('MN3456OP7890QR', 4, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 15:51:56'),
('ST9012UV3456WX', 4, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 15:52:56'),
('YZ6789AB1234CD', 4, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 15:53:56'),
('MN3456OP7890QR', 5, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 15:54:56'),
('ST9012UV3456WX', 5, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 15:55:56'),
('YZ6789AB1234CD', 5, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 15:56:56'),
('MN3456OP7890QR', 6, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 15:57:56'),
('ST9012UV3456WX', 6, 'AUD34567890123456', 'VID78901234567890', '2023-09-16 15:58:56'),
('YZ6789AB1234CD', 6, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 15:59:56'),
('MN3456OP7890QR', 7, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:00:56'),
('ST9012UV3456WX', 7, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:01:56'),
('YZ6789AB1234CD', 7, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:02:56'),
('ST9012UV3456WX', 8, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:03:56'),
('KL5678MN3456OP', 8, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 16:04:56'),
('QR7890ST9012UV', 8, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:05:56'),
('YZ6789AB1234CD', 8, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:06:56'),
('ST9012UV3456WX', 9, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:07:56'),
('MN3456OP7890QR', 9, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 16:08:56'),
('KL5678MN3456OP', 9, 'AUD45678901234567', 'VID78901234567890', '2023-09-16 16:09:56'),
('ST9012UV3456WX', 10, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 16:10:56'),
('KL5678MN3456OP', 10, 'AUD34567890123456', 'VID78901234567890', '2023-09-16 16:11:56'),
('YZ6789AB1234CD', 10, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:12:56'),
('ST9012UV3456WX', 11, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:13:56'),
('EF2345GH9012IJ', 11, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:14:56'),
('KL5678MN3456OP', 11, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:15:56'),
('KL5678MN3456OP', 12, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:16:56'),
('EF2345GH9012IJ', 12, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 16:17:56'),
('WX1234YZ6789AB', 12, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:18:56'),
('ST9012UV3456WX', 13, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:19:56'),
('KL5678MN3456OP', 13, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:20:56'),
('YZ6789AB1234CD', 13, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:21:56'),
('ST9012UV3456WX', 14, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:22:56'),
('KL5678MN3456OP', 14, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 16:23:56'),
('YZ6789AB1234CD', 14, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:24:56'),
('ST9012UV3456WX', 15, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:25:56'),
('CD3456EF2345GH', 15, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:26:56'),
('KL5678MN3456OP', 15, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:27:56'),
('YZ6789AB1234CD', 15, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:28:56'),
('EF2345GH9012IJ', 15, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:29:56'),
('ST9012UV3456WX', 16, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:30:56'),
('YZ6789AB1234CD', 16, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 16:31:56'),
('EF2345GH9012IJ', 16, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:32:56'),
('ST9012UV3456WX', 17, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:33:56'),
('KL5678MN3456OP', 17, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:34:56'),
('YZ6789AB1234CD', 17, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:35:56'),
('KL5678MN3456OP', 18, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:36:56'),
('EF2345GH9012IJ', 18, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 16:37:56'),
('WX1234YZ6789AB', 18, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:38:56'),
('KL5678MN3456OP', 19, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:39:56'),
('YZ6789AB1234CD', 19, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:40:56'),
('EF2345GH9012IJ', 19, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:41:56'),
('KL5678MN3456OP', 20, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:42:56'),
('QR7890ST9012UV', 20, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 16:43:56'),
('YZ6789AB1234CD', 20, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:44:56'),
('KL5678MN3456OP', 21, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:45:56'),
('EF2345GH9012IJ', 21, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:46:56'),
('QR7890ST9012UV', 21, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:47:56'),
('YZ6789AB1234CD', 22, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 16:48:56'),
('KL5678MN3456OP', 22, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 16:49:56'),
('WX1234YZ6789AB', 22, 'AUD34567890123456', 'VID45678901234567', '2023-09-16 16:50:56'),
('KL5678MN3456OP', 23, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:51:56'),
('YZ6789AB1234CD', 23, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:52:56'),
('EF2345GH9012IJ', 23, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:53:56'),
('WX1234YZ6789AB', 23, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:54:56'),
('EF2345GH9012IJ', 24, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:55:56'),
('KL5678MN3456OP', 24, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:56:56'),
('QR7890ST9012UV', 24, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:57:56'),
('KL5678MN3456OP', 25, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:58:56'),
('QR7890ST9012UV', 25, 'AUD98765432109876', 'VID45678901234567', '2023-09-16 16:59:56'),
('WX1234YZ6789AB', 25, 'AUD34567890123456', 'VID12309876543210', '2023-09-16 17:00:56');


DROP TRIGGER InserisciVisione;
CALL ControlloVisione();
DROP PROCEDURE ControlloVisione;