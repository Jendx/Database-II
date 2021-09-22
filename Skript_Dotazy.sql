
/*1;1;1; 
Vrac� pr�m�r id server� nahl�en�ch bug� */
SELECT AVG(server_id) AS Prumer
FROM Bugy


/*1;2;5; 
Vrac� v�echny servery jejich� game port je > 20021, se�azen� podle po�tu p�smen v n�zvu*/
SELECT server_id, nazev_serveru
FROM Servery
WHERE game_port > 20021
ORDER BY LEN(nazev_serveru) ASC

/*1;3;5;
Vrac� v�echny servery jejich� nejmen�� game port je > 20021, se�azen� podle po�tu p�smen v n�zvu*/
SELECT server_id, nazev_serveru 
FROM Servery
WHERE game_port > 20021
ORDER BY LEN(nazev_serveru) DESC

/* 1;4;8; Vrac� d�lku prezdivek a prezdivku a se�ad� je podle d�lek p�ezd�vek*/
SELECT prezdivka, LEN(prezdivka) As Delka_prezdivky
FROM Hraci
ORDER BY LEN(prezdivka) DESC

--------------------------------------------------------------- KAT 2 ----------------------------------------------------

/*2;1;5;
Vrac� hrace (atributy hrac_id, prezdivka) s discord_id mezi 1000 a 1450 a d�lkou p�ezd�vky del�� jak 5 nebo hrace se steam ID v�t��m ne� 169500000*/
SELECT hrac_id, prezdivka
FROM Hraci
WHERE 
	discord_id BETWEEN 1000 AND 1450 AND 
	LEN(prezdivka) > 5 OR 
	steam_id > 169500000

/*2;2;1;
Vrac� hr��e (hrac_id ban_id), kte�� budou nebo byly n�kdy odbanov�n�*/
SELECT hrac_id, ban_id
FROM Bany
WHERE
	datum_cas_odbanovani IS NOT NULL 


/*2;3;1;
Vrac� hrace (hrac_id, prezdivka) kte�� maj� v p�ezd�vce p�smeno j a nen� to hr�� s id 1*/
SELECT hrac_id, prezdivka
FROM Hraci
WHERE 
	prezdivka LIKE '%j%' AND hrac_id != 1

/*2;4;0;
vr�t� hr��e (hrac_id) kde d�lka jejich ban� je men�� ne� 1 rok*/ 
SELECT hrac_id
FROM Bany
WHERE 
	DATEDIFF(YEAR, datum_cas_udeleni_banu, datum_cas_odbanovani) < 1 

--------------------------------------------------------------- KAT 3 ----------------------------------------------------

/*3;1;2;
Vr�t� p�ezd�vku hr��e, kte�� maj� ban (IN)*/
SELECT prezdivka
FROM Hraci
WHERE hrac_id IN 
(
	SELECT hrac_id
	FROM Bany
)

/*3;2;2;
Vr�t� p�ezd�vku hr��e, kte�� maj� ban (EXISTS)*/
SELECT prezdivka
FROM Hraci
WHERE EXISTS
(
	SELECT hrac_id
	FROM Bany
	WHERE Hraci.hrac_id = Bany.hrac_id
)

/*3;3;2;
Vr�t� p�ezd�vku hr��e, kte�� maj� ban (INTERSECT)*/
SELECT prezdivka
FROM 
(
	SELECT hrac_id
	FROM Hraci
	
	INTERSECT
	
	SELECT hrac_id
	FROM Bany
) t
	JOIN Hraci ON t.hrac_id = Hraci.hrac_id

/*3;4;2;
Vr�t� p�ezd�vku hr��e, kte�� maj� ban (ANY)*/
SELECT hr.prezdivka
FROM
(
	SELECT hrac_id
	FROM Bany
	WHERE hrac_id = ANY
	(
		SELECT hrac_id
		FROM Hraci
	)
)t 
	JOIN Hraci hr ON t.hrac_id = hr.hrac_id

--------------------------------------------------------------- KAT 4 ----------------------------------------------------

/*4;1;1;
Vr�t� po�et hr��� s b ve jm�n�*/
SELECT COUNT(*) AS pocet_Hracu
FROM Hraci
WHERE prezdivka LIKE '%b%'
GROUP BY hrac_id


/*4;2;1;
Vr�t� servery id s po�tem reportovan�ch bug� >= 2*/
SELECT server_id
FROM Bugy
GROUP BY server_id
HAVING Count(*) >= 2

/*4;3;1;
Vr�t� sumu server� se stejnou IP*/
SELECT SUM(game_port) AS SumaG
FROM Servery
GROUP BY ip_adresa


/*4;4;2;
Vr�t� Po�et bug� pro dan� typ bugu (typ_bugu)*/
SELECT COUNT(typ_bugu) AS POCET_NA_TYP
FROM Bugy
GROUP BY typ_bugu

--------------------------------------------------------------- KAT 5 ----------------------------------------------------

/*5;1;1;
Vr�t� p�ezd�vky hr���, kte�� jsou zabanovan�*/
SELECT prezdivka
FROM Hraci
	JOIN Bany ON Hraci.hrac_id = Bany.hrac_id
WHERE zabanovany = 1 

/*5;2;1;
Vr�t� p�ezd�vky hr���, kte�� jsou zabanovan� (EKVIVALENTN� S IN)*/
SELECT prezdivka
FROM Hraci
WHERE Hraci.hrac_id IN
(
	SELECT hrac_id
	FROM Bany
	WHERE zabanovany = 1
)

/*5;3;8;
Vr�t� v�echny p�ezd�vky a datumy odbanov�n� hr���*/
SELECT prezdivka, datum_cas_odbanovani
FROM Hraci h
LEFT JOIN Bany b ON h.hrac_id = b.hrac_id
GROUP BY datum_cas_odbanovani, prezdivka 

/*5;4;2;
Vr�t� po�ty ban� v�ech hr��� co m�ly nebo maj� ban*/ 
SELECT prezdivka,  COUNT(*) AS po�et_ban�
FROM Hraci
	LEFT JOIN Bany ON Hraci.hrac_id = Bany.hrac_id
WHERE Hraci.hrac_id IN
(
	SELECT hrac_id
	FROM Bany
)
GROUP BY prezdivka

/*6;1;3;
Vr�t� administr�tora, po�ty ban� a bug� (admin_id, pocet_ban�, pocet_bugu) �e�en�ch ka�d�m administr�torem*/
SELECT admin_id,
	(
		SELECT COUNT(*)
		FROM Bany
		WHERE 
			Bany.admin_id = Administratori_Moderatori.admin_id
	) AS pocet_Ban�,
	(
		SELECT COUNT(*)
		FROM Bugy
		WHERE 
			Bugy.admin_id = Administratori_Moderatori.admin_id
	) AS pocet_bugu 
FROM Administratori_Moderatori

/*6;2;1;
Vr�t� server (server_id), na kter�m byly reportov�n aspo� 1 bug a m�l aspo� jednoho zabanovan�ho hr��e*/
SELECT t.server_id
FROM (
	SELECT Servery.server_id, COUNT(*) Pocet_bugu
	FROM Servery
		JOIN Bugy b ON Servery.server_id = b.server_id
	GROUP BY Servery.server_id
) t 
	JOIN 
	(
	SELECT Servery.server_id, COUNT(*) Pocet_ban�
	FROM Servery
		JOIN Bany ba ON Servery.server_id = ba.server_id
	GROUP BY Servery.server_id
	) k ON t.server_id = k.server_id 
