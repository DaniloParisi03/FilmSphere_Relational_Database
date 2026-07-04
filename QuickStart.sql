CREATE DATABASE filmsphere;
USE filmsphere;

CREATE TABLE film(
	Identificatore  INT AUTO_INCREMENT  PRIMARY KEY NOT NULL,		
	PaeseDiProduzione varchar(255) NOT NULL,
	AnnoDiUscita date NOT NULL,
	Durata decimal(3) NOT NULL,
	Gradimento decimal(2,1) DEFAULT 0 NOT NULL,
	NumeroRecensioni int DEFAULT 0 NULL
);

CREATE TABLE casts(
	CodFiscale char(17) NOT NULL,
	Settore varchar(16) NOT NULL,
	Nome varchar(50) NOT NULL,
	Cognome varchar(50) NOT NULL,
	PRIMARY KEY(CodFiscale, Settore) 
);

CREATE TABLE partecipazione(
	CodFiscale char(17) NOT NULL,
	Settore varchar(16) NOT NULL,
	Identificatore INT NOT NULL,
	PRIMARY KEY(Identificatore, CodFiscale, Settore),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (CodFiscale, Settore) REFERENCES casts(CodFiscale, Settore) ON DELETE CASCADE
);

CREATE TABLE PremioFilm(
	Nome varchar(50) NOT NULL, 
	Tipo varchar(50) NOT NULL,
	PRIMARY KEY(Nome, Tipo)
);

CREATE TABLE PremioCast(
	Nome varchar(50),
	Tipo varchar(50),
	PRIMARY KEY(Nome, Tipo)
);

CREATE TABLE PremiazioneCast(
	Nome varchar(50) NOT NULL,
	Tipo varchar(50) NOT NULL,
	AnnoVittoria date,
	CodFiscale char(17) NOT NULL,
	Settore varchar(16) NOT NULL,
	PRIMARY KEY(AnnoVittoria, Nome, Tipo),
	FOREIGN KEY (Nome, Tipo) REFERENCES PremioCast(Nome, Tipo) ON DELETE CASCADE,
	FOREIGN KEY (CodFiscale, Settore) REFERENCES casts(CodFiscale, Settore) ON DELETE CASCADE
);

CREATE TABLE PremiazioneFilm(
	Nome varchar(50) NOT NULL,
	Tipo varchar(50) NOT NULL,
	Identificatore INT NOT NULL,
	AnnoVittoria int,
	PRIMARY KEY(AnnoVittoria, Nome, Tipo),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (Nome, Tipo) REFERENCES PremioFilm(Nome, Tipo) ON DELETE CASCADE
);

CREATE TABLE Genere(
	NomeGenere varchar(15) PRIMARY KEY NOT NULL
); 

CREATE TABLE Appartenenza(
	NomeGenere varchar(15) NOT NULL,
	Identificatore INT NOT NULL,
	PRIMARY KEY(NomeGenere, Identificatore),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (NomeGenere) REFERENCES Genere(NomeGenere) ON DELETE CASCADE
); 

CREATE TABLE Lingua(
	NomeLingua varchar(15) PRIMARY KEY NOT NULL
);

CREATE TABLE DescrizioneFilm(
	Identificatore INT NOT NULL,
	NomeLingua varchar(15) NOT NULL,
	Titolo varchar(55) NOT NULL,
	Descrizione varchar(255) NOT NULL,
	PRIMARY KEY(Identificatore, NomeLingua),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (NomeLingua) REFERENCES Lingua(NomeLingua) ON DELETE CASCADE
);

CREATE TABLE Doppiaggio(
	NomeLingua varchar(15) NOT NULL,
	Identificatore INT NOT NULL,
	PRIMARY KEY(NomeLingua, Identificatore),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (NomeLingua) REFERENCES Lingua(NomeLingua) ON DELETE CASCADE
);

CREATE TABLE Sottotitolo(
	NomeLingua varchar(15) NOT NULL,
	Identificatore INT NOT NULL,
	PRIMARY KEY(NomeLingua, Identificatore),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (NomeLingua) REFERENCES Lingua(NomeLingua) ON DELETE CASCADE
);

CREATE TABLE Critico(
	IdCritico char(17) PRIMARY KEY NOT NULL,
	Nome varchar(50) NOT NULL,
	Cognome varchar(50) NOT NULL
);

CREATE TABLE Giudizio(
	IdCritico char(17) NOT NULL,
	Identificatore INT NOT NULL,
	DataRecensione date NOT NULL,
	Voto decimal(10,0) NOT NULL,
	PRIMARY KEY(IdCritico, Identificatore),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (IdCritico) REFERENCES Critico(IdCritico) ON DELETE CASCADE
);

CREATE TABLE Video(
	CodVideo char(17) PRIMARY KEY NOT NULL,
	Risoluzione varchar(50) NOT NULL,
	Bitrate int NOT NULL,
	rapporto varchar(10) NOT NULL
);

CREATE TABLE Audio(
	CodAudio char(17) PRIMARY KEY NOT NULL,
	Formato varchar(50) NOT NULL,
	IndiceQualita decimal(1,0) NOT NULL
);

CREATE TABLE Formato(
	Identificatore INT NOT NULL,
	CodAudio char(17) NOT NULL,
	CodVideo char(17) NOT NULL,
	DataDiRilascio date NOT NULL,
	Dimensione decimal(3,2) NOT NULL,
	PRIMARY KEY(Identificatore, CodAudio, CodVideo),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (CodAudio) REFERENCES Audio(CodAudio) ON DELETE CASCADE,
	FOREIGN KEY (CodVideo) REFERENCES Video(CodVideo) ON DELETE CASCADE
);

CREATE TABLE Stato(
	IpStato int(8) NOT NULL,
	NomeStato varchar(50) NOT NULL,
	PRIMARY KEY(IpStato)
);

CREATE TABLE RestrizioneVideo(
	CodVideo char(17) NOT NULL,
	IpStato int(8) NOT NULL,
	PRIMARY KEY(CodVideo, IpStato),
	FOREIGN KEY (CodVideo) REFERENCES Video(CodVideo) ON DELETE CASCADE,
	FOREIGN KEY (IpStato) REFERENCES Stato(IpStato) ON DELETE CASCADE
);

CREATE TABLE RestrizioneAudio(
	CodAudio char(17) NOT NULL,
	IpStato int(8) NOT NULL,
	FOREIGN KEY (CodAudio) REFERENCES Audio(CodAudio) ON DELETE CASCADE,
	FOREIGN KEY (IpStato) REFERENCES Stato(IpStato) ON DELETE CASCADE
);

CREATE TABLE Codec(
	NomeCodec varchar(50) NOT NULL,
	TipoCodec  varchar(6) NOT NULL,
	DataDistribuzione date NOT NULL,
	PRIMARY KEY (NomeCodec, DataDistribuzione, TipoCodec)
);

CREATE TABLE VersioneVideo(
	NomeCodec varchar(50) NOT NULL,
	DataDistribuzione date NOT NULL,
	CodVideo char(17) NOT NULL,
	PRIMARY KEY (NomeCodec, DataDistribuzione, CodVideo),
	FOREIGN KEY (CodVideo) REFERENCES Video(CodVideo) ON DELETE CASCADE,
	FOREIGN KEY (NomeCodec, DataDistribuzione) REFERENCES Codec(NomeCodec, DataDistribuzione) ON DELETE CASCADE
);

CREATE TABLE VersioneAudio(
	NomeCodec varchar(50) NOT NULL,
	DataDistribuzione date NOT NULL,
	CodAudio char(17) NOT NULL,
	PRIMARY KEY (NomeCodec, DataDistribuzione, CodAudio),
	FOREIGN KEY (NomeCodec, DataDistribuzione) REFERENCES Codec(NomeCodec, DataDistribuzione) ON DELETE CASCADE,
	FOREIGN KEY (CodAudio) REFERENCES Audio(CodAudio) ON DELETE CASCADE
);

CREATE TABLE Hardware(
	Modello varchar(50) PRIMARY KEY,
	TipoHardware varchar(50) NOT NULL
);

CREATE TABLE CodificaAudio(
	NomeCodec varchar(50) NOT NULL,
	DataDistribuzione date NOT NULL,
	Modello varchar(50) NOT NULL,
	PRIMARY KEY (NomeCodec, DataDistribuzione, Modello),
	FOREIGN KEY (NomeCodec, DataDistribuzione) REFERENCES Codec(NomeCodec, DataDistribuzione) ON DELETE CASCADE,
	FOREIGN KEY (Modello) REFERENCES Hardware(Modello) ON DELETE CASCADE
);

CREATE TABLE CodificaVideo(
	NomeCodec varchar(50) NOT NULL,
	DataDistribuzione date NOT NULL,
	Modello varchar(50) NOT NULL,
	PRIMARY KEY (NomeCodec, DataDistribuzione, Modello),
	FOREIGN KEY (NomeCodec, DataDistribuzione) REFERENCES Codec(NomeCodec, DataDistribuzione) ON DELETE CASCADE,
	FOREIGN KEY (Modello) REFERENCES Hardware(Modello) ON DELETE CASCADE
);

CREATE TABLE Profilo(
	CodAlfanumerico char(14) PRIMARY KEY,
	Nome varchar(50) NOT NULL,
	Cognome varchar(50) NOT NULL,
	Mail varchar(50) NOT NULL,
	Nickname varchar(50) NOT NULL,
	CodicePassword varchar(50) NOT NULL
);

CREATE TABLE Piani(
	NomePiano varchar(50) PRIMARY KEY NOT NULL,
	MaxOre int,
	MaxGiga int,
	Costo decimal(5,2) NOT NULL
);

CREATE TABLE Sottoscrizione(
	CodAlfanumerico char(14) NOT NULL,
	NomePiano varchar(50) NOT NULL,
	GigaDownload decimal(4,2) DEFAULT 0,
	OreView decimal(4,2) DEFAULT 0,
	PRIMARY KEY (CodAlfanumerico, NomePiano),
	FOREIGN KEY (CodAlfanumerico) REFERENCES Profilo(CodAlfanumerico) ON DELETE CASCADE,
	FOREIGN KEY (NomePiano) REFERENCES Piani(NomePiano) ON DELETE CASCADE
);

CREATE TABLE Funzionalita(
	Caratteristica varchar(100) PRIMARY KEY NOT NULL
);

CREATE TABLE Offerta(
	NomePiano varchar(50) NOT NULL,
	Caratteristica varchar(100) NOT NULL,
	PRIMARY KEY (NomePiano, Caratteristica),
	FOREIGN KEY (NomePiano) REFERENCES Piani(NomePiano) ON DELETE CASCADE,
	FOREIGN KEY (Caratteristica) REFERENCES Funzionalita(Caratteristica) ON DELETE CASCADE
);

CREATE TABLE Fattura(
	CodFattura INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	DataEmissione DATE NOT NULL,
	DataScadenza DATE NOT NULL,
	Abbonamento varchar(50),
	FOREIGN KEY (Abbonamento) REFERENCES Piani(NomePiano) 
);

CREATE TABLE Pagato(
	CodAlfanumerico char(14) NOT NULL,
	CodFattura int NOT NULL,
	DataPagamento Date ,
	PRIMARY KEY (CodAlfanumerico, CodFattura),
	FOREIGN KEY (CodAlfanumerico) REFERENCES Profilo(CodAlfanumerico) ON DELETE CASCADE,
	FOREIGN KEY (CodFattura) REFERENCES Fattura(CodFattura) ON DELETE CASCADE
);

CREATE TABLE DaPagare(
	CodAlfanumerico char(14) NOT NULL,
	CodFattura int NOT NULL,
	PRIMARY KEY (CodAlfanumerico, CodFattura),
	FOREIGN KEY (CodAlfanumerico) REFERENCES Profilo(CodAlfanumerico) ON DELETE CASCADE,
	FOREIGN KEY (CodFattura) REFERENCES Fattura(CodFattura) ON DELETE CASCADE
);

CREATE TABLE Carta(
	CodCarta varchar(50) PRIMARY KEY NOT NULL
);

CREATE TABLE Pagamento(
	CodFattura int NOT NULL,
	CodCarta varchar(50) NOT NULL,
	Primary key (CodFattura, CodCarta),
	FOREIGN KEY (CodFattura) REFERENCES Fattura(CodFattura) ON DELETE CASCADE,
	FOREIGN KEY (CodCarta) REFERENCES Carta(CodCarta) ON DELETE CASCADE
);

CREATE TABLE Visione(
	CodAlfanumerico char(14) NOT NULL,
	Identificatore INT NOT NULL,
	CodAudio char(17) NOT NULL,
	CodVideo char(17) NOT NULL,
	DataVisione Datetime NOT NULL,
	Primary key (CodAlfanumerico, Identificatore, CodAudio, CodVideo),
	FOREIGN KEY (CodAlfanumerico) REFERENCES Profilo(CodAlfanumerico),
	FOREIGN KEY (Identificatore,CodAudio,CodVideo) REFERENCES Formato(Identificatore,CodAudio,CodVideo),
	FOREIGN KEY (Identificatore) REFERENCES Film(Identificatore) ON DELETE CASCADE
);

CREATE TABLE Download(
	CodAlfanumerico char(14) NOT NULL,
	Identificatore int NOT NULL,
	DataDownload Datetime NOT NULL,
	Primary key (CodAlfanumerico, Identificatore),
	FOREIGN KEY (CodAlfanumerico) REFERENCES Profilo(CodAlfanumerico) ON DELETE CASCADE,
	FOREIGN KEY (Identificatore) REFERENCES Film(Identificatore) ON DELETE CASCADE
);

CREATE TABLE Recensione(
	CodAlfanumerico char(14) NOT NULL,
	Identificatore int NOT NULL,
	DataRecensione Date NOT NULL,
	Voto decimal(2,1), 
	Primary key (CodAlfanumerico, Identificatore),
	FOREIGN KEY (CodAlfanumerico) REFERENCES Profilo(CodAlfanumerico) ON DELETE CASCADE,
	FOREIGN KEY (Identificatore) REFERENCES Film(Identificatore) ON DELETE CASCADE
);

CREATE TABLE Dispositivo(
	CodDispositivo int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Tipo varchar(50) NOT NULL,
	NomeLingua varchar(50) NOT NULL,
	FOREIGN KEY (NomeLingua) REFERENCES Lingua(NomeLingua)
);

CREATE TABLE Interfaccia(
	CodDispositivo int NOT NULL,
	CodAlfanumerico char(14) NOT NULL,
	Primary key(CodDispositivo, CodAlfanumerico),
	FOREIGN KEY (CodDispositivo) REFERENCES Dispositivo(CodDispositivo) ON DELETE CASCADE,
	FOREIGN KEY (CodAlfanumerico) REFERENCES Profilo(CodAlfanumerico) ON DELETE CASCADE
);

CREATE TABLE Composizione(
	CodDispositivo int NOT NULL,
	Modello varchar(50) NOT NULL,
	Primary key (CodDispositivo, Modello),
	FOREIGN KEY (CodDispositivo) REFERENCES Dispositivo(CodDispositivo) ON DELETE CASCADE,
	FOREIGN KEY (Modello) REFERENCES Hardware(Modello) ON DELETE CASCADE
);
#popolata 
CREATE TABLE ServerStreaming(
	IpServer int PRIMARY KEY,
	LarghezzaBanda int NOT NULL,
	Capacita int NOT NULL,
	Capienza int NOT NULL,
	Carico int NOT NULL
);

CREATE TABLE StoricoConnessione(
	CodDispositivo int NOT NULL,
	IpServer int NOT NULL,
	IpDispositivo int NOT NULL,
	DataInizioConnessione Datetime NOT NULL,
	DataFineConnessione datetime,
	Primary Key (CodDispositivo, IpServer, IpDispositivo, DataInizioConnessione),
	FOREIGN KEY (CodDispositivo) REFERENCES Dispositivo(CodDispositivo) ON DELETE CASCADE,
	FOREIGN KEY (IpServer) REFERENCES ServerStreaming(IpServer) ON DELETE CASCADE
);
#popolata 

CREATE TABLE PointOfPresence(
	IpServer int NOT NULL,
	Identificatore int NOT NULL,
	Primary key (IpServer, Identificatore),
	FOREIGN KEY (IpServer) REFERENCES ServerStreaming(IpServer) ON DELETE CASCADE,
	FOREIGN KEY (Identificatore) REFERENCES Film(Identificatore) ON DELETE CASCADE
);

CREATE TABLE Indicizzazione(
	CodDispositivo int NOT NULL,
	IpServer int(16) NOT NULL,
	IpDispositivo int(16) NOT NULL,
	DataInizioConnessione Datetime NOT NULL,
	IpStato int(8),
	Primary Key (CodDispositivo, IpServer, IpDispositivo, DataInizioConnessione, IpStato),
	FOREIGN KEY (CodDispositivo, IpServer, IpDispositivo, DataInizioConnessione) REFERENCES StoricoConnessione(CodDispositivo, IpServer, IpDispositivo, DataInizioConnessione) ON DELETE CASCADE,
	FOREIGN KEY (IpStato) REFERENCES Stato(IpStato)
);

CREATE TABLE FilmConsigliati(
	CodAlfanumerico char(14) NOT NULL,
	Identificatore INT NOT NULL,
	primary key(CodAlfanumerico, Identificatore),
	FOREIGN KEY (Identificatore) REFERENCES film(Identificatore) ON DELETE CASCADE,
	FOREIGN KEY (CodAlfanumerico) REFERENCES Profilo(CodAlfanumerico) ON DELETE CASCADE
);

use filmsphere;

create table if not exists FilmConsigliati(
	CodAlfanumerico char(14) not null,
	Identificatore INT NOT NULL,
    primary key(CodAlfanumerico,Identificatore),
    foreign key (Identificatore) references film(Identificatore) ON DELETE CASCADE,
	foreign key (CodAlfanumerico) references Profilo(CodAlfanumerico) ON DELETE CASCADE
);

DELIMITER $$
CREATE PROCEDURE InserisciNeiConsigliati( in _IdUtente char(14), in _Identificatore int)
BEGIN
    insert into FilmConsigliati
    values(_IdUtente,_Identificatore);
END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE ConsigliaFilmGenere( in _IdUtente char(14))
BEGIN
	declare cond bool default false;
	declare codFilm int default null;

    DECLARE FilmGeneri CURSOR FOR (
		# ricerca film non visti dall'utente da consigliare
		with filmNonVisti as (
			select v.identificatore
			from visione 
			where  v.identificatore not in (select v1.identificatore from Visione v1 where v1.IdUtente = _IdUtente)
		),
	# scelta dei tre generi più visti da un utente
    GeneriPiùVistiUtente as (
			select g.nomeGenere
			from v.visione natural join Generi g
			where v.IdUtente = _IdUtente
			group by g.nomeGenere
			order by count(v.identificatore) desc
            limit 3

		)
		#selezione dei film non ancora visti da consigliare

		select fnv.Identificatore
		from filmNonVisti fnv inner join appartenenza a 
			on fnv.identificatore= a.identificatore
		where a.Nomegenere in (select tgv.nomeGenere from GeneriPiùVistiUtente tgv)  
    );
    declare continue handler for not found set cond = true;
    open FilmGeneri;
    fetch FilmGeneri into codFilm;
    while (not cond) do 
		call InserisciNeiConsigliati( _IdUtente , codFilm);
		fetch FilmGeneri into codFilm;

    end while;
	close FilmGeneri;

END $$
DELIMITER;

DELIMITER $$
CREATE PROCEDURE ConsigliaFilmRegista( in _IdUtente char(14))
BEGIN
	declare cond bool default false;
	declare codFilm int default null;

    DECLARE FilmRegista CURSOR FOR (
		# ricerca film non visti dall'utente da consigliare
		with filmNonVisti as (
			select v.identificatore
			from visione 
			where  v.identificatore not in (select v1.identificatore from Visione v1 where v1.IdUtente = _IdUtente)
		),
        #scelta dei registi i quali film hanno la media voti dell'utente da 4 in su
		 TreRegistiPreferiti as (
			select p1.CodFiscale
			from cast c1
				inner join partecipazione p1 on c1.CodFiscale = p1.CodFiscale 
                inner join Recensione r1 on r1.identificatore = p1.identificatore
			where    p1.CodAlfanumerico = _IdUtente 
				and  c1.Settore = 'regista' 
			group by p1.CodFiscale
            having avg(r1.voto) >= 4
			order by count(v.identificatore) desc
			
		)
        #selezione dei film non ancora visti
		select distinct f.identificatore
        from filmNonVisti f inner join partecipazione p 
				on f.Identificatore = p.Identificatore 
            inner join TreRegistiPreferiti tr 
				on p.CodFiscale = tr.CodFiscale
		limit 3			
        );

    declare continue handler for not found set cond = true;
    
    
    open FilmRegista;
    fetch FilmRegista into codFilm;
    
    while (not cond) do 
    
		call InserisciNeiConsigliati( _IdUtente , codFilm);
		fetch FilmRegista into codFilm;

    end while;
	close FilmRegista;

END $$
DELIMITER ;

use filmsphere;

DELIMITER $$
CREATE TRIGGER AggiornaNumeroRecensioni
AFTER INSERT ON Recensione
FOR EACH ROW
BEGIN
    UPDATE film
    SET
        film.NumeroRecensioni = film.NumeroRecensioni + 1,
        film.Gradimento = (film.Gradimento * (film.NumeroRecensioni - 1) + NEW.voto) / film.NumeroRecensioni
    WHERE film.Identificatore = NEW.Identificatore;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER ControlloDataRecensione
BEFORE INSERT ON Recensione
FOR EACH ROW
BEGIN 
    declare DataUscitaFilm DATE;
    set  DataUscitaFilm  = (SELECT AnnoDiUscita from film where Identificatore = New.Identificatore);
    if (new.DataRecensione < DataUscitaFilm ) then
        signal sqlstate '45000'
        set message_text = 'Data inserita non valida: non si possono recensire film non ancora usciti in sala' ;
    end if;
END$$
DELIMITER ;
-- Non serve, è già presente nella Procedure
/*
DROP TRIGGER IF EXISTS AggiuntaCaricoServer;
DELIMITER $$
CREATE TRIGGER AggiuntaCaricoServer
AFTER INSERT ON StoricoConnessione
FOR EACH ROW
BEGIN
	UPDATE ServerStreaming
	SET Carico = Carico + 1
	WHERE IpServer = NEW.IpServer;
END$$
DELIMITER ;
*/
DELIMITER $$
CREATE TRIGGER ControlloDataCritico
BEFORE INSERT ON Giudizio
FOR EACH ROW
BEGIN 
    declare DataUscitaFilm DATE;
    set  DataUscitaFilm  = (SELECT AnnoDiUscita from film where Identificatore = New.Identificatore);
    if (new.DataRecensione > DataUscitaFilm ) THEN SET New.DataRecensione = CURDATE();
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER AggiuntaIndicizzazione
AFTER INSERT ON StoricoConnessione
FOR EACH ROW
BEGIN 
	set @StatoDispositivo = (NEW.IpDispositivo - (NEW.IpDispositivo % 10000) );
    INSERT INTO Indicizzazione(CodDispositivo, IpServer, IpDispositivo, DataInizioConnessione, IpStato)
    VALUES (NEW.CodDispositivo, NEW.IpServer, NEW.IpDispositivo, NEw.DataInizioConnessione, @StatoDispositivo);
END $$
DELIMITER ;

use filmsphere;

-- Gestione Ridondanza Carico del Server
-- Connetti dispositivo
DELIMITER $$
CREATE PROCEDURE IniziaConnessione(IN _ipServer int, in _CodDispositivo int, in _IpDispositivo bigint, in _Data datetime)
BEGIN
	declare CapienzaServer int default 0;
	declare CaricoServer int default 0;
	(select ss.Capienza , ss.Carico from serverstreaming ss where ss.IpServer = _ipServer limit 1)into CapienzaServer,CaricoServer ;
	if CapienzaServer = CaricoServer then
		signal sqlstate '45000'
			set message_text = 'Capienza massima' ;
    end if;
    INSERT INTO storicoConnessione(CodDispositivo, IpServer, IpDispositivo, DataInizioConnessione, DataFineConnessione)
    VALUES (_CodDispositivo,_ipServer, _IpDispositivo, _Data, null);

    UPDATE ServerStreaming
    SET Carico = Carico + 1
    WHERE IpServer = _ipServer;
END $$
DELIMITER ;

-- Disconnetti dispositivo
DELIMITER $$
CREATE PROCEDURE TerminaConnessione(IN _ipServer int, in _CodDispositivo int, in _IpDispositivo bigint, in _Data datetime)
BEGIN

    update storicoConnessione sc
    set sc.DataFineConnessione = _Data
    where sc.DataFineConnessione is null and sc.IpServer = _ipServer and sc.CodDispositivo =_CodDispositivo and _IpDispositivo = sc.ipDispositivo;

    UPDATE ServerStreaming
    SET Carico = Carico - 1
    WHERE IpServer = _ipServer;
END $$
DELIMITER ;

# PROCEDURE DESCRITTE NELLA TAVOLA DEGLI ACCESSI

-- 1) Film più visto della giornata(1 volta al giorno) 
Delimiter $$
CREATE PROCEDURE FilmDelGiorno()
BEGIN 
    DECLARE idfilmDelGiorno int DEFAULT 0;
    DECLARE views int DEFAULT 0;

    SELECT f1.Identificatore, count(*) AS visualizzazioni INTO idfilmDelGiorno,views
    FROM film f1 NATURAL JOIN visione v
    WHERE DATE(v.DataVisione) = CURRENT_DATE()
    GROUP BY f1.Identificatore
    ORDER BY  visualizzazioni DESC, f1.AnnoDiUscita
    LIMIT 1;

    SELECT idfilmDelGiorno,views;

END $$
Delimiter ;

-- 2) Generi di film con media di voti superiore a 3 (Sia critici che utenti)
DELIMITER $$
CREATE PROCEDURE GeneriMediaOltreTre()
BEGIN 
    SELECT DISTINCT g.NomeGenere
    FROM genere g NATURAL JOIN appartenenza NATURAL JOIN (SELECT f.identificatore FROM film f WHERE f.Gradimento > 3) AS FilmMediaOltreTre
    ORDER BY g.NomeGenere;
END $$
DELIMITER ;

-- 3) Dato un dispositivo, trovare il server più vicini a esso con meno carico aventi il film richiesto
DELIMITER $$
CREATE PROCEDURE ServerDispositivo(IN  _CodDispositivo INT, IN _IpDispositivo BIGINT, IN _IdentificatoreFilm int, OUT _IpServer int)
BEGIN
	WITH
    SelezioneServer as (
		SELECT IpServer, ABS(_IpDispositivo - IpServer) as Distanza
		FROM PointOfPresence PP NATURAL JOIN ServerStreaming
		WHERE Identificatore = _IdentificatoreFilm
		ORDER BY Distanza
		LIMIT 1
    )
    Select IpServer into _IpServer
    FROM SelezioneServer;
END $$
DELIMITER ;

-- 4)  Trova giudizi
DELIMITER $$
CREATE PROCEDURE TrovaGiudizi(in _IdCritico char(17), in _date date)
BEGIN
    select Identificatore, Titolo, Voto 
    from critico natural join giudizio 
        natural join film 
        natural join DescrizioneFilm 
    where IdCritico = _IdCritico and DataRecensione > _date;
END $$
DELIMITER ;

-- 5) Creazione di un nuovo account con abbonamento (Fattura pagata)
DELIMITER $$
CREATE PROCEDURE CreazioneAccount(IN _codAlfanumerico char(14),IN _nome varchar(50), IN _cognome varchar(50),IN _mail varchar(50),
								  IN _nickname varchar(50), IN _password varchar(50), IN _Piano varchar(50), IN _codCarta varchar(50))
BEGIN
	INSERT INTO Profilo
    VALUES (_codAlfanumerico, _nome, _cognome, _mail, _nickname, _password);
    
    INSERT INTO Sottoscrizione
    VALUES (_codAlfanumerico, _Piano);
    
    INSERT INTO Carta
    VALUES (_codCarta);
    
    INSERT INTO Fattura(DataEmissione, DataScadenza, Abbonamento)
    VALUES (CURDATE(), DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH), _Piano);
    
    SET @numeroFattura = (SELECT MAX(CodFattura) FROM Fattura);
    
    INSERT INTO Pagato
    VALUES (_codAlfanumerico, @numeroFattura, CURDATE());
    
    INSERT INTO Pagamento
    VALUES(@numeroFattura, _codCarta);
END $$
DELIMITER ;
-- 6) Calcolo del carico del server
DELIMITER $$
CREATE PROCEDURE ControlloServer(IN _IpServer int, OUT _UtentiConnessi int, OUT _PercentualeCarico int)
BEGIN
	SELECT Carico, ((Carico/Capienza)*100) into _UtentiConnessi, _PercentualeCarico
    FROM ServerStreaming
    WHERE IpServer = _IpServer;
END $$
DELIMITER ;

-- 7)Calcolo di popolarità di un attore o regista
DELIMITER $$
CREATE PROCEDURE PopolaritaCast( in _codCast char(17), in _ruolo varchar(16) )
BEGIN 
	/*
    Popolarità di un attore/regista: Media ponderata tra la (media della) popolarità dei film a cui ha partecipato e il numero di premi indivuduali vinti da lui
    Peso popolarità film: 5
    Peso premi film: 4
    Peso premi individuali: 7
    */

	With 
    NumeroPremiFilm as (
		Select CodFiscale, count(*) as PremiFilm
        FROM Film NATURAL JOIN Partecipazione NATURAL JOIN Recensione NATURAL JOIN PremiazioneFilm 
        Where Settore = _ruolo
        Group by CodFiscale
    ),
    NumeroPremiPersonali as (
		SELECT CodFiscale, Count(*) as PremiPersonali
		FROM Casts natural join PremiazioneCast
		WHERE Settore = _ruolo
        Group by CodFiscale
    ),
    PopolaritaFilm as (
		SELECT CodFiscale, AVG(Gradimento) AS GradimentoFilm
		FROM Film NATURAL JOIN Partecipazione
		WHERE Settore = _ruolo
        Group by CodFiscale
    ),
    ClassificaGlobale as (
		Select *, (( (GradimentoFilm * 5) + (PremiFilm * 4) + (PremiPersonali * 7))/16) as GradimentoTot, RANK() OVER (ORDER BY GradimentoTot DESC) as Graduatoria
        From NumeroPremiFilm NATURAL JOIN NumeroPremiPersonali NATURAL JOIN PopolaritaFilm
    )
    SELECT Graduatoria
    FROM ClassificaGlobale
    Where CodFiscale = _codCast;
END $$
Delimiter ;

-- 8)Inserimento di una recensione
DELIMITER $$
CREATE PROCEDURE InserimentoRecensione(IN _IdentificatoreFilm INT, IN _CodiceUtente char(14), IN _VotoRecensione DECIMAL(2,1))
BEGIN
	-- Controlli
    SET @controlloFilm = (SELECT Count(*) FROM Film WHERE Identificatore = _IdentificatoreFilm);
    SET @controlloUtente = (SELECT Count(*) FROM Profilo WHERE CodAlfanumerico = _controlloUtente);
	
    IF (@controlloFilm <> 1 OR @controlloUtente <> 1 OR _VotoRecensione NOT BETWEEN 0 AND 10) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Errore! Parametri in ingresso non validi';
	END IF;
    
	INSERT INTO Recensione
    VALUES (_CodiceUtente, _IdentificatoreFilm, CURDATE(), _VotoRecensione);
END $$
DELIMITER ;

use filmsphere;

-- Caching
DROP PROCEDURE IF EXISTS GestioneCarico;
DELIMITER $$
CREATE PROCEDURE GestioneCarico(IN _ipServer INT, IN _capacitaServer INT, IN _caricoServer INT, out ServerTrovatoIp_ int, out CodUtente char(14))
BEGIN
	DECLARE cond BOOL DEFAULT FALSE;
	DECLARE IpArrivo INT DEFAULT 0;
    DECLARE CodDispositivo CHAR(14) DEFAULT '';
    DECLARE IpDispositivo INT DEFAULT 0;
    DECLARE DistanzaArrivo INT DEFAULT 0;
    DECLARE CaricoArrivo INT DEFAULT 0;
    DECLARE CapienzaArrivo INT DEFAULT 0;
    
    DECLARE Cursore CURSOR FOR(
    WITH
    -- Per ogni utente connesso al server, seleziona l'ultimo film visto
    UtenteUltimaVisione AS(
		SELECT I.CodAlfanumerico, CodDispositivo, ipDispositivo, (Select Identificatore FROM Visione V WHERE I.CodAlfanumerico = V.CodAlfanumerico ORDER BY DataVisione DESC LIMIT 1) as Identificatore
        FROM StoricoConnessione S natural join interfaccia I
        WHERE S.IpServer = _ipServer and DataFineConnessione IS NULL
    ),
    -- Seleziona Server che possiedono il film
    ServerDisponibili AS (
		SELECT *
        FROM PointOfPresence P natural join UtenteUltimaVisione 
        WHERE IpServer <> _ipServer
    )
    -- Seleziona i server più vicini per ogni utente, ordinando per la distanza
	SELECT  ss.IpServer, 
			CodDispositivo, 
            ipDipositivo,
            ABS( ((_ipServer - (_ipServer % 10000) )/ 10000) - ((_ipServer - (_ipServer % 10000) )/ 10000) ) as DistanzaServerArrivo,
			Carico as CaricoArrivo, 
			Capienza as CapienzaArrivo
	FROM ServerDisponibili NATURAL JOIN ServerStreaming 
	ORDER BY DistanzaServerArrivo
    );
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET cond = TRUE;
    
    OPEN Cursore;
    Scan: LOOP
		FETCH Cursore INTO IpArrivo, CodDispositivo, IpDispositivo, DistanzaArrivo, CaricoArrivo, CapienzaArrivo;
		IF (cond = TRUE) THEN LEAVE SCAN;
        END IF;
        IF ((CaricoArrivo/CapienzaArrivo) * 100 < 80) THEN
			CALL TerminaConnessione(_ipServer, CodDispositivo);
            CALL IniziaConnessione(IpArrivo, CodDispositivo, IpDispositivo);
        END IF;
	END LOOP;
    CLOSE Cursore;
END $$
DELIMITER ;

-- Procedure richiamata dall'event ControlloCaricoServer
DELIMITER $$
CREATE PROCEDURE ControlloCarico()
BEGIN
	declare Fine BOOL DEFAULT FALSE;
	declare ip int(16);
    declare capacitaServer int default 0;
    declare caricoServer int default 0;
	DECLARE CursoreServer CURSOR FOR(
		SELECT IpServer, capacita, carico
        FROM ServerStreaming
    );
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET Fine = TRUE;
    
    OPEN CursoreServer;
    loopLettura: LOOP
		FETCH CursoreServer INTO ip, capacitaServer, caricoServer;
        IF Fine then LEAVE loopLettura;
        END IF;
        -- 80 Soglia minima da cui iniziare ad operare
        IF (caricoServer/capacitaServer)*100 > 80 THEN CALL GestioneCarico(ip, capacitaServer, caricoServer);
        END IF;
    END LOOP;
    CLOSE CursoreServer;
END $$
DELIMITER ;

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

INSERT INTO Genere (NomeGenere)
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
   
INSERT INTO Audio (CodAudio, Formato, IndiceQualita)
VALUES
    ('AUD12345678901234', 'Dolby Digital', 5),
    ('AUD98765432109876', 'DTS-HD Master Audio', 4),
    ('AUD45678901234567', 'PCM', 5),
    ('AUD34567890123456', 'Dolby Atmos', 4),
    ('AUD56789012345678', 'AAC', 3),
    ('AUD78901234567890', 'FLAC', 5);


INSERT INTO Video (CodVideo, Risoluzione, Bitrate, Rapporto)
VALUES
    ('VID12345678901234', '1920x1080', 8000, '16:9'),
    ('VID98765432109876', '3840x2160', 12000, '16:9'),
    ('VID45678901234567', '1280x720', 4500, '16:9'),
    ('VID78901234567890', '3840x2160', 15000, '2.35:1'),
    ('VID12309876543210', '1920x1080', 5000, '4:3'),
    ('VID21098765432109', '1280x720', 3000, '4:3');

INSERT INTO Codec (NomeCodec, TipoCodec, DataDistribuzione)
VALUES
    ('AAC', 'Audio', '2020-01-15'),
    ('MP3', 'Audio', '2000-05-20'),
    ('Dolby Digital', 'Audio', '1992-03-10'),    
    ('DTS', 'Audio', '1993-12-05'),
    ('FLAC', 'Audio', '2001-08-30'),
    ('AC-3', 'Audio', '1992-05-12');
    
    
INSERT INTO Codec (NomeCodec, TipoCodec, DataDistribuzione)
VALUES
    ('H.264', 'Video', '2003-07-15'),
    ('VP9', 'Video', '2013-09-12'),
    ('H.265', 'Video', '2013-03-23'),
    ('MPEG-2', 'Video', '1995-11-30');


INSERT INTO Lingua (NomeLingua)
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

INSERT INTO Stato (IpStato, NomeStato)
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

INSERT INTO Piani(NomePiano, MaxOre, MaxGiga, Costo)
VALUES
	("Basic", 100, 100, 5.00),
	("Premium", 150, 150, 7.50),
	("Pro", 250, 250, 10.00),
    ("Deluxe", 300, 300, 15.00),
    ("Ultimate", NULL, NULL, 20);	-- NULL = Non ha limite

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
    
## Dispositivo
INSERT INTO Dispositivo (Tipo, NomeLingua)
VALUES
    ('Tablet', 'Portuguese'),    -- 1
    ('Telefono', 'Korean'),      -- 2
    ('Laptop', 'English'),       -- 3
    ('Telefono', 'Russian'),     -- 4
    ('Tablet', 'Spanish'),       -- 5
    ('Laptop', 'Chinese'),       -- 6
    ('Telefono', 'Swedish'),       -- 7
    ('Tablet', 'Italian'),       -- 8
    ('Laptop', 'French'),        -- 9
    ('Telefono', 'Spanish');     -- 10
    
## ServerStreaming
INSERT INTO ServerStreaming (IpServer, LarghezzaBanda, Capacita, Capienza, Carico)
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

use filmsphere;


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


/*
INSERT INTO PremiazioneCast (Nome, Tipo, AnnoVittoria, CodFiscale, Settore)
SELECT
    lp.Nome,
    lp.Tipo,
	FLOOR( DATE_ADD(AnnoMinFilm, INTERVAL (RAND() * (YEAR(AnnoMaxFilm) - Year(AnnoMinFilm) + 1)) YEAR))  AS AnnoVittoria,
    c.CodFiscale,
    c.Settore
FROM
    (SELECT DISTINCT Nome, Tipo FROM PremioCast WHERE RAND() < 0.65 and nome not like "%regia" ORDER BY RAND() LIMIT 5) AS lp cross join
    (SELECT c1.CodFiscale, c1.Settore,  max(f.AnnoDiUscita) AS AnnoMaxFilm, Min(f.AnnoDiUscita) AS AnnoMinFilm 
		from casts c1 natural join partecipazione p natural join film f
		WHERE RAND() < 0.75 and c1.settore = 'attore'
		group by c1.CodFiscale 
        order BY RAND() LIMIT 5) AS c;
 
*/
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
INSERT INTO RestrizioneVideo (CodVideo, IpStato)
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
    
INSERT INTO RestrizioneAudio (CodAudio, IpStato)
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


INSERT INTO Formato (Identificatore, CodAudio, CodVideo, DataDiRilascio, Dimensione)
VALUES
    (1, 'AUD12345678901234', 'VID12345678901234', '1959-01-01', 1.75), -- Esempio con dimensione in GB < 2
    (1, 'AUD45678901234567', 'VID45678901234567', '1959-01-01', 2.1),  -- Esempio con dimensione in GB > 2
    (1, 'AUD56789012345678', 'VID21098765432109', '1959-01-01', 0.601), -- Esempio con dimensione in megabit > 0.600
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

INSERT INTO VersioneVideo (NomeCodec, DataDistribuzione, CodVideo)
VALUES
    ('H.264', '2003-07-15', 'VID12345678901234'),
    ('VP9', '2013-09-12', 'VID98765432109876'),
    ('H.265', '2013-03-23', 'VID45678901234567'),
    ('MPEG-2', '1995-11-30', 'VID78901234567890'),
    ('H.264', '2003-07-15', 'VID12309876543210'),
    ('VP9', '2013-09-12', 'VID21098765432109'),
    ('H.265', '2013-03-23', 'VID12345678901234'),
    ('MPEG-2', '1995-11-30', 'VID98765432109876');

-- Inserimenti nella tabella VersioneAudio
INSERT INTO VersioneAudio (NomeCodec, DataDistribuzione, CodAudio)
VALUES
    ('AAC', '2020-01-15', 'AUD12345678901234'),
    ('MP3', '2000-05-20', 'AUD98765432109876'),
    ('Dolby Digital', '1992-03-10', 'AUD12345678901234'),
    ('DTS', '1993-12-05', 'AUD98765432109876'),
    ('FLAC', '2001-08-30', 'AUD78901234567890'),
    ('AC-3', '1992-05-12', 'AUD12345678901234');
    
    -- Inserimento dei dati nella tabella LinguaFilm
INSERT INTO Doppiaggio (Identificatore, NomeLingua)
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

    
  -- Inserimento delle lingue per ciascun film (4 lingue in coppia)
INSERT INTO Sottotitolo (Identificatore, NomeLingua)
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
  
INSERT INTO Giudizio (IdCritico, Identificatore, DataRecensione, Voto)
VALUES
	-- Recensioni per il film 'La Dolce Vita'

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
INSERT INTO Recensione (CodAlfanumerico, Identificatore, Voto, DataRecensione)
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

INSERT INTO Offerta (NomePiano, Caratteristica)
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
    
    
## Interfaccia
INSERT INTO Interfaccia(CodAlfanumerico,CodDispositivo)
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
    
    ## StoricoConnessione
INSERT INTO PointOfPresence (IpServer, Identificatore)
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

    SET ControlloStato = (
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

    IF (ControlloStato = 0) THEN
		SET ipDispositivo = ipDispositivo + (SELECT LPAD(FLOOR(RAND() * 10000), 4, '0'));
		
		CALL ServerDispositivo(idDispositivo, ipDispositivo, NEW.Identificatore, ipServer);
		CALL IniziaConnessione(ipServer, idDispositivo, ipDispositivo, NEW.DataVisione);
		SET DurataFilm = (SELECT Durata FROM Film WHERE Identificatore = NEW.Identificatore);
		CALL TerminaConnessione(ipServer, idDispositivo, ipDispositivo, DATE_ADD(NEW.DataVisione, INTERVAL DurataFilm MINUTE));
    ELSE
		DELETE FROM Visione
        WHERE CodAlfanumerico = NEW.CodAlfanumerico AND Identificatore = NEW.Identificatore AND DataVisione = NEW.DataVisione;
    END IF;
END $$
DELIMITER ;  

INSERT INTO Visione (CodAlfanumerico, Identificatore, CodAudio, CodVideo, DataVisione)
VALUES

('MN3456OP7890QR', 1, 'AUD12345678901234', 'VID12345678901234',  '2023-09-16 15:42:56'),
('ST9012UV3456WX', 1, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 15:42:56'),
('YZ6789AB1234CD', 1, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 15:42:56'),
('MN3456OP7890QR', 2, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 16:30:22'),
('ST9012UV3456WX', 2, 'AUD34567890123456', 'VID78901234567890', '2023-09-16 16:30:22'),
('YZ6789AB1234CD', 2, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 16:30:22'),
('MN3456OP7890QR', 3, 'AUD12345678901234', 'VID21098765432109', '2023-09-16 08:32:19'),
('ST9012UV3456WX', 3, 'AUD98765432109876', 'VID12309876543210', '2023-09-16 08:32:19'),
('YZ6789AB1234CD', 3, 'AUD45678901234567', 'VID78901234567890', '2023-09-16 08:32:19'),
('MN3456OP7890QR', 4, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 10:15:45'),
('ST9012UV3456WX', 4, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 10:15:45'),
('YZ6789AB1234CD', 4, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 10:15:45'),
('MN3456OP7890QR', 5, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 13:02:38'),
('ST9012UV3456WX', 5, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 13:02:38'),
('YZ6789AB1234CD', 5, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 13:02:38'),
('MN3456OP7890QR', 6, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 14:00:27'),
('ST9012UV3456WX', 6, 'AUD34567890123456', 'VID78901234567890', '2023-09-16 13:45:10'),
('YZ6789AB1234CD', 6, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 14:00:27'),
('MN3456OP7890QR', 7, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 11:12:09'),
('ST9012UV3456WX', 7, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 11:12:09'),
('YZ6789AB1234CD', 7, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 11:12:09'),
('ST9012UV3456WX', 8, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 13:45:10'),
('KL5678MN3456OP', 8, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 15:01:06'),
('QR7890ST9012UV', 8, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 12:18:45'),
('YZ6789AB1234CD', 8, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 15:01:06'),
('ST9012UV3456WX', 9, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 14:27:44'),
('MN3456OP7890QR', 9, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 14:00:27'),
('KL5678MN3456OP', 9, 'AUD45678901234567', 'VID78901234567890', '2023-09-16 14:27:44'),
('ST9012UV3456WX', 10, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 09:10:37'),
('KL5678MN3456OP', 10, 'AUD34567890123456', 'VID78901234567890', '2023-09-16 09:10:37'),
('YZ6789AB1234CD', 10, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 09:10:37'),
('ST9012UV3456WX', 11, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 11:38:20'),
('EF2345GH9012IJ', 11, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 14:36:53'),
('KL5678MN3456OP', 11, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 14:23:13'),
('KL5678MN3456OP', 12, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 12:17:19'),
('EF2345GH9012IJ', 12, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 12:17:19'),
('WX1234YZ6789AB', 12, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 11:26:35'),
('ST9012UV3456WX', 13, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 07:44:52'),
('KL5678MN3456OP', 13, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 08:24:03'),
('YZ6789AB1234CD', 13, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 07:44:52'),
('ST9012UV3456WX', 14, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 11:57:08'),
('KL5678MN3456OP', 14, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 15:09:45'),
('YZ6789AB1234CD', 14, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 11:57:08'),
('ST9012UV3456WX', 15, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 09:58:14'),
('CD3456EF2345GH', 15, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 09:22:44'),
('KL5678MN3456OP', 15, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 08:36:07'),
('YZ6789AB1234CD', 15, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 09:58:14'),
('EF2345GH9012IJ', 15, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 16:12:45'),
('ST9012UV3456WX', 16, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 09:21:34'),
('YZ6789AB1234CD', 16, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 09:21:34'),
('EF2345GH9012IJ', 16, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 15:15:41'),
('ST9012UV3456WX', 17, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 09:21:34'),
('KL5678MN3456OP', 17, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 08:49:50'),
('YZ6789AB1234CD', 17, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 10:12:22'),
('KL5678MN3456OP', 18, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 14:34:22'),
('EF2345GH9012IJ', 18, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 14:36:53'),
('WX1234YZ6789AB', 18, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 11:26:35'),
('KL5678MN3456OP', 19, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 07:49:17'),
('YZ6789AB1234CD', 19, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 10:58:12'),
('EF2345GH9012IJ', 19, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 08:52:59'),
('KL5678MN3456OP', 20, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 07:27:57'),
('QR7890ST9012UV', 20, 'AUD56789012345678', 'VID12309876543210', '2023-09-16 10:56:22'),
('YZ6789AB1234CD', 20, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 12:26:37'),
('KL5678MN3456OP', 21, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 12:44:04'),
('EF2345GH9012IJ', 21, 'AUD45678901234567', 'VID45678901234567', '2023-09-16 07:16:29'),
('QR7890ST9012UV', 21, 'AUD56789012345678', 'VID21098765432109', '2023-09-16 15:44:16'),
('YZ6789AB1234CD', 22, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 13:11:00'),
('KL5678MN3456OP', 22, 'AUD98765432109876', 'VID98765432109876', '2023-09-16 09:43:31'),
('WX1234YZ6789AB', 22, 'AUD34567890123456', 'VID45678901234567', '2023-09-16 07:05:17'),
('KL5678MN3456OP', 23, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 14:18:04'),
('YZ6789AB1234CD', 23, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 07:49:17'),
('EF2345GH9012IJ', 23, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 09:34:03'),
('WX1234YZ6789AB', 23, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 08:14:59'),
('EF2345GH9012IJ', 24, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 07:16:29'),
('KL5678MN3456OP', 24, 'AUD34567890123456', 'VID98765432109876', '2023-09-16 07:31:38'),
('QR7890ST9012UV', 24, 'AUD78901234567890', 'VID21098765432109', '2023-09-16 14:49:32'),
('KL5678MN3456OP', 25, 'AUD12345678901234', 'VID12345678901234', '2023-09-16 08:05:11'),
('QR7890ST9012UV', 25, 'AUD98765432109876', 'VID45678901234567', '2023-09-16 12:45:59'),
('WX1234YZ6789AB', 25, 'AUD34567890123456', 'VID12309876543210', '2023-09-16 10:53:20');

DROP TRIGGER InserisciVisione;

-- Classifica
/*
1- Film:
	- Più visti
    - In base ai formati o meno
    - Zona geografica
    - Abbonamento
*/
use filmsphere;

DROP PROCEDURE IF EXISTS ClassificaFilmGlobale;
DELIMITER $$
CREATE PROCEDURE ClassificaFilmGlobale()
BEGIN
	SELECT Identificatore, COUNT(*) as NumeroVisualizzazioni
    FROM Visione
    GROUP By Identificatore
    ORDER BY NumeroVisualizzazioni DESC
    LIMIT 1;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS FormatoFilmPiuVisto
DELIMITER $$
CREATE PROCEDURE FormatiFilmPiuVisto()
BEGIN
		WITH
        FilmPiuVisto AS (
			SELECT Identificatore, COUNT(*) as NumeroVisualizzazioni
			FROM Visione
			GROUP By Identificatore
			ORDER BY NumeroVisualizzazioni DESC
			LIMIT 1
        )
        SELECT CodAudio, CodVideo, Count(*) as NumeroVisualizzazioniFormato, RANK() OVER (ORDER BY Count(*) DESC) as Popolarita
        FROM FilmPiuVisto natural join Visione
        GROUP BY CodAudio, CodVideo
        Order by Popolarita;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS FilmPiuFamosoPerStato;
DELIMITER $$
CREATE PROCEDURE FilmPiuFamosoPerStato()
BEGIN
	With
	InformazioniFilm as (
	SELECT *, ((IpDispositivo - (IpDispositivo % 10000) )/ 10000) as IpStatoConnesso
    FROM Visione V NATURAL JOIN Profilo P
		 NATURAL JOIN Dispositivo D 
         Natural join StoricoConnessione S 
		 WHERE ((V.DataVisione BETWEEN S.DataInizioConnessione AND S.DataFineConnessione) OR (S.DataFineConnessione IS NULL AND V.DataVisione > S.DataInizioConnessione))
	),
    Classifica as (
		SELECT S.NomeStato, F.Identificatore, RANK() OVER (Partition by `S.NomeStato` ORDER BY Count(F.Identificatore) DESC) as PopolaritaFilm
		From InformazioniFilm F inner join Stato S on S.IpStato = F.IpStatoConnesso
    )
    Select NomeStato, Identificatore
    From Classifica 
    Where PopolaritaFilm = 1;
    
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS FilmPiuVistoPerAbbonamento
DELIMITER $$
CREATE PROCEDURE FilmPiuVistoPerAbbonamento()
BEGIN
	WITH 
    UnioneAbbonamenti as (
		Select *
        From Profilo Natural join Pagato Natural Join Fattura
    UNION
		Select *
        From Profilo Natural join DaPagare Natural Join Fattura
    )
    Select Identificatore, RANK() OVER (Partition by `Identificatore` ORDER BY Count(*) DESC) as PostoClassifica
    From Visione V natural join UnioneAbbonamenti 
    Where DataVisione BETWEEN DataEmissione AND DataScadenza 
    Group by Abbonamento;
END $$
DELIMITER ;

Delimiter $$
CREATE PROCEDURE ControlloBilanciamento(IN _ServerCodIp INT, IN _CaricoServer INT,IN _IdFilm INT)
BEGIN 
	
	DECLARE mediaCarico INT DEFAULT -1;
    
     #Scelta server con più vicini con minor carico nei quali mettere il film 
	DECLARE NewServerCodIp int default -1;

	#selezione dei server più leggeri senza il film ricercato in catalogo, così da portelo aggiungere 
	SET NewServerCodIp =
		 (
         WITH ServerLeggeri as (
		 SELECT IpServer,carico FROM ServerStreaming WHERE carico < mediaCarico)   
         
		 Select Distinct sl.IpServer, ABS(_ServerCodIp - sl.IpServer) as DistanzaServer
		 from ServerLeggeri sl natural join pointOfPreseance pp
         # si ordina in base alla somma distanza e carico
         WHERE pp.Identificatore <> _IdFilm
		 ORDER BY (DistanzaServer / carico)
		 Limit 1
         );
     
    SET mediaCarico = (
		SELECT AVG(Carico)
		FROM ServerStreaming
        );
    
    #selezione dell'ultima visione del film da trasferire
    WITH UltimaVisionePerUtente as (
		SELECT v.CodAlfanumerico, MAX(DataVisione) as DataRecente
		FROM Visione v
        WHERE v.Indentificatore = _IdFilm
		GROUP BY v.CodAlfanumerico
    )
    
    SELECT null
	FROM (SELECT Cd.CodDispositivo
		FROM StoricoConnessione sc NATURAL JOIN Dispostivo d NATURAL JOIN interfaccia i NATURAL JOIN UltimaVisionePerUtente uv
		WHERE IpServer = _ServerCodIp and DataFineConnessione is Null) AS DispositiviInStreaming;
    
    
	#apro le vecchie connessioni in corso col server nuovo

	INSERT INTO StoricoConnessione (CodDispositivo, IpServer, IpDispositivo, DataInizioConnessione)
    SELECT sc.CodDispositivo, NewServerCodIp , sc.IpDispositivo, now()
    FROM StoricoConnessione sc
    WHERE sc.IpServer = _ServerCodIp and sc.DataFineConnessione is Null and sc.CodDispositivo in (DispositiviInStreaming);
    
    #chiudo le vecchie connessioni in corso con server iniziale
    UPDATE StoricoConnessione 
    SET DataFineConnessione = now()
    WHERE IpServer = _ServerCodIp and DataFineConnessione is Null and CodDispositivo in (DispositiviInStreaming) ;
    
    
    #aggiornamento carico
    UPDATE ServerStreaming 
    SET Carico = carico - count(DispositiviInStreaming)
    WHERE IpServer = _ServerCodIp;
    
    UPDATE ServerStreaming 
    SET Carico = carico + count(DispositiviInStreaming)
    WHERE IpServer = NewServerCodIp;
    
    #aggiornamento catalogo
    UPDATE PointOfPresence
    SET IpServer = NewServerCodIp
    WHERE IpServer = _ServerCodIp and  Identificatore = _IdFilm;

END $$
DELIMITER ;

Delimiter $$
CREATE PROCEDURE BilanciamentoCarico()
BEGIN 

	DECLARE FINE BOOL DEFAULT FALSE;
    DECLARE ServerCodIp int default -1;
	DECLARE CaricoServer int default -1;
	DECLARE idFilmRichiesto int DEFAULT -1;
	DECLARE mediaCarico INT DEFAULT -1;

	
	#controllo film più richiesti che potenzialmente aumetano il carico di un server già carico
    DECLARE cursoreServerFilmRichiesti CURSOR FOR (
    #selezione i server ospitanti i film con la media delle visioni più alta
		WITH CDNfilmRichiesti as(
			SELECT  v.Indentificatore, count(*) as richiesteVisione FROM visione v GROUP BY v.Indentificatore
            ),
        FilmAltaRichiesta as (    
			SELECT Indentificatore
			FROM NumeroRichiesteVisioneFilm 
			WHERE richiesteVisione > ( SELECT AVG(richiesteVisione) FROM NumeroRichiesteVisioneFilm)
            )
         SELECT distinct ss.IpServer, ss.Carico, fr.Indentificatore
         FROM serverStreaming s natural join PoinOfPrecence pop natural join FilmAltaRichiesta fr
        );
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fine = true;
    
    
    SET mediaCarico = (
		SELECT AVG(Carico)
		FROM ServerStreaming
        );
        
        
    OPEN cursoreServerFilmRichiesti;
    FETCH cursoreServerFilmRichiesti INTO ServerCodIp,CaricoServer,idFilmRichiesto;
    WHILE (NOT fine) DO
        #solo se il server è abbastanza carico
		IF CaricoServer >  mediaCarico THEN
			CALL ControlloBilanciamento(ServerCodIp,CaricoServer,idFilmRichiesto);
		END IF;
		FETCH cursoreServerFilmRichiesti INTO ServerCodIp,CaricoServer,idFilmRichiesto;

    END WHILE;
    CLOSE cursoreServerFilmRichiesti;
    

END $$
DELIMITER ;

use filmsphere;
SET GLOBAL event_scheduler = ON;

DELIMITER $$
CREATE EVENT ControlloCaricoServer
ON SCHEDULE EVERY 3 MINUTE
DO 
	CALL ControlloCarico()
DELIMITER ;

CREATE EVENT ON SCHEDULE CalcolaFilmUtente
DELIMITER $$
CREATE EVENT CalcolaFilmUtente
ON SCHEDULE EVERY 1 day
DO 
	declare cond bool default false;
	declare codUtente char(14)  default ' ';

	declare cursor Utenti for (select p.IdUtente FROM profilo p)
    declare continue handler for not found set cond = true;
	open Utenti;
    fetch utenti into codUtente;
    fetch utenti into codUtente;
    while (not cond) do
		call ConsigliaFilmGenere(codUtente)
		fetch utenti into codUtente;
    end while;
	close utenti;
DELIMITER ;