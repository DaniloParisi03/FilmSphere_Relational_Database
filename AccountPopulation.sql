use filmsphere;
--
DELIMITER $$
CREATE TRIGGER InserisciVisione
BEFORE INSERT ON Visione
FOR EACH ROW
BEGIN
	SET @idDispositivo = (
		Select CodDispositivo
        FROM Profilo NATURAL JOIN Interfaccia
        WHERE CodAlfanumerico = NEW.CodAlfanumerico
        LIMIT 1
    );
    SET @ipDispositivo = (SELECT
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
		END);
	
    SET @ControlloStato = (
		(SELECT COUNT(*)
        FROM RestrizioneAudio
        WHERE CodAudio = NEW.CodAudio AND IpStato = @ipDispositivo
        ) +
        (
        SELECT COUNT(*)
        FROM RestrizioneVideo
        WHERE CodVideo = NEW.CodVideo AND IpStato = @ipDispositivo
        )
    );
    IF (@ControlloStato <> 0) THEN
		SIGNAL SQLSTATE 'sqlstate_value' 
        SET MESSAGE_TEXT = 'error_message';
    END IF;
    
	SET @ipDispositivo = @ipDispositivo * 10000 + (SELECT LPAD(FLOOR(RAND() * 10000), 4, '0'));
    SET @ipServer = 0;
    CALL ServerDispositivo(@idDispositivo, @ipDispositivo, NEW.Identificatore, @ipServer);
    CALL IniziaConnessione(@ipServer, @idDispositivo, @ipDispositivo, NEW.DataVisualizzazione);
    SET @DurataFilm = (SELECT Durata FROM Film WHERE Identificatore = NEW.Identificatore);
    CALL TerminaConnessione(@ipServer, @idDispositivo, @ipDispositivo, DATE_ADD(NEW.DataVisualizzazione, INTERVAL @DurataFilm MINUTE);
END $$
DELIMITER ;

INSERT INTO Profilo (CodAlfanumerico, Nome, Cognome, Mail, Nickname, CodicePassword) 
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

INSERT INTO Recensione (CodAlfanumerico, Identificatore, Voto)
VALUES
    ('MN3456OP7890QR', 1, 4.5),
    ('ST9012UV3456WX', 2, 4.0),
    ('YZ6789AB1234CD', 3, 5.0),
    ('EF2345GH9012IJ', 4, 4.8),
    ('KL5678MN3456OP', 5, 4.6),
    ('QR7890ST9012UV', 6, 4.7),
    ('WX1234YZ6789AB', 7, 4.3),
    ('CD3456EF2345GH', 8, 4.9),
    ('IJ9012KL5678MN', 9, 4.7),
    ('OP7890QR7890ST', 10, 4.5),
    ('CD3456EF2345GH', 11, 4.8),
    ('IJ9012KL5678MN', 12, 4.2),
    ('OP7890QR7890ST', 13, 4.6),
    ('OP7890QR7890ST', 14, 4.4),
    ('QR7890ST9012UV', 15, 4.1),
    ('WX1234YZ6789AB', 16, 3.8),
    ('EF2345GH9012IJ', 17, 4.0),
    ('KL5678MN3456OP', 18, 4.7),
    ('YZ6789AB1234CD', 19, 4.8),
    ('ST9012UV3456WX', 20, 4.6),
    ('MN3456OP7890QR', 21, 4.9),
    ('MN3456OP7890QR', 22, 4.7),
    ('CD3456EF2345GH', 23, 4.5),
    ('CD3456EF2345GH', 24, 4.8),
    ('CD3456EF2345GH', 25, 4.0),

    ('EF2345GH9012IJ', 25, 2.9),
    ('KL5678MN3456OP', 24, 4.2),
    ('QR7890ST9012UV', 23, 4.3),
    ('WX1234YZ6789AB', 22, 2.7),
    ('CD3456EF2345GH', 21, 2.5),
    ('IJ9012KL5678MN', 20, 3.0),
    ('OP7890QR7890ST', 19, 3.1),
    ('CD3456EF2345GH', 18, 2.8),
    ('IJ9012KL5678MN', 17, 2.3),
    ('OP7890QR7890ST', 16, 3.2),
    ('OP7890QR7890ST', 15, 2.6),
    ('QR7890ST9012UV', 14, 2.9),
    ('WX1234YZ6789AB', 13, 2.3),
    ('EF2345GH9012IJ', 12, 3.0),
    ('KL5678MN3456OP', 11, 3.2),
    ('YZ6789AB1234CD', 10, 3.1),
    ('ST9012UV3456WX', 9, 3.3),
    ('MN3456OP7890QR', 8, 4.5),
    ('CD3456EF2345GH', 7, 4.6),
    ('IJ9012KL5678MN', 6, 4.8),
    ('OP7890QR7890ST', 5, 4.4),
    ('CD3456EF2345GH', 4, 4.0),
    ('CD3456EF2345GH', 3, 4.5),
    ('CD3456EF2345GH', 2, 4.2),
    ('CD3456EF2345GH', 1, 3.7);

INSERT INTO Fattura (DataEmissione, DataScadenza, Abbonamento)
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
    -- Scadute
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
	('4321-8765-0987-6543');

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
    
## Sottoscrizione
INSERT INTO Sottoscrizione (CodAlfanumerico, NomePiano)
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
    
INSERT INTO DaPagare(CodAlfanumerico, CodFattura)
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

INSERT INTO Pagato (CodAlfanumerico, CodFattura, DataPagamento)
VALUES
    ('MN3456OP7890QR', 11, DATEADD(DAY, 7, '2023-08-15')),
    ('MN3456OP7890QR', 12, DATEADD(DAY, 10, '2023-08-14')),
    ('MN3456OP7890QR', 13, DATEADD(DAY, 2, '2023-08-13')),
    ('ST9012UV3456WX', 14, DATEADD(DAY, 5, '2023-08-12')),
    ('ST9012UV3456WX', 15, DATEADD(DAY, 8, '2023-08-11')),
    ('ST9012UV3456WX', 16, DATEADD(DAY, 6, '2023-08-10')),
    ('YZ6789AB1234CD', 17, DATEADD(DAY, 3, '2023-08-09')),
    ('YZ6789AB1234CD', 18, DATEADD(DAY, 4, '2023-08-08')),
    ('YZ6789AB1234CD', 19, DATEADD(DAY, 1, '2023-08-07')),
    ('EF2345GH9012IJ', 20, DATEADD(DAY, 12, '2023-08-06')),
    ('EF2345GH9012IJ', 21, DATEADD(DAY, 15, '2023-08-05')),
    ('EF2345GH9012IJ', 22, DATEADD(DAY, 18, '2023-08-04')),
    ('KL5678MN3456OP', 23, DATEADD(DAY, 14, '2023-08-03')),
    ('KL5678MN3456OP', 24, DATEADD(DAY, 17, '2023-08-02')),
    ('KL5678MN3456OP', 25, DATEADD(DAY, 9, '2023-08-01')),
    ('QR7890ST9012UV', 26, DATEADD(DAY, 11, '2023-07-31')),
    ('QR7890ST9012UV', 27, DATEADD(DAY, 13, '2023-07-30')),
    ('QR7890ST9012UV', 28, DATEADD(DAY, 16, '2023-07-29')),
    ('WX1234YZ6789AB', 29, DATEADD(DAY, 19, '2023-07-28')),
    ('WX1234YZ6789AB', 30, DATEADD(DAY, 7, '2023-07-27')),
    ('WX1234YZ6789AB', 31, DATEADD(DAY, 5, '2023-07-26')),
    ('CD3456EF2345GH', 32, DATEADD(DAY, 3, '2023-07-25')),
    ('CD3456EF2345GH', 33, DATEADD(DAY, 14, '2023-07-24')),
    ('CD3456EF2345GH', 34, DATEADD(DAY, 12, '2023-07-23')),
    ('IJ9012KL5678MN', 35, DATEADD(DAY, 10, '2023-07-22')),
    ('IJ9012KL5678MN', 36, DATEADD(DAY, 8, '2023-07-21')),
    ('IJ9012KL5678MN', 37, DATEADD(DAY, 6, '2023-07-20')),
    ('OP7890QR7890ST', 38, DATEADD(DAY, 4, '2023-07-19')),
    ('OP7890QR7890ST', 39, DATEADD(DAY, 2, '2023-07-18')),
    ('OP7890QR7890ST', 40, DATEADD(DAY, 1, '2023-07-17'));

## Pagamento
INSERT INTO Pagamento(CodFattura, CodCarta)
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

## Dispositivo
INSERT INTO Dispositivo (Tipo, NomeLingua)
VALUES
    ('Tablet', 'Portuguese'),    -- 1
    ('Telefono', 'Korean'),      -- 2
    ('Laptop', 'English'),       -- 3
    ('Telefono', 'Russian'),     -- 4
    ('Tablet', 'Spanish'),       -- 5
    ('Laptop', 'Chinese'),       -- 6
    ('Telefono', 'Swiss'),       -- 7
    ('Tablet', 'Italian'),       -- 8
    ('Laptop', 'French'),        -- 9
    ('Telefono', 'Spanish');     -- 10
## Interfaccia
INSERT INTO Interfaccia(CodDispositivo, CodAlfanumerico)
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
## Hardware
INSERT INTO Hardware (Modello, TipoHardware)
VALUES
    ('SoundWave Pro', 'Scheda Audio'),
    ('SonicMaster X1', 'Scheda Audio'),
    ('AudioFidelity 2000', 'Scheda Audio'),
    ('HarmonySound DS', 'Scheda Audio'),
    ('CrystalClear Audio', 'Scheda Audio'),
    ('UltraVision GTX', 'Scheda Video'),
    ('VideoMaster 5000', 'Scheda Video'),
    ('VisualFX 2X', 'Scheda Video'),
    ('PixelPower Pro', 'Scheda Video'),
    ('GraphicForce RTX', 'Scheda Video');
## Composizione
INSERT INTO Composizione(CodDispositivo, Modello)
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
    
    ## Visione


INSERT INTO Visione (CodAlfanumerico, Identificatore, CodAudio, CodVideo, DataVisualizzazione)
VALUES
('MN3456OP7890QR', 6, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 10:15:45'),
('MN3456OP7890QR', 3, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 08:32:19'),
('MN3456OP7890QR', 1, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 15:42:56'),
('MN3456OP7890QR', 9, 'AUD45678901234567', 'VID78901234567890', '2023-09-16 14:00:27'),
('MN3456OP7890QR', 14, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 11:57:08'),
('ST9012UV3456WX', 17, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 09:21:34'),
('ST9012UV3456WX', 6, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 13:45:10'),
('ST9012UV3456WX', 16, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 10:59:01'),
('ST9012UV3456WX', 2, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:30:22'),
('ST9012UV3456WX', 10, 'AUD34567890123456', 'VID78901234567890', '2023-09-16 12:05:47'),
('YZ6789AB1234CD', 15, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 09:58:14'),
('YZ6789AB1234CD', 13, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 07:44:52'),
('YZ6789AB1234CD', 4, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 16:15:27'),
('YZ6789AB1234CD', 7, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 11:12:09'),
('YZ6789AB1234CD', 5, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 13:02:38'),
('EF2345GH9012IJ', 18, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 14:36:53'),
('EF2345GH9012IJ', 21, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 07:16:29'),
('EF2345GH9012IJ', 23, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 09:34:03'),
('EF2345GH9012IJ', 11, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 11:38:20'),
('EF2345GH9012IJ', 19, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 08:52:59'),
('KL5678MN3456OP', 22, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 07:05:17'),
('KL5678MN3456OP', 24, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 14:18:04'),
('KL5678MN3456OP', 20, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 12:47:56'),
('KL5678MN3456OP', 8, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 09:10:37'),
('KL5678MN3456OP', 12, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 15:26:12'),
('QR7890ST9012UV', 8, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 12:18:45'),
('QR7890ST9012UV', 7, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 08:09:18'),
('QR7890ST9012UV', 24, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 14:49:32'),
('QR7890ST9012UV', 20, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 10:56:22'),
('QR7890ST9012UV', 23, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 09:00:01'),
('WX1234YZ6789AB', 3, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 13:15:39'),
('WX1234YZ6789AB', 5, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 16:45:58'),
('WX1234YZ6789AB', 8, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 12:33:09'),
('WX1234YZ6789AB', 9, 'AUD45678901234567', 'VID78901234567890', '2023-09-16 14:27:44'),
('WX1234YZ6789AB', 12, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 11:26:35'),
('CD3456EF2345GH', 1, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 16:17:36'),
('CD3456EF2345GH', 15, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 09:22:44'),
('CD3456EF2345GH', 23, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 07:49:17'),
('CD3456EF2345GH', 21, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 14:34:50'),
('CD3456EF2345GH', 19, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 10:58:12'),
('KL5678MN3456OP', 24, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 07:31:38'),
('KL5678MN3456OP', 8, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 15:01:06'),
('KL5678MN3456OP', 12, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 12:17:19'),
('KL5678MN3456OP', 22, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 09:43:31'),
('KL5678MN3456OP', 20, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 07:27:57'),
('AB1234CD3456EF', 21, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 12:49:24'),
('AB1234CD3456EF', 19, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:12:45'),
('AB1234CD3456EF', 23, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 08:14:59'),
('AB1234CD3456EF', 11, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 14:23:13'),
('AB1234CD3456EF', 7, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 10:51:22');

## Download
INSERT INTO Download (CodAlfanumerico, Identificatore, DataDownload)
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
    
DROP TRIGGER InserisciVisione;