
SELECT *
FROM Bany
	JOIN
		Hraci ON Bany.hrac_id = Hraci.hrac_id
WHERE Bany.zabanovany = 1
SELECT Hraci.hrac_id, COUNT(*) as Count FROM Hraci JOIN Moderovani ON Hraci.hrac_id = Moderovani.hrac_id GROUP BY Hraci.hrac_id



-- 2.3
CREATE OR ALTER PROCEDURE AktualizeDukazy (@p_prez VARCHAR(40), @p_bug INTEGER) AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		UPDATE Bugy
		SET Bugy.dukaz = @p_prez
		WHERE @p_bug = Bugy.bug_id

		COMMIT;
	END TRY
	BEGIN CATCH
		ROLLBACK;
	END CATCH;
END;
GO;

SELECT COUNT(admin_id)
FROM Bugy
WHERE bug_id = 10

--INSERT INTO Hraci (hrac_id, prezdivka, steam_id, discord_id) VALUES (@Hrac_id, @Prezdivka, @Steam_id, @Discord_id)

-- 3.1
CREATE OR ALTER PROCEDURE pridaniBugu (@p_typ Integer, @p_player INTEGER, @p_dukaz VARCHAR(40), @p_popis VARCHAR(100), @p_poskozeni VARCHAR(100), @server_id Integer) AS
BEGIN
	DECLARE  @similarity Integer
	DECLARE @boolBigger bit
	DECLARE @boolSameTipe bit
	DECLARE @cHelpType Integer
	SET @boolBigger = 0;
	--DECLARE c CURSOR FOR SELECT DIFFERENCE(popis, @p_popis), typ_bugu FROM Bugy; -- odebrat
	--OPEN c;
	--FETCH FROM c INTO @similarity, @cHelpType;

	SELECT @similarity = COUNT(*), @cHelpType = typ_bugu
	FROM Bugy
	WHERE DIFFERENCE(popis, @p_popis) > 2
	GROUP BY typ_bugu
	


	IF @similarity >= 2
		SET @boolBigger = 1
			
	IF @p_typ = @cHelpType
		SET @boolSameTipe = 1
	
	BEGIN IF (@boolBigger = 1 AND @boolSameTipe = 0) OR (@boolBigger = 0 AND @boolSameTipe = 1)
		BEGIN TRANSACTION
			BEGIN TRY
				INSERT INTO Bugy(Bugy.hrac_id, Bugy.typ_bugu, Bugy.datum, Bugy.dukaz, Bugy.popis, Bugy.poskozeni, Bugy.server_id)
				VALUES (@p_player, @p_typ, CURRENT_TIMESTAMP, @p_dukaz, @p_popis, @p_poskozeni, @server_id)
				COMMIT;
			END TRY
			BEGIN CATCH
				IF @@TRANCOUNT > 0 ROLLBACK;
			END CATCH;
	END;
END;
GO;

--DELETE FROM Bugy
--WHERE hrac_id = 1

--EXECUTE pridaniBugu 1, 1, 'BLA BLA', 'Som fakt nasraný', 'Vse', 2
--SELECT * FROM Moderovani
--SELECT * FROM Servery
SELECT * FROM Bany	

--- 2.1
CREATE OR ALTER PROCEDURE Ban (@p_prezdivka VARCHAR(40), @p_typ VARCHAR(10), @p_banLen DATETIME, @p_admin INTEGER, @p_server VARCHAR(30)) AS
BEGIN
DECLARE @id INTEGER;
		SELECT @id = hrac_id
		FROM Hraci
		WHERE  Hraci.prezdivka = @p_prezdivka

		--PRINT @id

DECLARE @banType VARCHAR(30)
	IF @p_typ = 'Temp'
		SET @banType = '2'
	IF @p_typ = 'Perma'
		SET @banType = '1'
	IF @p_typ = 'VAC'
		SET @banType = '3'

DECLARE @IsAdmin Integer 
	SELECT @IsAdmin = COUNT(*)
	FROM Administratori_Moderatori
	WHERE prezdivka = @p_prezdivka
	PRINT @IsAdmin

Declare @ServerID Integer
	SELECT @ServerID = server_id 
	FROM Servery 
	WHERE Servery.nazev_serveru = @p_server

DECLARE @PocetBanu Integer
	SELECT @PocetBanu = COUNT(*) 
	FROM Bany 
	WHERE Bany.hrac_id = @id
	
	--PRINT @PocetBanu
	 --+ @id + ' ' + @PocetBanu + ' ' + @ServerID + ' ' + @IsAdmin + ' ' + @BanType 
	IF @IsAdmin = 0 -- Není administrátor, mùže mít ban
		BEGIN
			IF @PocetBanu = 0 OR @PocetBanu < 3  -- Nemìl ještì ban nebo jich bylo ménì než 3
			BEGIN 
				BEGIN TRANSACTION
					BEGIN TRY		
						INSERT INTO Bany (admin_id, datum_cas_udeleni_banu, datum_cas_odbanovani, hrac_id, server_id, typ_banu, zabanovany)
					VALUES 
					(
						2, 
						CURRENT_TIMESTAMP,
						@p_banLen,
						@id,
						@ServerID,
						@banType,
						1
					)
						COMMIT;
					END TRY
					BEGIN CATCH
						IF @@TRANCOUNT > 0 ROLLBACK;
					END CATCH;
			END
			ELSE IF @PocetBanu > 3 -- Už mìl 3x ban
			BEGIN
					PRINT  '3: '
					BEGIN TRY
				
						INSERT INTO Bany (admin_id, datum_cas_udeleni_banu, datum_cas_odbanovani, hrac_id, server_id, typ_banu, zabanovany)
						VALUES 
						(
							@p_admin,
							CURRENT_TIMESTAMP,
							NULL,
							@id,
							@ServerID,
							'2',
							1
						)
						COMMIT;
					END TRY
					BEGIN CATCH
						IF @@TRANCOUNT > 0 ROLLBACK;
					END CATCH;
			
			END;
	END;
END;
GO;

Execute Ban '007', 'Perma', NULL, 2, 'CSDamers VALGUERO'
Select * FROM Bugy
SELECT * FROM Hraci


DELETE FROM Bany WHERE typ_banu = 1
-- 6.3

CREATE OR ALTER PROCEDURE JmenujAdministratora (@p_prezdivka VARCHAR(30), @p_jmeno VARCHAR(30)) AS
BEGIN
	DECLARE @pID INTEGER;
	SELECT @pID = hrac_id
	FROM Hraci
	WHERE Hraci.prezdivka = @p_prezdivka

	DECLARE @pBanu INTEGER
	SELECT @pBanu = COUNT(*)
	FROM Bany
	WHERE Bany.hrac_id = @pID

	DECLARE @pPostih INTEGER
	SELECT @pPostih = COUNT(*)
	FROM Moderovani
	WHERE Moderovani.hrac_id = @pID

	PRINT @pID
	PRINT @pBanu
	PRINT @pPostih

	BEGIN TRANSACTION
		BEGIN IF @pBanu = 0 AND @pPostih < 3 
			BEGIN TRY
				INSERT INTO Administratori_Moderatori (discord_id, jmeno, prezdivka)
				VALUES ((SELECT discord_id FROM Hraci WHERE hrac_id = @pID), @p_jmeno, @p_prezdivka);

				DELETE FROM Hraci
				WHERE Hraci.hrac_id = @pID
				COMMIT;
			END TRY
			BEGIN CATCH
				ROLLBACK;
				PRINT 'CHYBA'
			END CATCH;
		END
END;

EXECUTE JmenujAdministratora 'Cisar79', 'Jarda'
SELECT * FROM Administratori_Moderatori
SELECT * FROM Hraci
DELETE FROM Administratori_Moderatori WHERE admin_id=5
INSERT INTO Hraci(prezdivka, steam_id, discord_id)
VALUES 
	('Cisar79', 142556789, 1001)

-- 5.1
SELECT 
(
	SELECT COUNT(*)
	FROM Bugy
	WHERE Hraci.hrac_id = Bugy.hrac_id
) AS  Pocet_bugu,
(
	SELECT COUNT(*)
	FROM Bugy
	WHERE Hraci.hrac_id = Bugy.hrac_id
	GROUP BY Bugy.hrac_id
) AS Pocet_bugu_na_hrace,
(
	SELECT COUNT(*)
	FROM Bugy
	WHERE Hraci.hrac_id = Bugy.hrac_id
	GROUP BY Bugy.admin_id
) AS Pocet_bugu_reseny_adminy,
(
	SELECT COUNT(*)
	FROM Bugy
	WHERE Hraci.hrac_id = Bugy.hrac_id
	GROUP BY Bugy.typ_bugu
) AS Pocet_zaznamenanych_bugu_podleTypu 
FROM Hraci
GO;
	
	SELECT * FROM Typy_bugu

SELECT admin_id, prezdivka,
	(
		SELECT COUNT(*)
		FROM Bany
		WHERE 
			Bany.admin_id = Administratori_Moderatori.admin_id
	) AS pocet_Banù,
	(
		SELECT COUNT(*)
		FROM Bugy
		WHERE 
			Bugy.admin_id = Administratori_Moderatori.admin_id
	) AS pocet_bugu 
FROM Administratori_Moderatori


SELECT t.server_id, t.Pocet_bugu, t.nazev_serveru, t.ip_adresa, t.game_port, t.Query_port, k.Pocet_banù
FROM (
	SELECT Servery.server_id, COUNT(*) Pocet_bugu, Servery.nazev_serveru, Servery.ip_adresa, Servery.game_port, Servery.Query_port
	FROM Servery
		JOIN Bugy b ON Servery.server_id = b.server_id
	GROUP BY Servery.server_id, Servery.nazev_serveru, Servery.ip_adresa, Servery.game_port, Servery.Query_port
) t 
	JOIN 
	(
	SELECT Servery.server_id, COUNT(*) Pocet_banù
	FROM Servery
		JOIN Bany ba ON Servery.server_id = ba.server_id
	GROUP BY Servery.server_id
	) k ON t.server_id = k.server_id 





CREATE OR ALTER PROCEDURE spStudentBecomeTeacher (@p_dukaz VARCHAR(6), @p_department INT) AS
BEGIN
	DECLARE @v_fname VARCHAR(30);
	DECLARE @v_lname VARCHAR(50);
	DECLARE @v_email VARCHAR(50);

	BEGIN TRANSACTION;
		BEGIN TRY
			SELECT @v_fname = fname, @v_lname = lname, @v_email = email
			FROM Student
			WHERE login = @p_login;

			INSERT INTO Teacher (login, fname, lname, email, department)
			VALUES (@p_login, @v_fname, @v_lname, @v_email, @p_department);

			DELETE FROM Student
			WHERE login = @p_login;

			COMMIT;
		END TRY
		BEGIN CATCH
			ROLLBACK;
		END CATCH;
END;
GO
------------------------------------------- 5.1



-- Ukol 3
ALTER TABLE Student
ADD tallness INT NULL
GO

CREATE OR ALTER PROCEDURE spAddStudent2 (@p_fname VARCHAR(30), @p_lname VARCHAR(50), @p_tallness INT) AS
BEGIN
	DECLARE @v_login CHAR(6)
	DECLARE @v_email VARCHAR(50);

	SET @v_login = LOWER(SUBSTRING(@p_lname, 1, 3) + '000');
	SET @v_email = @v_login + '@vsb.cz';

	INSERT INTO Student (login, fname, lname, email, tallness)
	VALUES (@v_login, @p_fname, @p_lname, @v_email, @p_tallness);
END;

EXEC spAddStudent2 'Dženda', 'Swagmaster', 187;

--------------------------------

-- UKOL 4

-- 1)
ALTER TABLE Student
ADD isTall BIT NOT NULL DEFAULT 0;
GO;

-- 2)

CREATE OR ALTER PROCEDURE spIsStudentTall (@p_login CHAR(6)) AS
BEGIN
	DECLARE @v_avgTallness FLOAT;
	DECLARE @v_tallness INT;

	SET @v_avgTallness = (SELECT AVG(tallness) FROM Student);
	SET @v_tallness = (SELECT tallness FROM Student WHERE LOGIN = @p_login);

	IF @v_tallness >= @v_avgTallness
	BEGIN
		UPDATE Student
		SET isTall = 1
		WHERE login = @p_login;
	END
	ELSE BEGIN
		UPDATE Student
		SET isTall = 0
		WHERE login = @p_login;
	END;
END;
Go

-- 3)

CREATE OR ALTER FUNCTION sfLoginExists (@p_login CHAR(6)) RETURNS BIT AS
BEGIN
	DECLARE @v_result BIT;

	IF @p_login IN (SELECT login FROM Student)
		SET @v_result = 1
	ELSE
		SET @v_result = 0;

	RETURN @v_result;
END;

PRINT dbo.sfLoginExists('BOH023')
GO;

CREATE OR ALTER PROCEDURE spAddStudent4 (@p_fname VARCHAR(30), @p_lname VARCHAR(50), @p_tallness INT) AS
BEGIN
	DECLARE @v_login CHAR(6);
	DECLARE @v_email VARCHAR(50);
	DECLARE @v_counter INT;

	SET @v_counter = 1;

	SET @v_login = SUBSTRING(@p_lname, 1, 3) + RIGHT('000' + CAST(@v_counter AS VARCHAR), 3);
	WHILE (dbo.sfLoginExists(@v_login) = 1)
	BEGIN
		SET @v_counter = @v_counter + 1;
		SET @v_login = SUBSTRING(@p_lname, 1, 3) + RIGHT('000' + CAST(@v_counter AS VARCHAR), 3);
	END;

	SET @v_email = @v_login + '@vsb.cz';

	INSERT INTO Student(login, fname, lname, email, tallness)
	VALUES (@v_login, @p_fname, @p_lname, @v_email, @p_tallness);
END;
GO
----------------------------------

-- Ukol 5

CREATE OR ALTER PROCEDURE spSetStudentTallness AS
BEGIN;
	DECLARE @v_login CHAR(6);
	DECLARE c CURSOR FOR SELECT login FROM Student;
	OPEN c;
	FETCH FROM c INTO @v_login;
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		EXEC spIsStudentTall @v_login
		FETCH FROM c INTO @v_login;
	END;

	CLOSE c;
	DEALLOCATE c;
END;

EXEC spSetStudentTallness;

--------------------------------------------------

-- 1)
CREATE TABLE OpStatistics
(
	operation VARCHAR(10) PRIMARY KEY,
	cnt INT
);

INSERT INTO OpStatistics VALUES ('INSERT', 0);
INSERT INTO OpStatistics VALUES ('UPDATE', 0);
INSERT INTO OpStatistics VALUES ('DELETE', 0);
GO

CREATE OR ALTER TRIGGER tgStatistics ON Student AFTER INSERT, UPDATE, DELETE AS
BEGIN
	DECLARE @v_inserted INT;
	DECLARE @v_deleted INT;

	SET @v_inserted = (SELECT COUNT(*) FROM inserted); -- Nové záznamy 
	SET @v_deleted = (SELECT COUNT(*) FROM deleted); -- Pùvodní záznamy

	IF @v_inserted > 0 AND @v_deleted = 0
		UPDATE OpStatistics SET cnt = cnt +1 WHERE operation = 'INSERT';
	ELSE IF @v_inserted > 0 AND @v_deleted > 0
		UPDATE OpStatistics SET cnt = cnt + 1 WHERE operation = 'UPDATE';
	ELSE IF @v_inserted = 0 AND @v_deleted > 0
		UPDATE OpStatistics SET cnt = cnt + 1 WHERE operation = 'DELETE';
END;
GO

CREATE TRIGGER TG_CheckCapacity ON StudentCourse AFTER INSERT
AS
BEGIN
	DECLARE c CURSOR FOR SELECT DISTINCT id FROM inserted;
	DECLARE @v_id INT;
	DECLARE @v_capacity INT;
	DECLARE @v_students INT;

	OPEN c;
	FETCH FROM c INTO @v_id;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @v_capacity = (SELECT capacity FROM Course WHERE id = @v_id);
		SET @v_students = (SELECT COUNT(*) FROM StudentCourse WHERE id = @v_id);

		IF @v_students > @v_capacity
		BEGIN
			ROLLBACK;
			RAISERROR('!PREKROCENA KAPACITA KURZU', 16, 1)
		END;

		FETCH FROM C INTO @v_id;
	END;
	CLOSE c;
	DEALLOCATE c;
END;
