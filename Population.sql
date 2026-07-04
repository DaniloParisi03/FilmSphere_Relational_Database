
-- Inserisci 20 istanze con dati diversi nella tabella "film"
INSERT INTO film (PaeseDiProduzione, AnnoDiUscita)
VALUES
    
    ('Italy', '1960-02-05'), #la dolce vita
    ('France', '1959-05-04'), #I 400 colpi
    ('United States', '1984-06-01'), #Once Upon a Time in America
    ('United States', '1979-08-15'), #   Apocalypse now
    ('United States', '2007-12-26'), #There Will Be Blood
    ('China', '2000-09-29'), #in the mood for love
    ('China', '1994-09-14'),#Chunking Express
    ('Russia', '1979-05-13'), #stalker
    ('United States', '2007-11-21'), #No Country for Old Men
    ('United States', '1976-02-08'),# Taxi Driver
    ('Sweden', '1966-10-18'), # Persona 
    ('Sweden', '1968-02-19'),#ora del lupo
    ('Russia', '1975-03-07'), #lo specchio
    ('United States', '1982-06-25'), #The Thing
	('United States', '1941-05-01'), #Citizen Kane
    ('United States', ' 2017-12-25'), #the manster
    ('Spain', ' 1999-03-19'), #Todo sobre mi madre’
    ('Canada', '2010-09-17'), #Incendies
    ('South Korea', '2019-05-21'),#Parasite
    ('South Korea', '2003-05-02'),#Memories of murder
	('Italy', '1966-12-23'),#il buono, il brutto e il cattivo
    ('Italy', '1963-02-14'),#8 1/2    
	('United Kindom', '1971-12-19'),#A Clockwork Orange   
	('United Kindom', '1975-12-18'),#Barry Lyndon
    ('United Kindom', '1975-12-18')#2001 odissea
    ;

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
	# Todo Sobre Mi Madre (All About My Mother)
	('QRS234TUV5678901O', 'Regista', 16),
	('TTTTTT00U11V22221', 'Attrice', 16),
	# Incendies
	('TUV567WXY8901234P', 'Regista', 17),
	('UUUUUU11V22W33331', 'Attrice', 17),
	# Parasite
	('WXY890ZAB0123456Q', 'Regista', 18),
	('VVVVVV22W33X44441', 'Attore', 18),
	('WWWWWW33X44Y55551', 'Attore', 18),
	('XXXXXXXX44Y55Z6A1', 'Attrice', 18),
	# Memories of Murder
	('WXY890ZAB0123456Q', 'Regista', 19),
	('VVVVVV22W33X44441', 'Attore', 19),
	# Il Buono, il Brutto e il Cattivo (The Good, the Bad and the Ugly)
	('JKL012OPQ3456789D', 'Regista', 20),
	('CLNI45HI4534IPP55', 'Attore', 20),
	('YYYYYYYY55Z66A7B1', 'Attore', 20),
	('ZZZZZZZZ66A77B8C1', 'Attore', 20),
	# 8 1/2
	('DEF456UVW7890123B', 'Regista', 21),
	('AAAAAA11B22C333D1', 'Attore', 21),
	# A Clockwork Orange
	('ZAB012CDE3456789R', 'Regista', 22),
	('AAAAAAAA77B88C9D1', 'Attore', 22),
	# Barry Lyndon
	('ZAB012CDE3456789R', 'Regista', 23),
	('BBBBBBBB88C99D0E1', 'Attore', 23),
	# 2001: Odissea nello Spazio (2001: A Space Odyssey)
	('ZAB012CDE3456789R', 'Regista', 24),
	('CCCCCCCC99D00E1F1', 'Attore', 24),
	('DDDD00E131F2222G1', 'Attore', 24);

    
    
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

INSERT INTO ListaPremiFilm (Nome, Tipo)
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

INSERT INTO ListaPremiCast(Nome, Tipo)
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
	('Venice Film Festival',  'Miglior Attore Secondario'),

   	('Oscar', 'Miglior Attrice Protagonista'),
    ('Golden Globe','Miglior Attrice Protagonista'),
    ('Cannes Film Festival', 'Miglior Attrice Protagonista'),
    ('Grammy', 'Miglior Attrice Protagonista'),
    ('Venice Film Festival',  'Miglior Attrice Protagonista');


INSERT INTO Audio (CodAudio, Formato, IndiceQualita, Dimensione)
VALUES
    ('AUD12345678901234', 'Dolby Digital', 5, 2.56),
    ('AUD98765432109876', 'DTS-HD Master Audio', 4, 3.21),
    ('AUD45678901234567', 'PCM', 5, 2.87),
    ('AUD34567890123456', 'Dolby Atmos', 4, 3.76),
    ('AUD56789012345678', 'AAC', 3, 1.45),
    ('AUD78901234567890', 'FLAC', 5, 4.02);


INSERT INTO Video (CodVideo, Risoluzione, Bitrate, Rapporto, Dimensione, Lunghezza)
VALUES
    ('VID12345678901234', '1920x1080', 8000, '16:9', 2.35, 120.5),
    ('VID98765432109876', '3840x2160', 12000, '16:9', 8.92, 180.2),
    ('VID45678901234567', '1280x720', 4500, '16:9', 1.75, 90.8),
    ('VID78901234567890', '3840x2160', 15000, '2.35:1', 11.20, 210.5),
    ('VID12309876543210', '1920x1080', 5000, '4:3', 2.45, 110.2),
    ('VID21098765432109', '1280x720', 3000, '4:3', 1.15, 70.7);
    
    INSERT INTO Formato (Identificatore, CodAudio, CodVideo, DataDiRilascio)
VALUES
-- La Dolce Vita (film 1)
    (1, 'AUD12345678901234', 'VID12345678901234', '1959-01-01'),
    (1, 'AUD45678901234567', 'VID45678901234567', '1959-01-01'),
    (1, 'AUD56789012345678', 'VID21098765432109', '1959-01-01'),
-- I 400 Colpi (film 2)
    (2, 'AUD98765432109876', 'VID98765432109876', '1958-01-01'),
    (2, 'AUD34567890123456', 'VID78901234567890', '1958-01-01'),
    (2, 'AUD78901234567890', 'VID21098765432109', '1958-01-01'),
-- Once Upon a Time in America (film 3)
    (3, 'AUD12345678901234', 'VID21098765432109', '1983-01-01'),
    (3, 'AUD98765432109876', 'VID12309876543210', '1983-01-01'),
    (3, 'AUD45678901234567', 'VID78901234567890', '1983-01-01'),
-- Apocalypse Now (film 4)
    (4, 'AUD34567890123456', 'VID98765432109876', '1979-01-01'),
    (4, 'AUD56789012345678', 'VID12309876543210', '1979-01-01'),
    (4, 'AUD78901234567890', 'VID21098765432109', '1979-01-01'),
-- There Will Be Blood (film 5)
    (5, 'AUD12345678901234', 'VID12345678901234', '2007-12-26'),
    (5, 'AUD45678901234567', 'VID45678901234567', '2007-12-26'),
    (5, 'AUD56789012345678', 'VID21098765432109', '2007-12-26'),
-- In the Mood for Love (film 6)
    (6, 'AUD98765432109876', 'VID98765432109876', '2000-09-29'),
    (6, 'AUD34567890123456', 'VID78901234567890', '2000-09-29'),
    (6, 'AUD78901234567890', 'VID21098765432109', '2000-09-29'),
-- Chungking Express (film 7)
    (7, 'AUD12345678901234', 'VID12345678901234', '1994-09-14'),
    (7, 'AUD45678901234567', 'VID45678901234567', '1994-09-14'),
    (7, 'AUD56789012345678', 'VID21098765432109', '1994-09-14'),
-- Stalker (film 8)
    (8, 'AUD34567890123456', 'VID98765432109876', '1979-05-13'),
    (8, 'AUD56789012345678', 'VID12309876543210', '1979-05-13'),
    (8, 'AUD78901234567890', 'VID21098765432109', '1979-05-13'),
-- No Country for Old Men (film 9)
    (9, 'AUD12345678901234', 'VID12345678901234', '2007-11-21'),
    (9, 'AUD98765432109876', 'VID98765432109876', '2007-11-21'),
    (9, 'AUD45678901234567', 'VID78901234567890', '2007-11-21'),
-- Taxi Driver (film 10)
    (10, 'AUD98765432109876', 'VID98765432109876', '1976-02-08'),
    (10, 'AUD34567890123456', 'VID78901234567890', '1976-02-08'),
    (10, 'AUD78901234567890', 'VID21098765432109', '1976-02-08'),
-- Persona (film 11)
    (11, 'AUD12345678901234', 'VID12345678901234', '1966-10-18'),
    (11, 'AUD45678901234567', 'VID45678901234567', '1966-10-18'),
    (11, 'AUD56789012345678', 'VID21098765432109', '1966-10-18'),
-- L'Ora del Lupo (film 12)
    (12, 'AUD34567890123456', 'VID98765432109876', '1968-02-19'),
    (12, 'AUD56789012345678', 'VID12309876543210', '1968-02-19'),
    (12, 'AUD78901234567890', 'VID21098765432109', '1968-02-19'),
-- Lo Specchio (film 13)
    (13, 'AUD12345678901234', 'VID12345678901234', '1975-03-07'),
    (13, 'AUD45678901234567', 'VID45678901234567', '1975-03-07'),
    (13, 'AUD56789012345678', 'VID21098765432109', '1975-03-07'),
-- The Thing (film 14)
    (14, 'AUD34567890123456', 'VID98765432109876', '1982-06-25'),
    (14, 'AUD56789012345678', 'VID12309876543210', '1982-06-25'),
    (14, 'AUD78901234567890', 'VID21098765432109', '1982-06-25'),
-- Citizen Kane (film 15)
    (15, 'AUD12345678901234', 'VID12345678901234', '1941-05-01'),
    (15, 'AUD45678901234567', 'VID45678901234567', '1941-05-01'),
    (15, 'AUD56789012345678', 'VID21098765432109', '1941-05-01'),
-- Todo Sobre Mi Madre (film 16)
    (16, 'AUD34567890123456', 'VID98765432109876', '1999-03-19'),
    (16, 'AUD56789012345678', 'VID12309876543210', '1999-03-19'),
    (16, 'AUD78901234567890', 'VID21098765432109', '1999-03-19'),
-- Incendies (film 17)
    (17, 'AUD12345678901234', 'VID12345678901234', '2010-09-17'),
    (17, 'AUD45678901234567', 'VID45678901234567', '2010-09-17'),
    (17, 'AUD56789012345678', 'VID21098765432109', '2010-09-17'),
-- Parasite (film 18)
    (18, 'AUD34567890123456', 'VID98765432109876', '2019-05-21'),
    (18, 'AUD56789012345678', 'VID12309876543210', '2019-05-21'),
    (18, 'AUD78901234567890', 'VID21098765432109', '2019-05-21'),
-- Memories of Murder (film 19)
    (19, 'AUD12345678901234', 'VID12345678901234', '2003-05-02'),
    (19, 'AUD45678901234567', 'VID45678901234567', '2003-05-02'),
    (19, 'AUD56789012345678', 'VID21098765432109', '2003-05-02'),
-- Il Buono, il Brutto e il Cattivo (film 20)
    (20, 'AUD34567890123456', 'VID98765432109876', '1966-12-23'),
    (20, 'AUD56789012345678', 'VID12309876543210', '1966-12-23'),
    (20, 'AUD78901234567890', 'VID21098765432109', '1966-12-23'),
-- 8 1/2 (film 21)
    (21, 'AUD12345678901234', 'VID12345678901234', '1963-02-14'),
    (21, 'AUD45678901234567', 'VID45678901234567', '1963-02-14'),
    (21, 'AUD56789012345678', 'VID21098765432109', '1963-02-14'),
-- A Clockwork Orange (film 22)
    (22, 'AUD98765432109876', 'VID98765432109876', '1971-12-19'),
    (22, 'AUD34567890123456', 'VID45678901234567', '1971-12-19'),
    (22, 'AUD78901234567890', 'VID21098765432109', '1971-12-19'),
-- Barry Lyndon (film 23)
    (23, 'AUD12345678901234', 'VID12345678901234', '1975-12-18'),
    (23, 'AUD45678901234567', 'VID45678901234567', '1975-12-18'),
    (23, 'AUD56789012345678', 'VID21098765432109', '1975-12-18'),
-- 2001: Odissea nello Spazio (film 24)
    (24, 'AUD34567890123456', 'VID98765432109876', '1975-12-18'),
    (24, 'AUD56789012345678', 'VID45678901234567', '1975-12-18'),
    (24, 'AUD78901234567890', 'VID21098765432109', '1975-12-18');

INSERT INTO Codec (NomeCodec, TipoCodec, DataDistribuzione)
VALUES
    ('AAC', 'Audio', '2020-01-15'),
    ('MP3', 'Audio', '2000-05-20'),
    ('Dolby Digital', 'Audio', '1992-03-10'),
    ('H.264', 'Video', '2003-07-15'),
    ('VP9', 'Video', '2013-09-12'),
    ('DTS', 'Audio', '1993-12-05'),
    ('H.265', 'Video', '2013-03-23'),
    ('FLAC', 'Audio', '2001-08-30'),
    ('MPEG-2', 'Video', '1995-11-30'),
    ('AC-3', 'Audio', '1992-05-12');

INSERT INTO Lingua (NomeLingua)
VALUES
    ('English'),
    ('Spanish'),
    ('French'),
    ('German'),
    ('Italian'),
    ('Portuguese'),
    ('Dutch'),
    ('Russian'),
    ('Chinese'),
    ('Japanese'),
    ('Arabic'),
    ('Korean'),
    ('Hindi'),
    ('Swedish'),
    ('Danish');

-- Recensioni per il film 'La Dolce Vita'
INSERT INTO Giudizio (IdCritico, Identificatore, DataRecensione, Voto)
VALUES
    ('CC456789012345678', 1, '1961-02-10', 7),
    ('CC234567890123456', 1, '1961-02-15', 8),
    ('CC567890123456789', 1, '1961-02-17', 5),
    ('CC789012345678901', 1, '1961-02-20', 6),
    ('CC123098765432109', 1, '1961-02-22', 2),
    
    -- Recensioni per il film 'I 400 Colpi'
    ('CC567890123456789', 2, '1959-05-02', 7),
    ('CC789012345678901', 2, '1959-05-04', 8),
    ('CC123098765432109', 2, '1959-05-06', 4),
    ('CC654321098765432', 2, '1959-05-08', 5),
    ('CC890123456789012', 2, '1959-05-10', 2),
    
    -- Recensioni per il film 'Once Upon a Time in America'
    ('CC123098765432109', 3, '1984-06-15', 9),
    ('CC654321098765432', 3, '1984-06-18', 7),
    ('CC345678901234567', 3, '1984-06-20', 6),
    ('CC567890123456789', 3, '1984-06-23', 4),
    ('CC456789012345678', 3, '1984-06-25', 2),
    
    -- Recensioni per il film 'Apocalypse Now'
    ('CC123456789012345', 4, '1979-08-20', 8),
    ('CC987654321098765', 4, '1979-08-22', 9),
    ('CC456789012345678', 4, '1979-08-24', 5),
    ('CC789012345678901', 4, '1979-08-26', 4),
    ('CC345678901234567', 4, '1979-08-28', 2),
    
    -- Recensioni per il film 'There Will Be Blood'
    ('CC345678901234567', 5, '2007-12-30', 8),
    ('CC567890123456789', 5, '2008-01-04', 9),
    ('CC789012345678901', 5, '2008-01-06', 4),
    ('CC234567890123456', 5, '2008-01-09', 5),
    ('CC456789012345678', 5, '2008-01-11', 2),
    
    -- Recensioni per il film 'In the Mood for Love'
    ('CC789012345678901', 6, '2000-10-01', 9),
    ('CC234567890123456', 6, '2000-10-05', 8),
    ('CC890123456789012', 6, '2000-10-07', 4),
    ('CC123098765432109', 6, '2000-10-09', 5),
    ('CC567890123456789', 6, '2000-10-11', 2),
    
    -- Recensioni per il film 'Chungking Express'
    ('CC890123456789012', 7, '1994-09-20', 8),
    ('CC123098765432109', 7, '1994-09-25', 7),
    ('CC567890123456789', 7, '1994-09-27', 6),
    ('CC234567890123456', 7, '1994-09-29', 5),
    ('CC456789012345678', 7, '1994-10-01', 2),
    
    -- Recensioni per il film 'Stalker'
    ('CC654321098765432', 8, '1980-05-10', 7),
    ('CC123456789012345', 8, '1980-05-15', 8),
    ('CC890123456789012', 8, '1980-05-17', 4),
    ('CC987654321098765', 8, '1980-05-19', 5),
    ('CC345678901234567', 8, '1980-05-21', 2),
    
    -- Recensioni per il film 'No Country for Old Men'
    ('CC987654321098765', 9, '2007-11-25', 9),
    ('CC456789012345678', 9, '2007-11-30', 8),
    ('CC345678901234567', 9, '2007-12-02', 4),
    ('CC567890123456789', 9, '2007-12-04', 5),
    ('CC890123456789012', 9, '2007-12-06', 2),
    
    -- Recensioni per il film 'Taxi Driver'
    ('CC345678901234567', 10, '1976-02-10', 8),
    ('CC567890123456789', 10, '1976-02-13', 7),
    ('CC789012345678901', 10, '1976-02-15', 5),
    ('CC234567890123456', 10, '1976-02-17', 4),
    ('CC456789012345678', 10, '1976-02-19', 2),
    
    -- Recensioni per il film 'Persona'
    ('CC789012345678901', 11, '1966-10-22', 9),
    ('CC234567890123456', 11, '1966-10-25', 8),
    ('CC890123456789012', 11, '1966-10-27', 4),
    ('CC123098765432109', 11, '1966-10-29', 5),
    ('CC567890123456789', 11, '1966-10-31', 2),
    
    -- Recensioni per il film 'L'Ora del Lupo'
    ('CC123098765432109', 12, '1968-03-30', 7),
    ('CC654321098765432', 12, '1968-04-02', 8),
    ('CC345678901234567', 12, '1968-04-05', 5),
    ('CC567890123456789', 12, '1968-04-07', 4),
    ('CC890123456789012', 12, '1968-04-09', 2),
    
    -- Recensioni per il film 'Lo Specchio'
    ('CC890123456789012', 13, '1979-05-15', 8),
    ('CC123456789012345', 13, '1979-05-20', 7),
    ('CC567890123456789', 13, '1979-05-25', 5),
    ('CC789012345678901', 13, '1979-05-27', 4),
    ('CC234567890123456', 13, '1979-05-29', 2),
    
    -- Recensioni per il film 'The Thing'
    ('CC234567890123456', 14, '1982-07-20', 7),
    ('CC890123456789012', 14, '1982-07-25', 8),
    ('CC123098765432109', 14, '1982-07-27', 4),
    ('CC654321098765432', 14, '1982-07-29', 5),
    ('CC567890123456789', 14, '1982-07-31', 2),
    
    -- Recensioni per il film 'Citizen Kane'
    ('CC123098765432109', 15, '1942-05-05', 9),
    ('CC654321098765432', 15, '1942-05-10', 8),
    ('CC567890123456789', 15, '1942-05-12', 5),
    ('CC789012345678901', 15, '1942-05-14', 4),
    ('CC456789012345678', 15, '1942-05-16', 2),
    
    -- Recensioni per il film 'The Manster'
    ('CC123456789012345', 16, '2018-01-10', 8),
    ('CC987654321098765', 16, '2018-01-15', 7),
    ('CC456789012345678', 16, '2018-01-17', 5),
    ('CC789012345678901', 16, '2018-01-19', 4),
    ('CC345678901234567', 16, '2018-01-21', 2),
    
    -- Recensioni per il film 'Todo Sobre Mi Madre'
    ('CC456789012345678', 17, '1999-03-15', 9),
    ('CC345678901234567', 17, '1999-03-20', 8),
    ('CC123456789012345', 17, '1999-03-25', 5),
    ('CC567890123456789', 17, '1999-03-27', 4),
    ('CC789012345678901', 17, '1999-03-29', 2),
    
    -- Recensioni per il film 'Incendies'
    ('CC567890123456789', 18, '2010-09-22', 7),
    ('CC789012345678901', 18, '2010-09-27', 8),
    ('CC234567890123456', 18, '2010-09-29', 5),
    ('CC890123456789012', 18, '2010-10-01', 4),
    ('CC456789012345678', 18, '2010-10-03', 2),
    
    -- Recensioni per il film 'Parasite'
    ('CC234567890123456', 19, '2019-05-10', 8),
    ('CC890123456789012', 19, '2019-05-15', 7),
    ('CC123456789012345', 19, '2019-05-20', 5),
    ('CC456789012345678', 19, '2019-05-25', 4),
    ('CC345678901234567', 19, '2019-05-27', 2),
    
    -- Recensioni per il film 'Memories of Murder'
    ('CC123098765432109', 20, '2003-05-10', 9),
    ('CC654321098765432', 20, '2003-05-15', 7),
    ('CC789012345678901', 20, '2003-05-20', 5),
    ('CC234567890123456', 20, '2003-05-25', 4),
    ('CC567890123456789', 20, '2003-05-27', 2),
    
    -- Recensioni per il film 'Il Buono, Il Brutto, Il Cattivo'
    ('CC345678901234567', 21, '1967-01-10', 9),
    ('CC567890123456789', 21, '1967-01-13', 8),
    ('CC789012345678901', 21, '1967-01-15', 5),
    ('CC890123456789012', 21, '1967-01-17', 4),
    ('CC123098765432109', 21, '1967-01-19', 2),
    
    -- Recensioni per il film '8 1/2'
    ('CC789012345678901', 22, '1963-03-12', 8),
    ('CC234567890123456', 22, '1963-03-15', 7),
    ('CC890123456789012', 22, '1963-03-17', 4),
    ('CC123098765432109', 22, '1963-03-19', 5),
    ('CC567890123456789', 22, '1963-03-21', 2),
    
    -- Recensioni per il film 'A Clockwork Orange'
    ('CC890123456789012', 23, '1971-12-25', 7),
    ('CC123098765432109', 23, '1971-12-30', 8),
    ('CC234567890123456', 23, '1972-01-01', 5),
    ('CC456789012345678', 23, '1972-01-03', 4),
    ('CC567890123456789', 23, '1972-01-05', 2),
    
    -- Recensioni per il film 'Barry Lyndon'
    ('CC654321098765432', 24, '1975-12-30', 8),
    ('CC123456789012345', 24, '1976-01-02', 9),
    ('CC567890123456789', 24, '1976-01-05', 5),
    ('CC789012345678901', 24, '1976-01-07', 4),
    ('CC234567890123456', 24, '1976-01-09', 2),
    
    -- Recensioni per il film '2001: A Space Odyssey'
    ('CC234567890123456', 25, '1968-05-30', 9),
    ('CC890123456789012', 25, '1968-06-02', 7),
    ('CC123098765432109', 25, '1968-06-05', 4),
    ('CC567890123456789', 25, '1968-06-07', 5),
    ('CC456789012345678', 25, '1968-06-09', 2);

INSERT INTO Critico (IdCritico, Nome, Cognome)
VALUES
    ('CC123456789012345', 'John', 'Smith'),
    ('CC987654321098765', 'Emily', 'Davis'),
    ('CC456789012345678', 'Michael', 'Johnson'),
    ('CC345678901234567', 'Sarah', 'Wilson'),
    ('CC567890123456789', 'David', 'Brown'),
    ('CC789012345678901', 'Laura', 'Lee'),
    ('CC234567890123456', 'Daniel', 'Turner'),
    ('CC890123456789012', 'Jennifer', 'Hall'),
    ('CC123098765432109', 'Robert', 'Clark'),
    ('CC654321098765432', 'Patricia', 'Adams');
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
   
INSERT INTO Profilo (CodAlfanumerico, Nome, Cognome, Mail, Nickname, CodicePassword) 
VALUES
	('MN3456OP7890QR', 'Luca', 'Verdi', 'luca.verdi@example.com', 'greenluca', 'Luv2Hike!'),
	('ST9012UV3456WX', 'Giulia', 'Ferrara', 'giulia.ferrara@example.com', 'ferrari_g', 'G!Giulia2023'),
	('YZ6789AB1234CD', 'Marco', 'Esposito', 'marco.esposito@example.com', 'marcomaster', 'EsP@ssw0rd456'),
	('EF2345GH9012IJ', 'Sara', 'Russo', 'sara.russo@example.com', 'sarita', 'Passw0rd!Sara'),
	('KL5678MN3456OP', 'Davide', 'Conte', 'davide.conte@example.com', 'davidec', 'ConteDav1d3!'),
	('QR7890ST9012UV', 'Laura', 'Marino', 'laura.marino@example.com', 'lmarino', 'P@ssw0rdLaura'),
	('WX1234YZ6789AB', 'Alessio', 'Marchetti', 'alessio.marchetti@example.com', 'ale_march', 'AleRocks2023!'),
	('CD3456EF2345GH', 'Francesca', 'Romano', 'francesca.romano@example.com', 'franrom', 'P@ssFrancesca567'),
	('IJ9012KL5678MN', 'Andrea', 'Lombardi', 'andrea.lombardi@example.com', 'andylom', 'AndyL0v3r#1'),
	('OP7890QR7890ST', 'Sofia', 'Pellegrini', 'sofia.pellegrini@example.com', 'sofiap', 'PellegriniSof!'),
	('UV1234WX1234YZ', 'Giovanni', 'Barbieri', 'giovanni.barbieri@example.com', 'giova', 'G!oVa@123'),
	('AB5678CD3456EF', 'Martina', 'Serra', 'martina.serra@example.com', 'martserr', 'SerraM@rtina12'),
	('GH9012IJ9012KL', 'Luca', 'Monti', 'luca.monti@example.com', 'lmonti', 'LucaPassw0rd!'),
	('MN3456OP7890QR', 'Elena', 'Rinaldi', 'elena.rinaldi@example.com', 'elerina', 'P@ssElena34'),
	('ST5678UV1234WX', 'Simone', 'Conti', 'simone.conti@example.com', 'simo98', 'Sim0n3Pass!'),
	('YZ9012AB5678CD', 'Giulia', 'Romano', 'giulia.romano@example.com', 'giuliar', 'G!GiuliaR'),
	('EF1234GH9012IJ', 'Marco', 'Moretti', 'marco.moretti@example.com', 'marcom', 'MorettiP@ss!'),
	('KL5678MN3456OP', 'Sara', 'Villa', 'sara.villa@example.com', 'sarav', 'P@ssSaravilla'),
	('QR7890ST5678UV', 'Luca', 'Messina', 'luca.messina@example.com', 'lucam', 'MessinaL0v3!'),
	('WX1234YZ9012AB', 'Sofia', 'Vitale', 'sofia.vitale@example.com', 'sofiav', 'P@ssSofia2023'),
	('CD3456EF1234GH', 'Alessio', 'Parisi', 'alessio.parisi@example.com', 'alepar', 'AleP@risi34'),
	('IJ5678KL5678MN', 'Francesca', 'Ruggiero', 'francesca.ruggiero@example.com', 'franrug', 'FranRugg1ero!'),
	('OP9012UV1234WX', 'Andrea', 'Bianco', 'andrea.bianco@example.com', 'andybi', 'B1anc0Passw0rd'),
	('YZ1234AB5678CD', 'Sofia', 'Russo', 'sofia.russo@example.com', 'sofiarus', 'S0fiaRusso!'),
	('EF5678GH9012IJ', 'Giovanni', 'Ferri', 'giovanni.ferri@example.com', 'giovaf', 'G!0v4nniFerri'),
	('KL9012MN3456OP', 'Martina', 'Costa', 'martina.costa@example.com', 'martc', 'MartinaC0sta!'),
	('QR1234ST5678UV', 'Luca', 'Pellegrino', 'luca.pellegrino@example.com', 'lucap', 'Pellegrin0Luca'),
	('WX5678YZ1234AB', 'Elena', 'Ferrara', 'elena.ferrara@example.com', 'elenaf', 'El3n@Ferrara'),
	('CD9012EF5678GH', 'Simone', 'Marino', 'simone.marino@example.com', 'simomar', 'Sim0neM@rino'),
	('IJ1234KL9012MN', 'Giulia', 'Rinaldi', 'giulia.rinaldi@example.com', 'giuliari', 'G!GiuliaR1n'),
	('OP5678UV1234WX', 'Marco', 'Conte', 'marco.conte@example.com', 'marcocon', 'P@ssw0rdC0nte'),
	('YZ1234AB5678CD', 'Sara', 'Romano', 'sara.romano@example.com', 'sarar', 'S@r4R0mano'),
	('EF5678GH1234IJ', 'Luca', 'Moretti', 'luca.moretti@example.com', 'lucomor', 'M0rett1Luca'),
	('KL9012MN5678OP', 'Sofia', 'Villa', 'sofia.villa@example.com', 'sofiavil', 'Vill@Sofia2023'),
	('QR1234ST5678UV', 'Alessio', 'Parisi', 'alessio.parisi@example.com', 'alespar', 'AleP@risi2023'),
	('WX5678YZ1234AB', 'Francesca', 'Ruggiero', 'francesca.ruggiero@example.com', 'franrug', 'Rugg1eroPass!'),
	('CD9012EF5678GH', 'Andrea', 'Bianco', 'andrea.bianco@example.com', 'andybi', 'Bianco2023Pass'),
	('IJ1234KL9012MN', 'Sofia', 'Russo', 'sofia.russo@example.com', 'sofiarus', 'S0fi@RussoPass!');

INSERT INTO Fattura (DataEmissione, DataScadenza, Abbonamento)
VALUES
-- Fatture non Scadute
	('2023-09-01', '2023-10-01', 'Basic'), -- 1
	('2023-09-02', '2023-10-02', 'Premium'), -- 2
	('2023-09-03', '2023-10-03', 'Pro'), -- 3
	('2023-09-04', '2023-10-04', 'Deluxe'), -- 4
	('2023-09-05', '2023-10-05', 'Ultimate'), -- 5
	('2023-09-06', '2023-10-06', 'Basic'), -- 6
	('2023-09-07', '2023-10-07', 'Premium'), -- 7
	('2023-09-08', '2023-10-08', 'Pro'), -- 8
	('2023-09-09', '2023-10-09', 'Deluxe'), -- 9
	('2023-09-10', '2023-10-10', 'Ultimate'), -- 10
	('2023-09-11', '2023-10-11', 'Basic'), -- 11
	('2023-09-12', '2023-10-12', 'Premium'), -- 12
	('2023-09-13', '2023-10-13', 'Pro'), -- 13
	('2023-09-14', '2023-10-14', 'Deluxe'), -- 14
	('2023-09-15', '2023-10-15', 'Ultimate'), -- 15
	('2023-09-16', '2023-10-16', 'Basic'), -- 16
	('2023-09-17', '2023-10-17', 'Premium'), -- 17
	('2023-09-18', '2023-10-18', 'Pro'), -- 18
	('2023-09-19', '2023-10-19', 'Deluxe'), -- 19
	('2023-09-20', '2023-10-20', 'Ultimate'), -- 20
	('2023-09-21', '2023-10-21', 'Basic'), -- 21
	('2023-09-22', '2023-10-22', 'Premium'), -- 22
	('2023-09-23', '2023-10-23', 'Pro'), -- 23
	('2023-09-24', '2023-10-24', 'Deluxe'), -- 24
	('2023-09-25', '2023-10-25', 'Ultimate'), -- 25
	('2023-09-26', '2023-10-26', 'Basic'), -- 26
	('2023-09-27', '2023-10-27', 'Premium'), -- 27
	('2023-09-28', '2023-10-28', 'Pro'), -- 28
	('2023-09-29', '2023-10-29', 'Deluxe'), -- 29
	('2023-09-30', '2023-10-30', 'Ultimate'), -- 30
	('2023-10-01', '2023-11-01', 'Basic'), -- 31
	('2023-10-02', '2023-11-02', 'Premium'), -- 32
	('2023-10-03', '2023-11-03', 'Pro'), -- 33
	('2023-10-04', '2023-11-04', 'Deluxe'), -- 34
	('2023-10-05', '2023-11-05', 'Ultimate'), -- 35
	('2023-10-06', '2023-11-06', 'Basic'), -- 36
	('2023-10-07', '2023-11-07', 'Premium'), -- 37
	('2023-10-08', '2023-11-08', 'Pro'), -- 38
	('2023-10-09', '2023-11-09', 'Deluxe'), -- 39
	('2023-10-10', '2023-11-10', 'Ultimate'), -- 40
-- Fatture scadute
	('2023-08-15', '2023-09-15', 'Basic'), -- 41
	('2023-08-14', '2023-09-14', 'Premium'), -- 42
	('2023-08-13', '2023-09-13', 'Pro'), -- 43
	('2023-08-12', '2023-09-12', 'Deluxe'), -- 44
	('2023-08-11', '2023-09-11', 'Ultimate'), -- 45
	('2023-08-10', '2023-09-10', 'Basic'), -- 46
	('2023-08-09', '2023-09-09', 'Premium'), -- 47
	('2023-08-08', '2023-09-08', 'Pro'), -- 48
	('2023-08-07', '2023-09-07', 'Deluxe'), -- 49
	('2023-08-06', '2023-09-06', 'Ultimate'), -- 50
	('2023-08-05', '2023-09-05', 'Basic'), -- 51
	('2023-08-04', '2023-09-04', 'Premium'), -- 52
	('2023-08-03', '2023-09-03', 'Pro'), -- 53
	('2023-08-02', '2023-09-02', 'Deluxe'), -- 54
	('2023-08-01', '2023-09-01', 'Ultimate'), -- 55
	('2023-07-31', '2023-08-31', 'Basic'), -- 56
	('2023-07-30', '2023-08-30', 'Premium'), -- 57
	('2023-07-29', '2023-08-29', 'Pro'), -- 58
	('2023-07-28', '2023-08-28', 'Deluxe'), -- 59
	('2023-07-27', '2023-08-27', 'Ultimate'), -- 60
	('2023-07-26', '2023-08-26', 'Basic'), -- 61
	('2023-07-25', '2023-08-25', 'Premium'), -- 62
	('2023-07-24', '2023-08-24', 'Pro'), -- 63
	('2023-07-23', '2023-08-23', 'Deluxe'), -- 64
	('2023-07-22', '2023-08-22', 'Ultimate'), -- 65
	('2023-07-21', '2023-08-21', 'Basic'), -- 66
	('2023-07-20', '2023-08-20', 'Premium'), -- 67
	('2023-07-19', '2023-08-19', 'Pro'), -- 68
	('2023-07-18', '2023-08-18', 'Deluxe'), -- 69
	('2023-07-17', '2023-08-17', 'Ultimate'), -- 70
	('2023-07-16', '2023-08-16', 'Basic'), -- 71
	('2023-07-15', '2023-08-15', 'Premium'), -- 72
	('2023-07-14', '2023-08-14', 'Pro'), -- 73
	('2023-07-13', '2023-08-13', 'Deluxe'), -- 74
	('2023-07-12', '2023-08-12', 'Ultimate'), -- 75
	('2023-07-11', '2023-08-11', 'Basic'), -- 76
	('2023-07-10', '2023-08-10', 'Premium'), -- 77
	('2023-07-09', '2023-08-09', 'Pro'), -- 78
	('2023-07-08', '2023-08-08', 'Deluxe'), -- 79
	('2023-07-07', '2023-08-07', 'Ultimate'), -- 80
	('2023-07-06', '2023-08-06', 'Basic'), -- 81
	('2023-07-05', '2023-08-05', 'Premium'), -- 82
	('2023-07-04', '2023-08-04', 'Pro'), -- 83
	('2023-07-03', '2023-08-03', 'Deluxe'), -- 84
	('2023-07-02', '2023-08-02', 'Ultimate'), -- 85
	('2023-07-01', '2023-08-01', 'Basic'), -- 86
	('2023-06-30', '2023-07-31', 'Premium'), -- 87
	('2023-06-29', '2023-07-30', 'Pro'), -- 88
	('2023-06-28', '2023-07-29', 'Deluxe'), -- 89
	('2023-06-27', '2023-07-28', 'Ultimate'), -- 90
	('2023-06-26', '2023-07-27', 'Basic'), -- 91
	('2023-06-25', '2023-07-26', 'Premium'), -- 92
	('2023-06-24', '2023-07-25', 'Pro'), -- 93
	('2023-06-23', '2023-07-24', 'Deluxe'), -- 94
	('2023-06-22', '2023-07-23', 'Ultimate'), -- 95
	('2023-06-21', '2023-07-22', 'Basic'), -- 96
	('2023-06-20', '2023-07-21', 'Premium'), -- 97
	('2023-06-19', '2023-07-20', 'Pro'), -- 98
	('2023-06-18', '2023-07-19', 'Deluxe'), -- 99
	('2023-06-17', '2023-07-18', 'Ultimate'), -- 100
	('2023-06-16', '2023-07-17', 'Basic'), -- 101
	('2023-06-15', '2023-07-16', 'Premium'), -- 102
	('2023-06-14', '2023-07-15', 'Pro'), -- 103
	('2023-06-13', '2023-07-14', 'Deluxe'), -- 104
	('2023-06-12', '2023-07-13', 'Ultimate'), -- 105
	('2023-06-11', '2023-07-12', 'Basic'), -- 106
	('2023-06-10', '2023-07-11', 'Premium'), -- 107
	('2023-06-09', '2023-07-10', 'Pro'), -- 108
	('2023-06-08', '2023-07-09', 'Deluxe'), -- 109
	('2023-06-07', '2023-07-08', 'Ultimate'), -- 110
	('2023-06-06', '2023-07-07', 'Basic'), -- 111
	('2023-06-05', '2023-07-06', 'Premium'), -- 112
	('2023-06-04', '2023-07-05', 'Pro'), -- 113
	('2023-06-03', '2023-07-04', 'Deluxe'), -- 114
	('2023-06-02', '2023-07-03', 'Ultimate'), -- 115
	('2023-06-01', '2023-07-02', 'Basic'), -- 116
	('2023-05-31', '2023-07-01', 'Premium'), -- 117
	('2023-05-30', '2023-06-30', 'Pro'), -- 118
	('2023-05-29', '2023-06-29', 'Deluxe'), -- 119
	('2023-05-28', '2023-06-28', 'Ultimate'); -- 120

INSERT INTO Carta (codCarta)
VALUES
	('1234-5678-9012-3456'),
	('9876-5432-1098-7654'),
	('4567-8901-2345-6789'),
	('7890-1234-5678-9012'),
	('3456-7890-1234-5678'),
	('6789-0123-4567-8901'),
	('2345-6789-0123-4567'),
	('5678-9012-3456-7890'),
	('9012-3456-7890-1234'),
	('4321-8765-0987-6543'),
	('7654-3210-9876-5432'),
	('5432-1098-7654-3210'),
	('8765-4321-0987-6543'),
	('2109-8765-4321-0987'),
	('6543-2109-8765-4321'),
	('7891-2345-6789-012'),
	('5678-1234-5678-1234'),
	('9012-5678-9012-5678'),
	('2345-9012-3456-9012'),
	('6789-3456-7890-3456'),
	('1234-7890-1234-7890'),
	('5678-2345-5678-2345'),
	('9012-6789-9012-6789'),
	('2345-1234-2345-1234'),
	('6789-5678-6789-5678'),
	('1234-9012-1234-9012'),
	('5678-3456-5678-3456'),
	('9012-7890-9012-7890'),
	('2345-2345-2345-2345'),
	('6789-6789-6789-6789'),
	('1234-5678-1234-5678'),
	('5678-9012-5678-9012'),
	('9012-2345-9012-2345'),
	('2345-6789-2345-6789'),
	('6789-1234-6789-1234'),
	('1234-9012-1234-9012'),
	('5678-2345-5678-2345'),
	('9012-6789-9012-6789'),
	('2345-2345-2345-2345'),
	('6789-6789-6789-6789');

INSERT INTO Piani(NomePiano, MaxOre, MaxGiga, Costo)
VALUES
	("Basic", 100, 100, 5.00),
	("Premium", 150, 150, 7.50),
	("Pro", 250, 250, 10.00),
    ("Deluxe", 300, 300, 15.00),
    ("Ultimate", NULL, NULL, 20);	-- NULL = Non ha limite

INSERT INTO Funzionalita (Caratteristica)
VALUES
	('Accesso a una selezione limitata di film.'), -- Abbonamento Basic
	('Streaming in definizione standard (SD).'), -- Abbonamento Basic
	('Pubblicità durante la riproduzione dei film.'), -- Abbonamento Basic
	('Accesso a una singola schermata alla volta.'), -- Abbonamento Basic
	('Visualizzazione offline non disponibile.'), -- Abbonamento Basic
	('Accesso a una vasta libreria di film e serie TV.'), -- Abbonamento Premium
	('Streaming in alta definizione (HD) e 4K, se disponibile.'), -- Abbonamento Premium
	('Riproduzione senza pubblicità.'), -- Abbonamento Premium
	('Accesso a due schermate contemporaneamente.'), -- Abbonamento Premium
	('Possibilità di creare elenchi personalizzati (playlist).'), -- Abbonamento Premium
	('Accesso anticipato a film in uscita al cinema.'), -- Abbonamento Pro
	('Contenuti esclusivi disponibili solo per gli abbonati Pro.'), -- Abbonamento Pro
	('Funzione di suggerimento personalizzato basata sulla cronologia di visualizzazione.'), -- Abbonamento Pro
	('Accesso a tre schermate contemporaneamente.'), -- Abbonamento Pro
	('Possibilità di scaricare film e serie TV per la visualizzazione offline.'), -- Abbonamento Pro
	('Accesso a eventi in diretta e anteprime esclusive.'), -- Abbonamento Deluxe
	('Biblioteca di contenuti in 3D, se supportato.'), -- Abbonamento Deluxe
	('Streaming senza limiti su più dispositivi.'), -- Abbonamento Deluxe
	('Possibilità di creare profili utente separati.'), -- Abbonamento Deluxe
	('Accesso a contenuti extra, come documentari e dietro le quinte.'), -- Abbonamento Deluxe
    ('Accesso a una vasta libreria di contenuti globali.'), -- Abbonamento Ultimate
    ('Supporto per dispositivi smart TV e console di gioco.'), -- Abbonamento Ultimate
    ('Accesso a contenuti VR (realtà virtuale), se disponibili.'), -- Abbonamento Ultimate
    ('Assistenza clienti prioritaria 24/7.'); -- Abbonamento Ultimate
    
INSERT INTO Offerta (NomePiano, Funzionalita)
VALUES
	('Basic', 'Accesso a una selezione limitata di film.'),
	('Basic', 'Streaming in definizione standard (SD).'),
	('Basic', 'Pubblicità durante la riproduzione dei film.'),
	('Basic', 'Accesso a una singola schermata alla volta.'),
	('Basic', 'Visualizzazione offline non disponibile.'),
	('Premium', 'Accesso a una vasta libreria di film e serie TV.'),
	('Premium', 'Streaming in alta definizione (HD) e 4K, se disponibile.'),
	('Premium', 'Riproduzione senza pubblicità.'),
	('Premium', 'Accesso a due schermate contemporaneamente.'),
	('Premium', 'Possibilità di creare elenchi personalizzati (playlist).'),
	('Pro', 'Accesso anticipato a film in uscita al cinema.'),
	('Pro', 'Contenuti esclusivi disponibili solo per gli abbonati Pro.'),
	('Pro', 'Funzione di suggerimento personalizzato basata sulla cronologia di visualizzazione.'),
	('Pro', 'Accesso a tre schermate contemporaneamente.'),
	('Pro', 'Possibilità di scaricare film e serie TV per la visualizzazione offline.'),
	('Deluxe', 'Accesso a eventi in diretta e anteprime esclusive.'),
	('Deluxe', 'Biblioteca di contenuti in 3D, se supportato.'),
	('Deluxe', 'Streaming senza limiti su più dispositivi.'),
	('Deluxe', 'Possibilità di creare profili utente separati.'),
	('Deluxe', 'Accesso a contenuti extra, come documentari e dietro le quinte.'),
	('Ultimate', 'Accesso a una vasta libreria di contenuti globali.'),
    ('Ultimate', 'Supporto per dispositivi smart TV e console di gioco.'),
    ('Ultimate', 'Accesso a contenuti VR (realtà virtuale), se disponibili.'),
    ('Ultimate', 'Assistenza clienti prioritaria 24/7.');