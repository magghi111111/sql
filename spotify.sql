CREATE DATABASE IF NOT EXISTS SPOTIFY;
USE SPOTIFY;

CREATE TABLE ARTISTA(
    ID INT(11) AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255),
    COGNOME VARCHAR(255),
    NOTE_BIOGRAFICHE VARCHAR(255),
    NAZIONALITA VARCHAR(255)
);

CREATE TABLE BRANO(
    ID INT(11) AUTO_INCREMENT PRIMARY KEY,
    TITOLO VARCHAR(255),
    DURATA INT(1)
);

CREATE TABLE REGISTRAZIONE(
    ID INT(11) AUTO_INCREMENT PRIMARY KEY,
    TITOLO VARCHAR(255),
    FORMATO VARCHAR(255),
    GENERE VARCHAR(255),
    NOTE VARCHAR(255),
    COSTO DECIMAL(10, 2),
    IDARTISTA INT(11),
    FOREIGN KEY (IDARTISTA) REFERENCES ARTISTA(ID)
    on update cascade
    on delete cascade
);

CREATE TABLE INTERPRETARE(
    ID INT(11) AUTO_INCREMENT PRIMARY KEY,
    IDBRANO INT(11),
    FOREIGN KEY (IDBRANO) REFERENCES BRANO(ID)
    on update cascade
    on delete cascade,
    IDREGISTRAZIONE INT(11),
    FOREIGN KEY (IDREGISTRAZIONE) REFERENCES REGISTRAZIONE(ID)
    on update cascade
    on delete cascade
);

INSERT INTO ARTISTA(ID, NOME, COGNOME, NOTE_BIOGRAFICHE, NAZIONALITA)
VALUES
(1, 'Luciano', 'Ligabue', NULL , 'italiana'),
(2, 'Vasco', 'Rossi',NULL , 'italiana'),
(3, NULL ,'u2',NULL , 'irlandese'),
(4,NULL ,'queen', NULL, 'inglese'),
(5,NULL ,'beatles', NULL, 'inglese'),
(6, NULL,'pinkfloyd', NULL,'inglese');


INSERT INTO BRANO(ID, TITOLO, DURATA)
VALUES
(1, 'urlando contro il cielo', 1),
(2, 'sarà un bel souvenir', 1),
(3, 'leggero', 1),
(4, 'siamo solo noi', 1),
(5, 'incredibile romantica', 1),
(6, 'non lhai mica capito', 1),
(7, 'asilo republic', 1),
(8, 'e...', 1),
(9, 'un senso', 1),
(10, 'bohemian rapsody', 1),
(11, 'a kind of magic', 1),
(12, 'who wants to live forever', 1),
(13, 'i still havent found...', 1),
(14, 'with or without you', 1),
(15, 'one', 3),
(16, 'let it be', 3),
(17, 'mother', 3);


INSERT INTO REGISTRAZIONE(ID, TITOLO, FORMATO, GENERE, NOTE, COSTO, IDARTISTA)
VALUES
(1, 'lambrusco coltelli rose rosse&popcorn', NULL, 'rock', NULL, 10.00, 1),
(2, 'buon compleanno elvis',NULL,  'rock',NULL, 10.00, 1),
(3, 'siamo solo noi', NULL, 'rock', NULL,10.00,  2),
(4, 'colpa dalfredo', NULL, 'rock', NULL, 10.00, 2),
(5, 'buoni o cattivi', NULL, 'rock', NULL, 100.00, 2),
(6, 'a night at the opera',NULL,  'rock',NULL,  10.00, 4),
(7, 'a kind of magic',NULL,  'rock', NULL,  10.00, 4),
(8, 'the joshua tree', NULL, 'rock',NULL,  10.00, 3),
(9, 'achtung baby', NULL,  'rock', NULL, 10.00, 3),
(10, 'let it be', NULL, 'british invasion',NULL,  10.00,  5),
(11, 'the wan', NULL, 'british invasion', NULL, 10.00,  6);


INSERT INTO INTERPRETARE(ID, IDBRANO, IDREGISTRAZIONE)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 3),
(6, 6, 4),
(7, 7, 5),
(8, 8, 5),
(9, 9, 5),
(10, 10, 6),
(11, 11, 7),
(12, 12, 7),
(13, 13, 8),
(14, 14, 8),
(15, 15, 9),
(16, 16, 10),
(17, 17, 11);

-- 1. Individuare i brani realizzati da un particolare artista.
SELECT b.titolo
from artista a
join registrazione r on a.id=r.idartista
join interpretare i on i.idregistrazione=r.id
join brano b on b.id=i.idbrano
where a.nome=:nome and a.cognome=:cognome;
-- 2. Contare gli artisti italiani.
select count(*) numero_italiani
from artista a
where a.nazionalita='italiana';
-- 3. Visualizzate il costo totale dei cd di un determinato cantante.
SELECT sum(r.costo) as costo_totale
from registrazione r
join artista a on r.idartista=a.id
where a.nome=:nome and a.cognome=:cognome;
-- 4. Individuare qual è l’artista di un determinato brano.
select a.nome,a.cognome
from artista a
join registrazione r on a.id=r.idartista
join interpretare i on i.idregistrazione=r.id
join brano b on b.id=i.idbrano
where b.titolo=:titolo;
-- 5. Individuare quali e quanti sono i brani appartenenti ad un determinato genere.
select b.titolo
from registrazione r
join interpretare i on i.idregistrazione=r.id
join brano b on b.id=i.idbrano
where r.genere=:genere;

-- 6. Conoscere l’elenco degli artisti ordinato in modo crescente.
select a.cognome,a.nome
from artista a
order by a.cognome,a.nome;

-- 7. Visualizzate gli artisti che hanno brani che durano non più di 2 min.
select a.nome,a.cognome
from artista a
join registrazione r on a.id=r.idartista
join interpretare i on i.idregistrazione=r.id
join brano b on b.id=i.idbrano
where b.durata<=2
GROUP BY a.id;

-- 8. Visualizzate tutti gli artisti il cui nome inizia con la lettera R
select a.cognome,a.nome
from artista a
where a.nome like 'L%';

-- 9. Visualizzate la media dei costi di tutte le registrazioni di un determinato artista
SELECT round(avg(r.costo),2)
from registrazione r
join artista a on r.idartista=a.id
where a.nome=:nome and a.cognome=:cognome;

-- 10. Visualizzate tutte le durate dei brani in ordine decrescente. Ciascuna durata deve essere visualizzata una sola volta.
select b.durata
from brano b
GROUP BY b.durata
order by b.durata desc;
