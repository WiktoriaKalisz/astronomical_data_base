CREATE TABLE Ciala_niebieskie
 (nazwa VARCHAR(30)  PRIMARY KEY);

 CREATE TABLE Rakiety
(nr_id INT  PRIMARY KEY IDENTITY(1,1));

CREATE TABLE Galaktyki
(nazwa VARCHAR(30)  PRIMARY KEY,
typ CHAR(25) NOT NULL,
 wielkosc INT NOT NULL);

CREATE TABLE Planety
(nazwa VARCHAR(30)  PRIMARY KEY,
masa FLOAT(3) NOT NULL ,
sklad_atmosfery VARCHAR(30)NOT NULL,
nazwa_galaktyki VARCHAR(30));

CREATE TABLE Ksiezyce
(nazwa VARCHAR(30)  PRIMARY KEY,
nazwa_planety VARCHAR(30),
nazwa_galaktyki VARCHAR(30) NOT NULL);

CREATE TABLE Loty
(nr_id INT  PRIMARY KEY IDENTITY(1,1),
id_rakiety INT NOT NULL,
przebieg_lotu VARCHAR(200),
cel_lotu VARCHAR(40),
czy_zakonczono_powodzeniem BIT NOT NULL,
nazwa_ksiezyca VARCHAR(30),
 nazwa_planety VARCHAR(30),
 data_lotu DATE NOT NULL DEFAULT GETDATE());

CREATE TABLE Astronauci
(nr_id INT  PRIMARY KEY IDENTITY(1,1),
nazwisko VARCHAR(30) NOT NULL,
imie VARCHAR(30) NOT NULL);

CREATE TABLE Wykonuje
(id_lotu INT NOT NULL,
id_astronauty INT NOT NULL,
PRIMARY KEY(id_astronauty,id_lotu));

CREATE TABLE Asteroidy
(nazwa VARCHAR(30)  PRIMARY KEY,
czy_zagrozenie_dla_ziemi BIT NOT NULL);

CREATE TABLE Sondy_kosmiczne
(nazwa VARCHAR(30)  PRIMARY KEY,
do_czego_sluzy VARCHAR(200),
nazwa_ciala VARCHAR(30));

CREATE TABLE Satelity_sztuczne
(nazwa VARCHAR(30)  PRIMARY KEY,
do_czego_sluzy VARCHAR(200),
nazwa_ciala VARCHAR(30),
opis VARCHAR(200));

CREATE TABLE Gwiazdy
(nazwa VARCHAR(30)  PRIMARY KEY,
nazwa_galaktyki VARCHAR(30) NOT NULL,
masa FLOAT(3) NOT NULL);




ALTER TABLE Galaktyki
ADD CONSTRAINT FK_cialo1 FOREIGN KEY
(nazwa) REFERENCES Ciala_niebieskie(nazwa)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Planety
ADD CONSTRAINT FK_cialo2 FOREIGN KEY
(nazwa) REFERENCES Ciala_niebieskie(nazwa)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Planety
ADD CONSTRAINT FK_galaktyka1 FOREIGN KEY
(nazwa_galaktyki) REFERENCES Galaktyki(nazwa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Ksiezyce
ADD CONSTRAINT FK_planeta1 FOREIGN KEY
(nazwa_planety) REFERENCES Planety(nazwa)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Ksiezyce
ADD CONSTRAINT FK_galaktyka2 FOREIGN KEY
(nazwa_galaktyki) REFERENCES Galaktyki(nazwa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Ksiezyce
ADD CONSTRAINT FK_cialo3 FOREIGN KEY
(nazwa) REFERENCES Ciala_niebieskie(nazwa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Loty
ADD CONSTRAINT FK_rakieta1 FOREIGN KEY
(id_rakiety) REFERENCES Rakiety(nr_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Loty
ADD CONSTRAINT FK_ksiezyc1 FOREIGN KEY
(nazwa_ksiezyca) REFERENCES Ksiezyce(nazwa)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Loty
ADD CONSTRAINT FK_planeta2 FOREIGN KEY
(nazwa_planety) REFERENCES Planety(nazwa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Wykonuje
ADD CONSTRAINT FK_lot1 FOREIGN KEY
(id_lotu) REFERENCES Loty(nr_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Wykonuje
ADD CONSTRAINT FK_astronauta1 FOREIGN KEY
(id_astronauty) REFERENCES Astronauci(nr_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Asteroidy
ADD CONSTRAINT FK_cialo4 FOREIGN KEY
(nazwa) REFERENCES Ciala_niebieskie(nazwa)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Sondy_kosmiczne
ADD CONSTRAINT FK_cialo5 FOREIGN KEY
(nazwa_ciala) REFERENCES Ciala_niebieskie(nazwa)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Satelity_sztuczne
ADD CONSTRAINT FK_cialo6 FOREIGN KEY
(nazwa_ciala) REFERENCES Ciala_niebieskie(nazwa)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Gwiazdy
ADD CONSTRAINT FK_cialo7 FOREIGN KEY
(nazwa) REFERENCES Ciala_niebieskie(nazwa)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Gwiazdy
ADD CONSTRAINT FK_galaktyka3 FOREIGN KEY
(nazwa_galaktyki) REFERENCES Galaktyki(nazwa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


