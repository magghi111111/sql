-- Active: 1768380853295@@127.0.0.1@3306@citta_musei
create database citta_musei;
use citta_musei;

create table if not exists citta(
	id char(3) primary key,
	nome varchar(255) not null,
	nazione varchar(255)
);

create table if not exists museo(
	id char(3) primary key,
	denominazione varchar(255) not null,
	id_citta char(3) references citta(id)
	on delete cascade 
	on update cascade
);

INSERT INTO citta
values ('c1','Firenze','Italia'),
('c2','Roma','Italia'),
('c3','Ferrara','Italia'),
('c4','Barcellona','Spagna');

INSERT INTO museo
values ('m1','Gallerria Uffizi','c1'),
('m2',' Musei Civici di Arte Antica','c3'),
('m3','Musei Vaticani','c2'),
('m4','La Pedrera','c4'),
('m5','Galleria Borghese','c2');

SELECT c.nome,c.nazione
FROM citta c;-- 1. Visualizzare tutte le città del DB

SELECT c.nome
FROM citta c
WHERE c.nazione = 'Italia';-- 2. Visualizzare tutte le città italiane del DB

SELECT c.nome,c.nazione
FROM citta c
WHERE c.nome LIKE 'F%';-- 3. Visualizzare le città che iniziano con la lettera “F”

SELECT COUNT(*) AS Numero_Citta
FROM citta C;-- 4. Contare tutte le città

SELECT COUNT(*) AS Citta_Italiane
FROM citta C
WHERE c.nazione='Italia';-- 5. Contare tutte le città italiane.

SELECT m.denominazione
FROM citta c JOIN museo m on c.id = m.id_citta
WHERE c.nome='Barcellona';-- 6. Visualizzare i musei presenti a Barcellona.

SELECT m.denominazione
FROM citta c JOIN museo m on c.id = m.id_citta
WHERE c.nome='ROMA'
ORDER BY m.denominazione;-- 7. Conoscere l’elenco dei musei di Roma ordinato in modo crescente.

SELECT c.nome,c.nazione
FROM citta c
WHERE c.nazione <> 'Italia';-- 8. Visualizzare tutte le città che non risiedono nel territorio italiano

SELECT COUNT(DISTINCT c.nazione) as Numero_nazioni
FROM Citta c; -- 9. contare le nazione