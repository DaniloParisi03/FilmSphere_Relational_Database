use filmsphere;

INSERT INTO Film (CountryOfProduction, ReleaseYear, Duration)
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



# 15 directors
INSERT INTO CastMember (FiscalCode, Role, Name, Surname)
VALUES
    ('ABC123XYZ4567890A', 'Director', 'Woody', 'Allen'),
    ('DEF456UVW7890123B', 'Director', 'Federico', 'Fellini'),
    ('GHI789LMN0123456C', 'Director', 'François', 'Truffaut'),
    ('JKL012OPQ3456789D', 'Director', 'Sergio', 'Leone'),
    ('MNO345PQR6789012E', 'Director', 'Francis Ford', 'Coppola'),
    ('PQR678STU9012345F', 'Director', 'Paul Thomas', 'Anderson'),
    ('STU901VWX2345678G', 'Director', 'Wong', 'Kar-wai'),
    ('VWX234YZA5678901H', 'Director', 'Andrei', 'Tarkovsky'),
    ('YZA567BCD8901234I', 'Director', 'Joel', 'Coen'),
    ('BCD890EFG0123456J', 'Director', 'Ethan', 'Coen'),
    ('EFG012HIJ3456789K', 'Director', 'Martin', 'Scorsese'),
    ('HIJ345KLM6789012L', 'Director', 'Ingmar', 'Bergman'),
    ('KLM678NOP9012345M', 'Director', 'John', 'Carpenter'),
    ('NOP901QRS2345678N', 'Director', 'Orson', 'Welles'),
    ('QRS234TUV5678901O', 'Director', 'Pedro', 'Almodóvar'),
    ('TUV567WXY8901234P', 'Director', 'Denis', 'Villeneuve'),
    ('WXY890ZAB0123456Q', 'Director', 'Bong', 'Joon-ho'),
    ('ZAB012CDE3456789R', 'Director', 'Stanley', 'Kubrick');
    
# 30 actors
INSERT INTO CastMember (FiscalCode, Role, Name, Surname)
VALUES
    ('AAAAAA11B22C333D1', 'Actor', 'Marcello', 'Mastroianni'),
    ('BBBBBB22C33D44441', 'Actor', 'Jean-Pierre', 'Léaud'),
    ('CCCCC33D44E5555F1', 'Actor', 'Robert', 'De Niro'),
    ('DDDDDD44E55F66661', 'Actor', 'Martin', 'Sheen'),
    ('EEEEEE55F66G77771', 'Actor', 'Daniel', 'Day-Lewis'),
    ('FFFFFF66G77H88881', 'Actor', 'Tony', 'Leung'),
    ('GGGGGG77H88I99991', 'Actor', 'Maggie', 'Cheung'),
    ('HHHHHH88I99J00001', 'Actor', 'Brigitte', 'Lin'),
    ('IIIIII99J00K11111', 'Actor', 'Takeshi', 'Kaneshiro'),
    ('JJJJJJ00K11L22221', 'Actor', 'Aleksandr', 'Kaidanovsky'),
    ('KKKKK11L22M3333N1', 'Actor', 'Josh', 'Brolin'),
    ('LLLLL22M33N4444O1', 'Actor', 'Tommy', 'Lee Jones'),
    ('MMMMM33N44O5555P1', 'Actor', 'Javier', 'Bardem'),
    ('NNNNN44O55P6666Q1', 'Actor', 'Liv', 'Ullmann'),
    ('OOOOO55P66Q7777R1', 'Actor', 'Bibi', 'Andersson'),
    ('PPPPPP66Q77R88881', 'Actor', 'Max', 'von Sydow'),
    ('QQQQQQ77R88S99991', 'Actor', 'Margarita', 'Terekhova'),
    ('RRRRRR88S99T00001', 'Actor', 'Kurt', 'Russell'),
    ('NOP901QRS2345678N', 'Actor', 'Orson', 'Welles'),
    ('TTTTTT00U11V22221', 'Actor', 'Cecilia', 'Roth'),
    ('UUUUUU11V22W33331', 'Actor', 'Lubna', 'Azabal'),
    ('VVVVVV22W33X44441', 'Actor', 'Song', 'Kang-ho'),
    ('WWWWWW33X44Y55551', 'Actor', 'Lee', 'Sun-kyun'),
    ('XXXXXXXX44Y55Z6A1', 'Actor', 'Cho', 'Yeo-jeong'),
    ('CLNI45HI4534IPP55', 'Actor', 'Clint', 'Eastwood'),
    ('YYYYYYYY55Z66A7B1', 'Actor', 'Lee', 'Van Cleef'),
    ('ZZZZZZZZ66A77B8C1', 'Actor', 'Eli', 'Wallach'),
    ('AAAAAAAA77B88C9D1', 'Actor', 'Malcolm', 'McDowell'),
    ('BBBBBBBB88C99D0E1', 'Actor', 'Ryan', 'ONeal'),
    ('CCCCCCCC99D00E1F1', 'Actor', 'Keir', 'Dullea'),
    ('DDDD00E131F2222G1', 'Actor', 'Gary', 'Lockwood');
    
    INSERT INTO FilmAward (Name, Type)
VALUES
    ('Oscar', 'Best Film'),
    ('Golden Globe', 'Best Film'),
    ('Cannes Film Festival', 'Best Film'),
    ('Grammy', 'Best Film'),
    ('Venice Film Festival',  'Best Film'),


	('Oscar', 'Best Foreign Film'),
    ('Golden Globe','Best Foreign Film'),
    ('Cannes Film Festival', 'Best Foreign Film'),
    ('Grammy', 'Best Foreign Film'),
    ('Venice Film Festival',  'Best Foreign Film'),
    
    ('Oscar', 'Best Original Score'),
    ('Golden Globe', 'Best Original Score'),
    ('Cannes Film Festival', 'Best Original Score'),
    ('Grammy', 'Best Original Score'),
	('Venice Film Festival', 'Best Original Score'),
   
	('Oscar','Best Screenplay'),
    ('Golden Globe', 'Best Screenplay'),
	('Cannes Film Festival', 'Best Screenplay'),
    ('Grammy', 'Best Screenplay'),
	('Venice Film Festival', 'Best Screenplay');

INSERT INTO FilmAwarding (Name, Type, FilmId)
VALUES
    ('Cannes Film Festival', 'Best Film', 1),
    ('Venice Film Festival', 'Best Foreign Film', 2),
    ('Oscar', 'Best Original Score', 3),
    ('Golden Globe', 'Best Film', 3),
    ('Cannes Film Festival', 'Best Film', 4),
    ('Golden Globe', 'Best Film', 5),
    ('Cannes Film Festival', 'Best Foreign Film', 6),
    ('Cannes Film Festival', 'Best Screenplay', 7),
    ('Venice Film Festival', 'Best Screenplay', 7),
    ('Cannes Film Festival', 'Best Screenplay', 8),
    ('Oscar', 'Best Film', 9),
    ('Oscar', 'Best Foreign Film', 13),
    ('Grammy', 'Best Film', 14),
    ('Oscar', 'Best Film', 15),
    ('Golden Globe', 'Best Film', 15),
    ('Venice Film Festival', 'Best Foreign Film', 16),
    ('Oscar', 'Best Foreign Film', 18),
    ('Golden Globe', 'Best Original Score', 18),
    ('Oscar', 'Best Original Score', 20),
    ('Golden Globe', 'Best Original Score', 20),
    ('Venice Film Festival', 'Best Film', 21);

INSERT INTO CastAward(Name, Type)
VALUES
    ('Oscar', 'Best Director'),
    ('Golden Globe', 'Best Director'),
    ('Cannes Film Festival', 'Best Director'),
    ('Grammy', 'Best Director'),
    ('Venice Film Festival', 'Best Director'),

	('Oscar', 'Best Lead Actor'),
    ('Golden Globe','Best Lead Actor'),
    ('Cannes Film Festival', 'Best Lead Actor'),
    ('Grammy', 'Best Lead Actor'),
    ('Venice Film Festival',  'Best Lead Actor'),
    
    ('Oscar',  'Best Supporting Actor'),
    ('Golden Globe', 'Best Supporting Actor'),
    ('Cannes Film Festival',  'Best Supporting Actor'),
    ('Grammy',  'Best Supporting Actor'),
	('Venice Film Festival',  'Best Supporting Actor')
;

INSERT INTO Genre (GenreName)
VALUES
    ('Action'),
    ('Adventure'),
    ('Comedy'),
    ('Drama'),
    ('Horror'),
    ('Sci-Fi'),
    ('Fantasy'),
    ('Romance'),
    ('Thriller'),
    ('Animation'),
    ('Mystery'),
    ('Western'),
    ('Crime');
   
INSERT INTO AudioFormat (AudioCode, FormatName, QualityIndex)
VALUES
    ('AUD12345678901234', 'Dolby Digital', 5),
    ('AUD98765432109876', 'DTS-HD Master Audio', 4),
    ('AUD45678901234567', 'PCM', 5),
    ('AUD34567890123456', 'Dolby Atmos', 4),
    ('AUD56789012345678', 'AAC', 3),
    ('AUD78901234567890', 'FLAC', 5);


INSERT INTO VideoFormat (VideoCode, Resolution, Bitrate, AspectRatio)
VALUES
    ('VID12345678901234', '1920x1080', 8000, '16:9'),
    ('VID98765432109876', '3840x2160', 12000, '16:9'),
    ('VID45678901234567', '1280x720', 4500, '16:9'),
    ('VID78901234567890', '3840x2160', 15000, '2.35:1'),
    ('VID12309876543210', '1920x1080', 5000, '4:3'),
    ('VID21098765432109', '1280x720', 3000, '4:3');

INSERT INTO Codec (CodecName, CodecType, DistributionDate)
VALUES
    ('AAC', 'Audio', '2020-01-15'),
    ('MP3', 'Audio', '2000-05-20'),
    ('Dolby Digital', 'Audio', '1992-03-10'),    
    ('DTS', 'Audio', '1993-12-05'),
    ('FLAC', 'Audio', '2001-08-30'),
    ('AC-3', 'Audio', '1992-05-12');
    
    
INSERT INTO Codec (CodecName, CodecType, DistributionDate)
VALUES
    ('H.264', 'Video', '2003-07-15'),
    ('VP9', 'Video', '2013-09-12'),
    ('H.265', 'Video', '2013-03-23'),
    ('MPEG-2', 'Video', '1995-11-30');

## Hardware
INSERT INTO Hardware (Model, HardwareType)
VALUES
    ('SoundWave Pro', 'Sound Card'),
    ('SonicMaster X1', 'Sound Card'),
    ('AudioFidelity 2000', 'Sound Card'),
    ('HarmonySound DS', 'Sound Card'),
    ('CrystalClear Audio', 'Sound Card'),
    ('UltraVision GTX', 'Video Card'),
    ('VideoMaster 5000', 'Video Card'),
    ('VisualFX 2X', 'Video Card'),
    ('PixelPower Pro', 'Video Card'),
    ('GraphicForce RTX', 'Video Card');
    
INSERT INTO Language (LanguageName)
VALUES
    ('English'),
    ('Spanish'),
    ('French'),
    ('Swedish'),
    ('Italian'),
    ('Portuguese'),
    ('Russian'),
    ('Chinese'),
    ('Korean');

INSERT INTO GeoState (StateIP, StateName)
VALUES
    (11110000, 'Italy'),
    (22220000, 'France'),
    (33330000, 'United States'),
    (44440000, 'China'),
    (55550000, 'Russia'),
    (66660000, 'Sweden'),
    (77770000, 'Spain'),
    (88880000, 'Canada'),
    (99990000, 'South Korea'),
    (12120000, 'United Kingdom');
    
    
INSERT INTO Critic (CriticId, Name, Surname)
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


INSERT INTO Profile (ProfileCode, Name, Surname, Email, Nickname, PasswordHash) 
VALUES
	('MN3456OP7890QR', 'Luca', 'Verdi', 'luca.verdi@filmsphere.com', 'greenluca', 'Luv2Hike!'),
	('ST9012UV3456WX', 'Giulia', 'Ferrara', 'giulia.ferrara@filmsphere.com', 'ferrari_g', 'G!Giulia2023'),
	('YZ6789AB1234CD', 'Marco', 'Esposito', 'marco.esposito@filmsphere.com', 'marcomaster', 'EsP@ssw0rd456'),
	('EF2345GH9012IJ', 'Sara', 'Russo', 'sara.russo@filmsphere.com', 'sarita', 'Passw0rd!Sara'),
	('KL5678MN3456OP', 'Davide', 'Conte', 'davide.conte@filmsphere.com', 'davidec', 'ConteDav1d3!'),
	('QR7890ST9012UV', 'Laura', 'Marino', 'laura.marino@filmsphere.com', 'lmarino', 'P@ssw0rdLaura'),
	('WX1234YZ6789AB', 'Alessio', 'Marchetti', 'alessio.marchetti@filmsphere.com', 'ale_march', 'AleRocks2023!'),
	('CD3456EF2345GH', 'Francesca', 'Romano', 'francesca.romano@filmsphere.com', 'franrom', 'P@ssFrancesca567'),
	('IJ9012KL5678MN', 'Andrea', 'Lombardi', 'andrea.lombardi@filmsphere.com', 'andylom', 'AndyL0v3r#1'),
	('OP7890QR7890ST', 'Sofia', 'Pellegrini', 'sofia.pellegrini@filmsphere.com', 'sofiap', 'PellegriniSof!')
;

INSERT INTO Plan(PlanName, MaxHours, MaxGB, Cost)
VALUES
	("Basic", 100, 100, 5.00),
	("Premium", 150, 150, 7.50),
	("Pro", 250, 250, 10.00),
    ("Deluxe", 300, 300, 15.00),
    ("Ultimate", NULL, NULL, 20);	-- NULL = No limit

INSERT INTO Invoice (IssueDate, ExpiryDate, PlanName)
VALUES
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
    -- Expired
    ('2023-08-15', '2023-09-15', 'Basic'), -- 11
    ('2023-08-14', '2023-09-14', 'Premium'), -- 12
    ('2023-08-13', '2023-09-13', 'Pro'), -- 13
    ('2023-08-12', '2023-09-12', 'Deluxe'), -- 14
    ('2023-08-11', '2023-09-11', 'Ultimate'), -- 15
    ('2023-08-10', '2023-09-10', 'Basic'), -- 16
    ('2023-08-09', '2023-09-09', 'Premium'), -- 17
    ('2023-08-08', '2023-09-08', 'Pro'), -- 18
    ('2023-08-07', '2023-09-07', 'Deluxe'), -- 19
    ('2023-08-06', '2023-09-06', 'Ultimate'), -- 20
    ('2023-08-05', '2023-09-05', 'Basic'), -- 21
    ('2023-08-04', '2023-09-04', 'Premium'), -- 22
    ('2023-08-03', '2023-09-03', 'Pro'), -- 23
    ('2023-08-02', '2023-09-02', 'Deluxe'), -- 24
    ('2023-08-01', '2023-09-01', 'Ultimate'), -- 25
    ('2023-07-31', '2023-08-31', 'Basic'), -- 26
    ('2023-07-30', '2023-08-30', 'Premium'), -- 27
    ('2023-07-29', '2023-08-29', 'Pro'), -- 28
    ('2023-07-28', '2023-08-28', 'Deluxe'), -- 29
    ('2023-07-27', '2023-08-27', 'Ultimate'), -- 30
    ('2023-07-26', '2023-08-26', 'Basic'), -- 31
    ('2023-07-25', '2023-08-25', 'Premium'), -- 32
    ('2023-07-24', '2023-08-24', 'Pro'), -- 33
    ('2023-07-23', '2023-08-23', 'Deluxe'), -- 34
    ('2023-07-22', '2023-08-22', 'Ultimate'), -- 35
    ('2023-07-21', '2023-08-21', 'Basic'), -- 36
    ('2023-07-20', '2023-08-20', 'Premium'), -- 37
    ('2023-07-19', '2023-08-19', 'Pro'), -- 38
    ('2023-07-18', '2023-08-18', 'Deluxe'), -- 39
    ('2023-07-17', '2023-08-17', 'Ultimate'); -- 40

INSERT INTO Card (CardCode)
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
	('4321-8765-0987-6543');



INSERT INTO Feature (FeatureName)
VALUES
	('Access to a limited selection of films.'), -- Basic subscription
	('Streaming in standard definition (SD).'), -- Basic subscription
	('Advertisements during film playback.'), -- Basic subscription
	('Access to a single screen at a time.'), -- Basic subscription
	('Offline viewing not available.'), -- Basic subscription
	('Access to a vast library of films and TV series.'), -- Premium subscription
	('Streaming in high definition (HD) and 4K, where available.'), -- Premium subscription
	('Ad-free playback.'), -- Premium subscription
	('Access to two screens simultaneously.'), -- Premium subscription
	('Ability to create personalised lists (playlists).'), -- Premium subscription
	('Early access to films releasing in cinemas.'), -- Pro subscription
	('Exclusive content available only for Pro subscribers.'), -- Pro subscription
	('Personalised recommendation feature based on viewing history.'), -- Pro subscription
	('Access to three screens simultaneously.'), -- Pro subscription
	('Ability to download films and TV series for offline viewing.'), -- Pro subscription
	('Access to live events and exclusive previews.'), -- Deluxe subscription
	('3D content library, if supported.'), -- Deluxe subscription
	('Unlimited streaming across multiple devices.'), -- Deluxe subscription
	('Ability to create separate user profiles.'), -- Deluxe subscription
	('Access to extra content, such as documentaries and behind the scenes.'), -- Deluxe subscription
    ('Access to a vast library of global content.'), -- Ultimate subscription
    ('Support for smart TV devices and gaming consoles.'), -- Ultimate subscription
    ('Access to VR content (virtual reality), where available.'), -- Ultimate subscription
    ('Priority customer support 24/7.'); -- Ultimate subscription
    
## Device
INSERT INTO Device (DeviceType, LanguageName)
VALUES
    ('Tablet', 'Portuguese'),    -- 1
    ('Phone', 'Korean'),         -- 2
    ('Laptop', 'English'),       -- 3
    ('Phone', 'Russian'),        -- 4
    ('Tablet', 'Spanish'),       -- 5
    ('Laptop', 'Chinese'),       -- 6
    ('Phone', 'Swedish'),        -- 7
    ('Tablet', 'Italian'),       -- 8
    ('Laptop', 'French'),        -- 9
    ('Phone', 'Spanish');        -- 10
    
## StreamingServer
INSERT INTO StreamingServer (ServerIP, Bandwidth, MaxCapacity, MaxUsers, CurrentLoad)
VALUES
    (11110321, 1000, 500, 257, 0),
    (22220578, 2000, 800, 398, 0),
    (33330124, 1500, 600, 187, 0),
    (44440756, 2500, 1000, 462, 0),
    (66660287, 1200, 700, 319, 0),
    (77770654, 1800, 900, 221, 0),
    (88880189, 2200, 1100, 377, 0),
    (99990765, 1300, 700, 486, 0),
    (12120543, 2800, 1200, 165, 0),
    (11110001, 1900, 950, 275, 0),
    (33330054, 2100, 1050, 405, 0),
    (44440233, 1700, 850, 195, 0),
    (55550567, 2400, 1150, 472, 0),
    (66660258, 1100, 600, 256, 0),
    (77770176, 2000, 950, 385, 0),
    (88880294, 2600, 1300, 275, 0),
    (99990240, 1400, 750, 480, 0),
    (12120704, 2300, 1100, 195, 0);
