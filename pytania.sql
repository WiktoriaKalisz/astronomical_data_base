--PODAJ PRZYCZYN� NIEUDANYCH LOT�W WYKONANYCH W PRZESTRZE� KOSMICZN�
SELECT id_rakiety,  przebieg_lotu
FROM Rakiety JOIN Loty
ON Rakiety.nr_id = Loty.id_rakiety
WHERE  czy_zakonczono_powodzeniem=0
ORDER BY Rakiety.nr_id;


--PODAJ DO CZEGO S�U�� SONDY KOSMICZNE WYSY�ANE NA JOWISZA
SELECT Sondy_kosmiczne.nazwa, do_czego_sluzy 
FROM Sondy_kosmiczne JOIN Ciala_niebieskie
ON Sondy_kosmiczne.nazwa_ciala = Ciala_niebieskie.nazwa
WHERE Ciala_niebieskie.nazwa = 'Jowisz'
ORDER BY Sondy_kosmiczne.nazwa;



--PODAJ LICZB� LOT�W WYKONANYCH NA RӯNE PLANETY
SELECT nazwa,  COUNT(*) AS 'Liczba lotow wykonanych na planet�'
FROM Planety JOIN Loty
ON nazwa = Loty.nazwa_planety
GROUP BY nazwa
ORDER BY COUNT(*) DESC;



--PODAJ MAKSYMALN� MAS� PLANETY W DANEJ GALAKTYCE
SELECT Galaktyki.nazwa,MAX(masa) AS 'Maksymalna masa planety w danej galaktyce'
FROM Planety JOIN Galaktyki
ON Planety.nazwa_galaktyki = Galaktyki.nazwa
GROUP BY Galaktyki.nazwa
ORDER BY Max(masa) DESC;


--WIDOK
CREATE VIEW SondySatelityCiala
AS SELECT Ciala_niebieskie.nazwa AS 'nazwa cia�a niebieskiego, na kt�re zosta� wys�any satelita sztuczny/sonda kosmiczna', Sondy_kosmiczne.do_czego_sluzy AS 'do czego sluzy sonda', Satelity_sztuczne.do_czego_sluzy AS 'do czego sluzy satelita', opis AS 'opis satelity sztucznego'
 FROM Sondy_kosmiczne,Satelity_sztuczne,Ciala_niebieskie
 WHERE Sondy_kosmiczne.nazwa_ciala=Ciala_niebieskie.nazwa AND Satelity_sztuczne.nazwa_ciala=Ciala_niebieskie.nazwa;

SELECT *
FROM SondySatelityCiala;

DROP VIEW SondySatelityCiala;


--WIDOK
CREATE VIEW LotyWykonanePrzezAstronautowNaPlanety
AS SELECT nazwisko, imie,  data_lotu, przebieg_lotu, cel_lotu, Planety.nazwa,czy_zakonczono_powodzeniem
 FROM Astronauci,Wykonuje,Loty,Planety
 WHERE Wykonuje.id_lotu=Loty.nr_id AND Wykonuje.id_astronauty=Astronauci.nr_id AND Loty.nazwa_planety=Planety.nazwa;

SELECT *
FROM LotyWykonanePrzezAstronautowNaPlanety
ORDER BY nazwisko;

DROP VIEW LotyWykonanePrzezAstronautowNaPlanety;



-- PODAJ IMIONA I NAZWISKA ASTRONAUT�W, KT�RYM UDA�O SI� BEZPIECZNIE WYL�DOWA� NA MARSIE
SELECT nazwisko, imie
FROM Astronauci
WHERE nazwisko IN
(SELECT nazwisko
FROM LotyWykonanePrzezAstronautowNaPlanety
WHERE czy_zakonczono_powodzeniem = 1
AND LotyWykonanePrzezAstronautowNaPlanety.nazwa='Mars'
)ORDER BY nazwisko ;


--PODAJ DAT� �MIERCI ORAZ ID RAKIETY W KT�REJ ZMAR� ASTRONAUTA OHOA, PODAJ WARUNKI W KT�RYCH NAST�PI�O ZDARZENIE 
SELECT data_lotu,id_rakiety,przebieg_lotu
FROM Loty
WHERE data_lotu IN
(SELECT data_lotu 
FROM LotyWykonanePrzezAstronautowNaPlanety
WHERE nazwisko = 'Ohoa' AND czy_zakonczono_powodzeniem = 0
);


