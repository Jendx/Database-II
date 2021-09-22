INSERT INTO Hraci(prezdivka, steam_id, discord_id)
VALUES 
	('Swagmaster', 169512131, 1435),
	('Alosta', 123456261, 1699),
	('007', 187654321, 1609),
	('Indiana Jones', 187651234, 1407),
	('Barry', 110452364, 1369),
	('Xayoh', 145567824, 1029),
	('Lvi srdce', 182254610, 1987),
	('Cisar79', 142556789, 1001)

INSERT INTO Servery(nazev_serveru, zeme, ip_adresa, game_port, Query_port)
VALUES 
	('CSDamers VALGUERO', 'Czech', '151.61.4.25', 20017, 7008),
	('CSDamers ABERRATION',	'Czech', '151.61.4.25',	20019,	7010),
	('CSDamers ISLAND',	'Czech', '151.61.4.25', 20021,	7012),
	('CSDamers EXTINCTION', 'Czech', '151.61.4.25', 20023, 7014),
	('CSDamers GENESIS 1', 'Czech', '151.61.4.25', 20025, 7016),
	('CSDamers GENESIS 2', 'Czech', '151.61.4.25', 20027, 7018),
	('CSDamers SCORCHED EARTH', 'Czech', '151.61.4.25', 20029, 7020),
	('CSDamers THE CENTER', 'Czech', '151.61.4.25', 20031, 7022)
	

INSERT INTO Administratori_Moderatori(discord_id, jmeno, kontakt, prezdivka)
VALUES
	(5576, 'Filip Císaøský', 123456789, 'Físaø'),
	(6661, 'Stormiè Gargameloviè Puškin', 987654321, 'Stormeloviè'),
	(1666, 'Robbie Rotten', 166166756, '#1MemeOfDecade')
	   
	

INSERT INTO Bany (hrac_id, typ_banu, datum_cas_udeleni_banu, zabanovany, datum_cas_odbanovani, server_id, admin_id)
VALUES 
	(1,2, '2000-01-20 10:26:45', 0, '2020-02-24 10:26:46', 4, 2),
	(5,3, '2000-01-20 01:22:40', 1, NULL, 1, 1),
	(1, 1, '2021-01-20 01:22:40', 1, NULL, 3, 2)

INSERT INTO Moderovani (hrac_id, popis, datum, postih, server_id, admin_id)
VALUES
	(6, 'Nadávání na Jendu v chatu', '2000-11-04 18:00:00', 'Výstraha', 2, 3),
	(2, 'Propagace', '2005-12-12 12:03:14', 'Mute', 1, 1)

INSERT INTO Typy_bugu (typ_bugu, nazev_bugu, popis)
VALUES 
	(1, 'Crash', 'Hra byla neèekanì ukonèena'), -- Crash, Dupe, Exploit, Meshhole, jine
	(2, 'Dupe', 'Duplikace itemù/ dinù etc...'),
	(3, 'Exploit', 'Zpùsob zenužívání mechanik hry'),
	(4, 'Mesh Hole', 'Díra v Meshy'),
	(5, 'Jiné', 'Hra byla neèekanì ukonèena')

INSERT INTO Bugy (hrac_id, datum, typ_bugu, dukaz, server_id, popis, poskozeni, admin_id)
VALUES
	(4, '2012-04-06 10:24:10', '1', 'Fotka', 1, 'Server spadl a hráè pøišel o postavu', 'Ztráta postavy', 1),
	(4, '2012-04-07 14:32:12', '5', 'Fotka', 1, 'Zabití anti-mesh systémem', 'Ztráta lootu', 2),
	(4, '2012-04-07 23:32:12', '5', 'Fotka', 2, 'Meshnutí Rock Drake do meshe Reaper Queenou', 'Ztráta dina', 1)


DELETE FROM Hraci
WHERE hrac_id = 14

SELECT * FROM Bugy