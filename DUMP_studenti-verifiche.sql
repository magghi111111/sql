-- Active: 1768035621663@@127.0.0.1@3306@studenti_verifiche
CREATE DATABASE IF NOT EXISTS Studenti_Verifiche;
USE Studenti_Verifiche;

CREATE TABLE Studente(
	ID INT(11) AUTO_INCREMENT PRIMARY KEY,
	Cognome VARCHAR(255) NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Classe INT(1) NOT NULL,
	Sezione CHAR(1) NOT NULL,
	Sesso CHAR(1) NOT NULL
);

INSERT INTO Studente(Cognome,Nome,Classe,Sezione,Sesso)VALUES
('Marchi','Mario',1,'A','m'),
('Rossi','Marcella',1,'A','f'),
('Bruni','Cosimo',1,'A','m'),
('Gaspari','Alda',1,'A','f'),
('Verdi','Francesco',2,'A','m'),
('Carli','Cesare',2,'A','m'),
('Bianchi','Maria',2,'A','f'),
('Neri','Silvia',2,'A','f');

CREATE TABLE Voto(
	ID INT(11) AUTO_INCREMENT PRIMARY KEY,
	Data DATE NOT NULL,
	Voto DOUBLE NOT NULL,
	Tipo CHAR(1) NOT NULL,
	IDStudente INT(11) NOT NULL,
	FOREIGN KEY (IDStudente) REFERENCES Studente(ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

INSERT INTO Voto(Data,Voto,Tipo,IDStudente)VALUES
('2010-02-15',5,'S',1),
('2010-02-15',7,'S',2),
('2010-02-15',4,'S',3),
('2010-02-15',6,'S',4),
('2010-02-26',4.5,'O',1),
('2010-02-27',7,'O',3),
('2010-02-15',6,'O',6),
('2000-02-18',9,'P',8);

-- 8. visualizzare gli alunni valutati tra il 20 e il 27 febbraio

SELECT S.`Cognome`, S.`ID`-- 1. elenco dei cognomi e dei relativi id
FROM Studente S;

SELECT S.Nome, S.Cognome, S.Classe , S.Sezione-- 2. visualizzare gli studenti della classe prima: nome cognome classe sezione
FROM Studente S
WHERE S.Classe = 1;

SELECT S.Cognome, V.Voto -- 3. visualizzare il cognome e il voto di ogni studente
FROM Studente S, Voto V
WHERE S.ID = V.IDStudente;

SELECT S.Cognome, V.Voto 
FROM Studente S
JOIN Voto V on S.ID = V.IDStudente; 

SELECT S.Cognome,S.Nome-- 4. visualizzare l’elenco degli alunni insufficienti
FROM Studente S
JOIN Voto V on S.ID = V.IDStudente
WHERE V.Voto < 6;

SELECT S.Cognome,S.Nome-- 5. visualizzare le allieve di sesso femminile
FROM Studente S
WHERE S.Sesso = 'f';

SELECT ROUND(AVG(V.Voto),2) AS Media-- 6. visualizzare la media dei voti della classe prima (COUNT(*) conta tutte le righe che mi estrapola la condizione)
FROM Studente S
JOIN Voto V on S.ID = V.IDStudente
WHERE S.Classe = 1;

SELECT S.Cognome,V.Voto,S.Classe-- 7. visualizzare i voti orali con evidenziato il cognome, il voto e la classe
FROM Studente S
JOIN Voto V on S.ID = V.IDStudente
WHERE V.Tipo = 'O';

SELECT S.Cognome,S.Cognome,V.Voto-- 8. visualizzare gli alunni valutati tra il 20 e il 27 febbraio
FROM Studente S
JOIN Voto V on S.ID = V.IDStudente
WHERE V.Data BETWEEN '2010-02-20' AND '2010-02-27';