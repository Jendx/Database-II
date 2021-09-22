
/*1;1;1; 
Vrací prùmìr id serverù nahlášených bugù */
SELECT AVG(server_id) AS Prumer
FROM Bugy


/*1;2;5; 
Vrací všechny servery jejichš game port je > 20021, seøazené podle poètu písmen v názvu*/
SELECT server_id, nazev_serveru
FROM Servery
WHERE game_port > 20021
ORDER BY LEN(nazev_serveru) ASC

/*1;3;5;
Vrací všechny servery jejichš nejmenší game port je > 20021, seøazené podle poètu písmen v názvu*/
SELECT server_id, nazev_serveru 
FROM Servery
WHERE game_port > 20021
ORDER BY LEN(nazev_serveru) DESC

/* 1;4;8; Vrací délku prezdivek a prezdivku a seøadí je podle délek pøezdívek*/
SELECT prezdivka, LEN(prezdivka) As Delka_prezdivky
FROM Hraci
ORDER BY LEN(prezdivka) DESC

--------------------------------------------------------------- KAT 2 ----------------------------------------------------

/*2;1;5;
Vrací hrace (atributy hrac_id, prezdivka) s discord_id mezi 1000 a 1450 a délkou pøezdívky delší jak 5 nebo hrace se steam ID vìtším než 169500000*/
SELECT hrac_id, prezdivka
FROM Hraci
WHERE 
	discord_id BETWEEN 1000 AND 1450 AND 
	LEN(prezdivka) > 5 OR 
	steam_id > 169500000

/*2;2;1;
Vrací hráèe (hrac_id ban_id), kteøí budou nebo byly nìkdy odbanování*/
SELECT hrac_id, ban_id
FROM Bany
WHERE
	datum_cas_odbanovani IS NOT NULL 


/*2;3;1;
Vrací hrace (hrac_id, prezdivka) kteøí mají v pøezdívce písmeno j a není to hráè s id 1*/
SELECT hrac_id, prezdivka
FROM Hraci
WHERE 
	prezdivka LIKE '%j%' AND hrac_id != 1

/*2;4;0;
vrátí hráèe (hrac_id) kde délka jejich banù je menší než 1 rok*/ 
SELECT hrac_id
FROM Bany
WHERE 
	DATEDIFF(YEAR, datum_cas_udeleni_banu, datum_cas_odbanovani) < 1 

--------------------------------------------------------------- KAT 3 ----------------------------------------------------

/*3;1;2;
Vrátí pøezdívku hráèe, kteøí mají ban (IN)*/
SELECT prezdivka
FROM Hraci
WHERE hrac_id IN 
(
	SELECT hrac_id
	FROM Bany
)

/*3;2;2;
Vrátí pøezdívku hráèe, kteøí mají ban (EXISTS)*/
SELECT prezdivka
FROM Hraci
WHERE EXISTS
(
	SELECT hrac_id
	FROM Bany
	WHERE Hraci.hrac_id = Bany.hrac_id
)

/*3;3;2;
Vrátí pøezdívku hráèe, kteøí mají ban (INTERSECT)*/
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
Vrátí pøezdívku hráèe, kteøí mají ban (ANY)*/
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
Vrátí poèet hráèù s b ve jménì*/
SELECT COUNT(*) AS pocet_Hracu
FROM Hraci
WHERE prezdivka LIKE '%b%'
GROUP BY hrac_id


/*4;2;1;
Vrátí servery id s poètem reportovaných bugù >= 2*/
SELECT server_id
FROM Bugy
GROUP BY server_id
HAVING Count(*) >= 2

/*4;3;1;
Vrátí sumu serverù se stejnou IP*/
SELECT SUM(game_port) AS SumaG
FROM Servery
GROUP BY ip_adresa


/*4;4;2;
Vrátí Poèet bugù pro daný typ bugu (typ_bugu)*/
SELECT COUNT(typ_bugu) AS POCET_NA_TYP
FROM Bugy
GROUP BY typ_bugu

--------------------------------------------------------------- KAT 5 ----------------------------------------------------

/*5;1;1;
Vrátí pøezdívky hráèù, kteøí jsou zabanovaní*/
SELECT prezdivka
FROM Hraci
	JOIN Bany ON Hraci.hrac_id = Bany.hrac_id
WHERE zabanovany = 1 

/*5;2;1;
Vrátí pøezdívky hráèù, kteøí jsou zabanovaní (EKVIVALENTNÍ S IN)*/
SELECT prezdivka
FROM Hraci
WHERE Hraci.hrac_id IN
(
	SELECT hrac_id
	FROM Bany
	WHERE zabanovany = 1
)

/*5;3;8;
Vrátí všechny pøezdívky a datumy odbanování hráèù*/
SELECT prezdivka, datum_cas_odbanovani
FROM Hraci h
LEFT JOIN Bany b ON h.hrac_id = b.hrac_id
GROUP BY datum_cas_odbanovani, prezdivka 

/*5;4;2;
Vrátí poèty banù všech hráèù co mìly nebo mají ban*/ 
SELECT prezdivka,  COUNT(*) AS poèet_banù
FROM Hraci
	LEFT JOIN Bany ON Hraci.hrac_id = Bany.hrac_id
WHERE Hraci.hrac_id IN
(
	SELECT hrac_id
	FROM Bany
)
GROUP BY prezdivka

/*6;1;3;
Vrátí administrátora, poèty banù a bugù (admin_id, pocet_banù, pocet_bugu) øešených každým administrátorem*/
SELECT admin_id,
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

/*6;2;1;
Vrátí server (server_id), na kterým byly reportován aspoò 1 bug a mìl aspoò jednoho zabanovaného hráèe*/
SELECT t.server_id
FROM (
	SELECT Servery.server_id, COUNT(*) Pocet_bugu
	FROM Servery
		JOIN Bugy b ON Servery.server_id = b.server_id
	GROUP BY Servery.server_id
) t 
	JOIN 
	(
	SELECT Servery.server_id, COUNT(*) Pocet_banù
	FROM Servery
		JOIN Bany ba ON Servery.server_id = ba.server_id
	GROUP BY Servery.server_id
	) k ON t.server_id = k.server_id 
