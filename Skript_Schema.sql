CREATE TABLE Hraci (
  hrac_id Integer IDENTITY PRIMARY KEY NOT NULL,
  prezdivka VARCHAR(30) NOT NULL,
  steam_id Integer NOT NULL,
  discord_id Integer NOT NULL,
)
ON "default"
GO

CREATE TABLE Administratori_Moderatori (
  jmeno VARCHAR(30) NOT NULL,
  prezdivka VARCHAR(30) NOT NULL,
  discord_id Integer NOT NULL,
  kontakt VARCHAR(10),
  admin_id Integer IDENTITY PRIMARY KEY NOT NULL,
) ON "default"
GO

CREATE TABLE Servery (
  server_id Integer IDENTITY PRIMARY KEY NOT NULL,
  nazev_serveru VARCHAR(30) NOT NULL,
  zeme VARCHAR(30) NOT NULL,
  ip_adresa VARCHAR(30) NOT NULL,
  game_port Integer NOT NULL,
  Query_port Integer NOT NULL,
) ON "default"
GO

CREATE TABLE Moderovani (
  mod_id Integer IDENTITY PRIMARY KEY NOT NULL,
  hrac_id Integer CONSTRAINT FK_HRACI FOREIGN KEY REFERENCES Hraci (hrac_id) NOT NULL,
  popis VARCHAR(100) NOT NULL,
  datum Date NOT NULL,
  postih VARCHAR(40) NOT NULL,
  server_id Integer CONSTRAINT FK_SERVER FOREIGN KEY REFERENCES Servery (server_id) NOT NULL,
  admin_id Integer CONSTRAINT FK_ADMIN FOREIGN KEY REFERENCES Administratori_Moderatori (admin_id) NOT NULL,
) ON "default"
GO

CREATE TABLE Typy_bugu (
  typ_bugu Integer NOT NULL CONSTRAINT CAN_BE_ONLY_TB CHECK(typ_bugu BETWEEN 1 AND 5),
  nazev_bugu VARCHAR(20) NOT NULL,
  popis VARCHAR(40) NOT NULL,
  PRIMARY KEY(typ_bugu)
) ON "default"
GO

CREATE TABLE Bugy (
  bug_id Integer IDENTITY PRIMARY KEY NOT NULL,
  hrac_id Integer CONSTRAINT FK_HRACI_BUGY FOREIGN KEY REFERENCES Hraci (hrac_id) NOT NULL,
  datum Date NOT NULL,
  typ_bugu Integer CONSTRAINT CAN_BE_ONLY CHECK(typ_bugu BETWEEN 1 AND 5) NOT NULL FOREIGN KEY REFERENCES Typy_bugu (typ_bugu),
  dukaz VARCHAR(40) NOT NULL,
  server_id Integer CONSTRAINT FK_SERVERY_BUGY FOREIGN KEY REFERENCES Servery (server_id) NOT NULL,
  popis VARCHAR(100) NOT NULL,
  poskozeni VARCHAR(100) NOT NULL,
  admin_id Integer CONSTRAINT FK_ADMIN_BUGY FOREIGN KEY REFERENCES Administratori_Moderatori (admin_id) NULL,
) ON "default"
GO


CREATE TABLE Bany (
  hrac_id Integer NOT NULL CONSTRAINT FK_HRACI_BANY FOREIGN KEY REFERENCES Hraci (hrac_id),
  typ_banu VARCHAR(30) NOT NULL CONSTRAINT MUST_BE_BETWEEN_1_AND_3 CHECK(typ_banu BETWEEN 1 AND 3)  ,--
  datum_cas_udeleni_banu Datetime NOT NULL  , -- CONSTRAINT MUST_BE_SMALLER CHECK(datum_cas_udeleni_banu < datum_cas_odbanovani)
  zabanovany BIT NOT NULL,
  datum_cas_odbanovani Datetime, --  CONSTRAINT MUST_BE_BIGGER_THAN CHECK(datum_cas_udeleni_banu < datum_cas_odbanovani)
  server_id Integer CONSTRAINT FK_SERVER_BANY FOREIGN KEY REFERENCES Servery (server_id) NOT NULL,
  admin_id Integer CONSTRAINT FK_AM_BANY FOREIGN KEY REFERENCES Administratori_Moderatori (admin_id) NOT NULL,
  ban_id Integer IDENTITY PRIMARY KEY NOT NULL,
) ON "default"
GO


ALTER TABLE Bany
ADD CONSTRAINT MUST_BE_SMALLER CHECK(datum_cas_udeleni_banu < datum_cas_odbanovani);
GO

ALTER TABLE Bany
ADD CONSTRAINT MUST_BE_BIGGER CHECK(datum_cas_odbanovani > datum_cas_udeleni_banu);
GO


DROP TABLE Bany
DROP TABLE Bugy
DROP TABLE Typy_bugu
DROP TABLE Moderovani
DROP TABLE Servery
DROP TABLE Administratori_Moderatori
DROP TABLE Hraci

-- Cisar

CREATE TABLE Servers (
  server_id Integer IDENTITY PRIMARY KEY NOT NULL,
  ServerName VARCHAR(30) NOT NULL,
  ConnectionArgument Integer NOT NULL,
) ON "default"
GO

INSERT INTO Servery(ServerName, ConnectionArgument)
VALUES 
	('CSGamers ISLAND',	'steam://connect/109.105.61.119:27040'),
	('CSGamers THE CENTER', 'steam://connect/109.105.61.119:27020'),
	('CSGamers SCORCHED EARTH', 'steam://connect/109.105.61.119:27060'),
	('CSGamers Ragnarok', 'steam://connect/109.105.61.119:27050')
	('CSGamers ABERRATION',	'steam://connect/109.105.61.119:27010'),
	('CSGamers EXTINCTION', 'steam://connect/109.105.61.119:27030'),
	('CSGamers VALGUERO', 'steam://connect/109.105.61.119:27070'),
	('CSGamers GENESIS 1', 'steam://connect/109.105.61.119:27080'),
	('CSGamers Crystal Isles', 'steam://connect/109.105.61.119:27070'),
	('CSGamers GENESIS 2', 'steam://connect/109.105.61.119:27100'),