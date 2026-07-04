CREATE DATABASE filmsphere;
USE filmsphere;

-- ============================================================
-- Area 1: Film, Cast & Awards
-- ============================================================

CREATE TABLE Film(
    FilmId               INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    CountryOfProduction  VARCHAR(255) NOT NULL,
    ReleaseYear          DATE NOT NULL,
    Duration             DECIMAL(3) NOT NULL,
    Rating               DECIMAL(2,1) DEFAULT 0 NOT NULL,
    ReviewCount          INT DEFAULT 0 NOT NULL
);

CREATE TABLE CastMember(
    FiscalCode  CHAR(17)    NOT NULL,
    Role        VARCHAR(16) NOT NULL,
    Name        VARCHAR(50) NOT NULL,
    Surname     VARCHAR(50) NOT NULL,
    PRIMARY KEY(FiscalCode, Role)
);

CREATE TABLE Participation(
    FiscalCode  CHAR(17) NOT NULL,
    Role        VARCHAR(16) NOT NULL,
    FilmId      INT NOT NULL,
    PRIMARY KEY(FilmId, FiscalCode, Role),
    FOREIGN KEY (FilmId)            REFERENCES Film(FilmId)                       ON DELETE CASCADE,
    FOREIGN KEY (FiscalCode, Role)  REFERENCES CastMember(FiscalCode, Role)       ON DELETE CASCADE
);

CREATE TABLE FilmAward(
    Name  VARCHAR(50) NOT NULL,
    Type  VARCHAR(50) NOT NULL,
    PRIMARY KEY(Name, Type)
);

CREATE TABLE CastAward(
    Name  VARCHAR(50),
    Type  VARCHAR(50),
    PRIMARY KEY(Name, Type)
);

CREATE TABLE CastAwarding(
    Name        VARCHAR(50) NOT NULL,
    Type        VARCHAR(50) NOT NULL,
    WinYear     DATE,
    FiscalCode  CHAR(17)    NOT NULL,
    Role        VARCHAR(16) NOT NULL,
    PRIMARY KEY(WinYear, Name, Type),
    FOREIGN KEY (Name, Type)        REFERENCES CastAward(Name, Type)             ON DELETE CASCADE,
    FOREIGN KEY (FiscalCode, Role)  REFERENCES CastMember(FiscalCode, Role)      ON DELETE CASCADE
);

CREATE TABLE FilmAwarding(
    Name    VARCHAR(50) NOT NULL,
    Type    VARCHAR(50) NOT NULL,
    FilmId  INT NOT NULL,
    WinYear INT,
    PRIMARY KEY(WinYear, Name, Type),
    FOREIGN KEY (FilmId)     REFERENCES Film(FilmId)               ON DELETE CASCADE,
    FOREIGN KEY (Name, Type) REFERENCES FilmAward(Name, Type)      ON DELETE CASCADE
);

CREATE TABLE Genre(
    GenreName VARCHAR(15) PRIMARY KEY NOT NULL
);

CREATE TABLE Membership(
    GenreName  VARCHAR(15) NOT NULL,
    FilmId     INT NOT NULL,
    PRIMARY KEY(GenreName, FilmId),
    FOREIGN KEY (FilmId)     REFERENCES Film(FilmId)          ON DELETE CASCADE,
    FOREIGN KEY (GenreName)  REFERENCES Genre(GenreName)      ON DELETE CASCADE
);

CREATE TABLE Language(
    LanguageName VARCHAR(15) PRIMARY KEY NOT NULL
);

CREATE TABLE FilmDescription(
    FilmId        INT NOT NULL,
    LanguageName  VARCHAR(15) NOT NULL,
    Title         VARCHAR(55) NOT NULL,
    Description   VARCHAR(255) NOT NULL,
    PRIMARY KEY(FilmId, LanguageName),
    FOREIGN KEY (FilmId)        REFERENCES Film(FilmId)                ON DELETE CASCADE,
    FOREIGN KEY (LanguageName)  REFERENCES Language(LanguageName)      ON DELETE CASCADE
);

CREATE TABLE Dubbing(
    LanguageName  VARCHAR(15) NOT NULL,
    FilmId        INT NOT NULL,
    PRIMARY KEY(LanguageName, FilmId),
    FOREIGN KEY (FilmId)        REFERENCES Film(FilmId)                ON DELETE CASCADE,
    FOREIGN KEY (LanguageName)  REFERENCES Language(LanguageName)      ON DELETE CASCADE
);

CREATE TABLE Subtitle(
    LanguageName  VARCHAR(15) NOT NULL,
    FilmId        INT NOT NULL,
    PRIMARY KEY(LanguageName, FilmId),
    FOREIGN KEY (FilmId)        REFERENCES Film(FilmId)                ON DELETE CASCADE,
    FOREIGN KEY (LanguageName)  REFERENCES Language(LanguageName)      ON DELETE CASCADE
);

CREATE TABLE Critic(
    CriticId  CHAR(17)    PRIMARY KEY NOT NULL,
    Name      VARCHAR(50) NOT NULL,
    Surname   VARCHAR(50) NOT NULL
);

CREATE TABLE CriticReview(
    CriticId    CHAR(17) NOT NULL,
    FilmId      INT NOT NULL,
    ReviewDate  DATE NOT NULL,
    Score       DECIMAL(10,0) NOT NULL,
    PRIMARY KEY(CriticId, FilmId),
    FOREIGN KEY (FilmId)    REFERENCES Film(FilmId)          ON DELETE CASCADE,
    FOREIGN KEY (CriticId)  REFERENCES Critic(CriticId)      ON DELETE CASCADE
);

-- ============================================================
-- Area 2: Formats, States & Restrictions
-- ============================================================

CREATE TABLE VideoFormat(
    VideoCode   CHAR(17)    PRIMARY KEY NOT NULL,
    Resolution  VARCHAR(50) NOT NULL,
    Bitrate     INT NOT NULL,
    AspectRatio VARCHAR(10) NOT NULL
);

CREATE TABLE AudioFormat(
    AudioCode    CHAR(17)    PRIMARY KEY NOT NULL,
    FormatName   VARCHAR(50) NOT NULL,
    QualityIndex DECIMAL(1,0) NOT NULL
);

CREATE TABLE Format(
    FilmId       INT NOT NULL,
    AudioCode    CHAR(17) NOT NULL,
    VideoCode    CHAR(17) NOT NULL,
    ReleaseDate  DATE NOT NULL,
    FileSize     DECIMAL(3,2) NOT NULL,
    PRIMARY KEY(FilmId, AudioCode, VideoCode),
    FOREIGN KEY (FilmId)     REFERENCES Film(FilmId)                ON DELETE CASCADE,
    FOREIGN KEY (AudioCode)  REFERENCES AudioFormat(AudioCode)      ON DELETE CASCADE,
    FOREIGN KEY (VideoCode)  REFERENCES VideoFormat(VideoCode)      ON DELETE CASCADE
);

CREATE TABLE GeoState(
    StateIP    INT(8)      NOT NULL,
    StateName  VARCHAR(50) NOT NULL,
    PRIMARY KEY(StateIP)
);

CREATE TABLE VideoRestriction(
    VideoCode  CHAR(17) NOT NULL,
    StateIP    INT(8)   NOT NULL,
    PRIMARY KEY(VideoCode, StateIP),
    FOREIGN KEY (VideoCode)  REFERENCES VideoFormat(VideoCode)  ON DELETE CASCADE,
    FOREIGN KEY (StateIP)    REFERENCES GeoState(StateIP)       ON DELETE CASCADE
);

CREATE TABLE AudioRestriction(
    AudioCode  CHAR(17) NOT NULL,
    StateIP    INT(8)   NOT NULL,
    PRIMARY KEY(AudioCode, StateIP),
    FOREIGN KEY (AudioCode)  REFERENCES AudioFormat(AudioCode)  ON DELETE CASCADE,
    FOREIGN KEY (StateIP)    REFERENCES GeoState(StateIP)       ON DELETE CASCADE
);

CREATE TABLE Codec(
    CodecName         VARCHAR(50) NOT NULL,
    CodecType         VARCHAR(6)  NOT NULL,
    DistributionDate  DATE NOT NULL,
    PRIMARY KEY (CodecName, DistributionDate, CodecType)
);

CREATE TABLE VideoVersion(
    CodecName         VARCHAR(50) NOT NULL,
    DistributionDate  DATE NOT NULL,
    VideoCode         CHAR(17) NOT NULL,
    PRIMARY KEY (CodecName, DistributionDate, VideoCode),
    FOREIGN KEY (VideoCode)                     REFERENCES VideoFormat(VideoCode)        ON DELETE CASCADE,
    FOREIGN KEY (CodecName, DistributionDate)   REFERENCES Codec(CodecName, DistributionDate) ON DELETE CASCADE
);

CREATE TABLE AudioVersion(
    CodecName         VARCHAR(50) NOT NULL,
    DistributionDate  DATE NOT NULL,
    AudioCode         CHAR(17) NOT NULL,
    PRIMARY KEY (CodecName, DistributionDate, AudioCode),
    FOREIGN KEY (CodecName, DistributionDate)  REFERENCES Codec(CodecName, DistributionDate)  ON DELETE CASCADE,
    FOREIGN KEY (AudioCode)                    REFERENCES AudioFormat(AudioCode)              ON DELETE CASCADE
);

CREATE TABLE Hardware(
    Model         VARCHAR(50) PRIMARY KEY,
    HardwareType  VARCHAR(50) NOT NULL
);

CREATE TABLE AudioEncoding(
    CodecName         VARCHAR(50) NOT NULL,
    DistributionDate  DATE NOT NULL,
    Model             VARCHAR(50) NOT NULL,
    PRIMARY KEY (CodecName, DistributionDate, Model),
    FOREIGN KEY (CodecName, DistributionDate)  REFERENCES Codec(CodecName, DistributionDate)  ON DELETE CASCADE,
    FOREIGN KEY (Model)                        REFERENCES Hardware(Model)                     ON DELETE CASCADE
);

CREATE TABLE VideoEncoding(
    CodecName         VARCHAR(50) NOT NULL,
    DistributionDate  DATE NOT NULL,
    Model             VARCHAR(50) NOT NULL,
    PRIMARY KEY (CodecName, DistributionDate, Model),
    FOREIGN KEY (CodecName, DistributionDate)  REFERENCES Codec(CodecName, DistributionDate)  ON DELETE CASCADE,
    FOREIGN KEY (Model)                        REFERENCES Hardware(Model)                     ON DELETE CASCADE
);

-- ============================================================
-- Area 3: Users, Devices & Plans
-- ============================================================

CREATE TABLE Profile(
    ProfileCode   CHAR(14)    PRIMARY KEY,
    Name          VARCHAR(50) NOT NULL,
    Surname       VARCHAR(50) NOT NULL,
    Email         VARCHAR(50) NOT NULL,
    Nickname      VARCHAR(50) NOT NULL,
    PasswordHash  VARCHAR(50) NOT NULL
);

CREATE TABLE Plan(
    PlanName  VARCHAR(50) PRIMARY KEY NOT NULL,
    MaxHours  INT,
    MaxGB     INT,
    Cost      DECIMAL(5,2) NOT NULL
);

CREATE TABLE Subscription(
    ProfileCode  CHAR(14)    NOT NULL,
    PlanName     VARCHAR(50) NOT NULL,
    PRIMARY KEY (ProfileCode, PlanName),
    FOREIGN KEY (ProfileCode)  REFERENCES Profile(ProfileCode)  ON DELETE CASCADE,
    FOREIGN KEY (PlanName)     REFERENCES Plan(PlanName)        ON DELETE CASCADE
);

CREATE TABLE Feature(
    FeatureName VARCHAR(100) PRIMARY KEY NOT NULL
);

CREATE TABLE Offering(
    PlanName     VARCHAR(50)  NOT NULL,
    FeatureName  VARCHAR(100) NOT NULL,
    PRIMARY KEY (PlanName, FeatureName),
    FOREIGN KEY (PlanName)    REFERENCES Plan(PlanName)        ON DELETE CASCADE,
    FOREIGN KEY (FeatureName) REFERENCES Feature(FeatureName)  ON DELETE CASCADE
);

CREATE TABLE Invoice(
    InvoiceId   INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    IssueDate   DATE        NOT NULL,
    ExpiryDate  DATE        NOT NULL,
    PlanName    VARCHAR(50),
    FOREIGN KEY (PlanName) REFERENCES Plan(PlanName)
);

CREATE TABLE Paid(
    ProfileCode  CHAR(14) NOT NULL,
    InvoiceId    INT      NOT NULL,
    PaymentDate  DATE,
    PRIMARY KEY (ProfileCode, InvoiceId),
    FOREIGN KEY (ProfileCode)  REFERENCES Profile(ProfileCode)  ON DELETE CASCADE,
    FOREIGN KEY (InvoiceId)    REFERENCES Invoice(InvoiceId)    ON DELETE CASCADE
);

CREATE TABLE ToPay(
    ProfileCode  CHAR(14) NOT NULL,
    InvoiceId    INT      NOT NULL,
    PRIMARY KEY (ProfileCode, InvoiceId),
    FOREIGN KEY (ProfileCode)  REFERENCES Profile(ProfileCode)  ON DELETE CASCADE,
    FOREIGN KEY (InvoiceId)    REFERENCES Invoice(InvoiceId)    ON DELETE CASCADE
);

CREATE TABLE Card(
    CardCode VARCHAR(50) PRIMARY KEY NOT NULL
);

CREATE TABLE Payment(
    InvoiceId  INT         NOT NULL,
    CardCode   VARCHAR(50) NOT NULL,
    PRIMARY KEY (InvoiceId, CardCode),
    FOREIGN KEY (InvoiceId)  REFERENCES Invoice(InvoiceId)  ON DELETE CASCADE,
    FOREIGN KEY (CardCode)   REFERENCES Card(CardCode)      ON DELETE CASCADE
);

CREATE TABLE Viewing(
    ProfileCode  CHAR(14)  NOT NULL,
    FilmId       INT       NOT NULL,
    AudioCode    CHAR(17)  NOT NULL,
    VideoCode    CHAR(17)  NOT NULL,
    ViewDate     DATETIME  NOT NULL,
    PRIMARY KEY (ProfileCode, FilmId, AudioCode, VideoCode, ViewDate),
    FOREIGN KEY (ProfileCode)              REFERENCES Profile(ProfileCode),
    FOREIGN KEY (FilmId, AudioCode, VideoCode) REFERENCES Format(FilmId, AudioCode, VideoCode),
    FOREIGN KEY (FilmId)                   REFERENCES Film(FilmId) ON DELETE CASCADE
);

CREATE TABLE Download(
    ProfileCode   CHAR(14)  NOT NULL,
    FilmId        INT       NOT NULL,
    DownloadDate  DATETIME  NOT NULL,
    PRIMARY KEY (ProfileCode, FilmId),
    FOREIGN KEY (ProfileCode)  REFERENCES Profile(ProfileCode)  ON DELETE CASCADE,
    FOREIGN KEY (FilmId)       REFERENCES Film(FilmId)          ON DELETE CASCADE
);

CREATE TABLE UserReview(
    ProfileCode  CHAR(14)     NOT NULL,
    FilmId       INT          NOT NULL,
    ReviewDate   DATE         NOT NULL,
    Score        DECIMAL(2,1),
    PRIMARY KEY (ProfileCode, FilmId),
    FOREIGN KEY (ProfileCode)  REFERENCES Profile(ProfileCode)  ON DELETE CASCADE,
    FOREIGN KEY (FilmId)       REFERENCES Film(FilmId)          ON DELETE CASCADE
);

CREATE TABLE Device(
    DeviceId      INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    DeviceType    VARCHAR(50) NOT NULL,
    LanguageName  VARCHAR(50) NOT NULL,
    FOREIGN KEY (LanguageName) REFERENCES Language(LanguageName)
);

CREATE TABLE Interface(
    DeviceId     INT     NOT NULL,
    ProfileCode  CHAR(14) NOT NULL,
    PRIMARY KEY(DeviceId, ProfileCode),
    FOREIGN KEY (DeviceId)     REFERENCES Device(DeviceId)     ON DELETE CASCADE,
    FOREIGN KEY (ProfileCode)  REFERENCES Profile(ProfileCode) ON DELETE CASCADE
);

CREATE TABLE Composition(
    DeviceId  INT         NOT NULL,
    Model     VARCHAR(50) NOT NULL,
    PRIMARY KEY (DeviceId, Model),
    FOREIGN KEY (DeviceId)  REFERENCES Device(DeviceId)    ON DELETE CASCADE,
    FOREIGN KEY (Model)     REFERENCES Hardware(Model)     ON DELETE CASCADE
);

-- ============================================================
-- Area 4: Servers & Streaming
-- ============================================================

CREATE TABLE StreamingServer(
    ServerIP     INT PRIMARY KEY,
    Bandwidth    INT NOT NULL,
    MaxCapacity  INT NOT NULL,
    MaxUsers     INT NOT NULL,
    CurrentLoad  INT NOT NULL
);

CREATE TABLE ConnectionHistory(
    DeviceId         INT      NOT NULL,
    ServerIP         INT      NOT NULL,
    DeviceIP         INT      NOT NULL,
    ConnectionStart  DATETIME NOT NULL,
    ConnectionEnd    DATETIME,
    PRIMARY KEY (DeviceId, ServerIP, DeviceIP, ConnectionStart),
    FOREIGN KEY (DeviceId)   REFERENCES Device(DeviceId)             ON DELETE CASCADE,
    FOREIGN KEY (ServerIP)   REFERENCES StreamingServer(ServerIP)    ON DELETE CASCADE
);

CREATE TABLE PointOfPresence(
    ServerIP  INT NOT NULL,
    FilmId    INT NOT NULL,
    PRIMARY KEY (ServerIP, FilmId),
    FOREIGN KEY (ServerIP)  REFERENCES StreamingServer(ServerIP)  ON DELETE CASCADE,
    FOREIGN KEY (FilmId)    REFERENCES Film(FilmId)               ON DELETE CASCADE
);

CREATE TABLE GeoIndexing(
    DeviceId         INT      NOT NULL,
    ServerIP         INT(16)  NOT NULL,
    DeviceIP         INT(16)  NOT NULL,
    ConnectionStart  DATETIME NOT NULL,
    StateIP          INT(8),
    PRIMARY KEY (DeviceId, ServerIP, DeviceIP, ConnectionStart, StateIP),
    FOREIGN KEY (DeviceId, ServerIP, DeviceIP, ConnectionStart)
        REFERENCES ConnectionHistory(DeviceId, ServerIP, DeviceIP, ConnectionStart) ON DELETE CASCADE,
    FOREIGN KEY (StateIP) REFERENCES GeoState(StateIP)
);

CREATE TABLE RecommendedFilms(
    ProfileCode  CHAR(14) NOT NULL,
    FilmId       INT      NOT NULL,
    PRIMARY KEY(ProfileCode, FilmId),
    FOREIGN KEY (FilmId)       REFERENCES Film(FilmId)          ON DELETE CASCADE,
    FOREIGN KEY (ProfileCode)  REFERENCES Profile(ProfileCode)  ON DELETE CASCADE
);