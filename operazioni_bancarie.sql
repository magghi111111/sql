-- Active: 1768380853295@@127.0.0.1@3306@banca
CREATE DATABASE banca;
use banca;
CREATE TABLE if NOT exists CITTA(
    ID int(5) PRIMARY KEY auto_increment,
    NomeCitta VARCHAR(30) not null,
    Cap char(5) not null
);

-- Popolare la tabella CITTA
INSERT INTO CITTA (ID, NomeCitta, Cap) VALUES 
(1, 'Reggio Emilia', '42121'),
(2, 'Rubiera', '42048'),
(3, 'Scandiano', '42019'),
(4, 'Correggio', '42015'),
(5, 'Guastalla', '42016'),
(6, 'Castelnovo nei Monti', '42035'),
(7, 'Novellara', '42017');

CREATE table if not exists CLIENTE(
    ID int(5) PRIMARY KEY auto_increment,
    Cognome VARCHAR(30) not null,
    Nome VARCHAR(30) not null,
    Sesso enum('M','F') not null,
    IDCitta int(5) REFERENCES CITTA(ID)
        on delete CASCADE
        on update CASCADE
);


-- Popolare la tabella CLIENTE
INSERT INTO CLIENTE (ID, Cognome, Nome, Sesso, IDCitta) VALUES 
(1, 'Algeri', 'Anna', 'F', 1),
(2, 'Buttiglieri', 'Mario', 'M', 2),
(3, 'Bianchi', 'Luca', 'M', 3),
(4, 'Verdi', 'Giulia', 'F', 4),
(5, 'Neri', 'Marco', 'M', 5),
(6, 'Gialli', 'Sara', 'F', 6),
(7, 'Blu', 'Paolo', 'M', 7);

CREATE table if not exists CONTO(
    ID int(5) PRIMARY KEY auto_increment,
    Saldo DECIMAL(10,3) not NULL,
    IDCliente int(5) REFERENCES CLIENTE(ID)
        on delete CASCADE
        on update CASCADE
);

-- Popolare la tabella CONTO
INSERT INTO CONTO (ID, Saldo, IDCliente) VALUES 
(1, 1000.00, 1),
(2, 1500.00, 2),
(3, 2000.00, 3),
(4, 2500.00, 4),
(5, 3000.00, 5),
(6, 3500.00, 6),
(7, 4000.00, 7);

CREATE Table if not exists MOVIMENTO(
    ID int(5) PRIMARY KEY,
    Datam DATE not null,
    causale ENUM('P','V') not NULL,
    importo DECIMAL(10,3) not null,
    IDConto int(5) REFERENCES CONTO(ID)
        on delete CASCADE
        on update CASCADE
)

-- Popolare la tabella MOVIMENTO
INSERT INTO MOVIMENTO (ID, Datam, Causale, Importo, IDConto) VALUES 
(1, '2019-08-20', 'P', 500.00, 1),
(2, '2019-08-15', 'V', 200.00, 1),
(3, '2019-08-16', 'P', 300.00, 2),
(4, '2019-08-31', 'V', 110.00, 2),
(5, '2019-10-14', 'P', 400.00, 3),
(6, '2019-09-11', 'V', 150.00, 3),
(7, '2019-12-12', 'P', 250.00, 4);


SELECT *
FROM citta;-- 1. Elenco di tutte le città

SELECT c.cognome,c.nome,o.saldo
FROM cliente c
JOIN conto o ON c.ID=o.IDCliente
WHERE o.saldo>1500;-- 2. Elenco conti correnti con saldo >15000

SELECT c.cognome,c.nome,o.saldo
FROM cliente c
JOIN conto o ON c.ID=o.IDCliente;-- 3. Riepilogo elenco clienti con saldo

SELECT c.cognome,c.nome,o.saldo
FROM cliente c
JOIN conto o ON c.ID=o.IDCliente
WHERE o.saldo>5000;-- 4. Elenco clienti con saldo superiore a 50000

SELECT c.cognome,c.nome
FROM cliente c
JOIN citta i ON c.IDCitta=i.ID
where i.nomeCitta='Rubiera';-- 5. Elenco clienti di Rubiera

SELECT i.nomeCitta,i.cap
FROM citta i
JOIN cliente c ON c.IDCitta=i.ID
where c.cognome='Algeri';-- 6. Città e CAP del cliente Algeri

SELECT o.saldo
FROM cliente c
JOIN conto o ON c.ID=o.IDCliente
WHERE c.cognome=:cognome AND c.nome=:nome;-- 7. Visualizzare il saldo di un dato cliente (inserire cognome e nome)

SELECT cognome,nome
FROM cliente
ORDER BY cognome;-- 8. Elenco dei clienti (solo cognome e nome) ordinati alfabeticamente per cognome

select *
from conto
ORDER BY saldo DESC;-- 9. Elenco dei conti con relativo saldo ordinati per saldo dal maggiore al minore

select m.datam,m.causale,m.importo
from movimento m 
join conto c on c.ID=m.IDConto;-- 10. Dettaglio operazioni effettuate sul conto con codice 1 visualizzando data, tipo di
-- operazione e importo

select m.datam,m.importo
from movimento m
join conto c on c.ID=m.IDConto
where c.ID = 2 and m.causale = 'P';-- 11. Elenco di tutti i prelievi (data e importo) sul conto con codice 2

select m.datam,m.importo
from movimento m
join conto c on c.ID=m.IDConto
join cliente e on e.ID=c.IDCliente
where e.cognome='Buttiglieri' and m.causale = 'V';-- 12. Elenco di tutti i versamenti di Buttiglieri (data e importo)

select *
from movimento
where datam >= '2019-01-10';-- 13.Elenco di tutti i movimenti effettuati dal 01/10/2019

select *
from movimento-
where datam <'2019-10-20' and causale='V';-- 14. Elenco di tutti i versamenti effettuati prima del 20/10/2019

select *
from movimento
where datam BETWEEN '2019-10-01'and'2019-10-20'  and causale='P' and importo>100;-- 15. Elenco di tutti i prelievi effettuati dal 01/10/2019 al 20/10/2019 con importo>100

select DISTINCT i.nome,i.cognome
from movimento m
join conto c on m.idconto=c.id
join cliente i on c.idcliente=i.id
where MONTH(datam)=9;-- 16. Elencare il cognome e il nome del cliente con tutte le operazioni realizzate nel mese di
-- settembre 2019

select cognome,nome 
from cliente
where cognome like 'B%';-- 17. Elencare tutti i clienti il cui cognome inizia con la lettera B

select m.datam,m.importo,m.causale,i.cognome,i.nome
from movimento m
join conto c on m.idconto=c.id
join cliente i on c.idcliente=i.id
where cognome=:cognome and datam>:data;
-- 18. Visualizzare le operazioni di un dato cliente realizzate dopo una certa data

--contare le operazione eseguite nell ultimo trimestre
SELECT count(*) as numero_operazioni
FROM movimento m
WHERE m.datam>=DATE_SUB(CURDATE(),interval 3 month);

--totale importi operazioni dell ultimo semestre divise per causale
SELECT m.causale,SUM(m.importo) as totale_importo
FROM movimento m
WHERE m.datam>=DATE_SUB(CURDATE(),interval 6 month)
GROUP BY m.causale;

--contare il numero di clienti per sesso
SELECT c.sesso, count(*) as numero_clienti
FROM cliente c
GROUP BY c.sesso;

--calcolare quante donne hanno svolto operazioni prima di una data
SELECT count(DISTINCT(c.id)) as numero_persone
FROM cliente c
JOIN conto o on c.id=o.idcliente
JOIN movimento m on o.id=m.idconto
WHERE c.sesso='F' and m.datam<:data;

--trovare la media degli importi di ciascun cliente
SELECT c.nome,c.cognome,AVG(m.importo) as media_importo
FROM cliente c
JOIN conto o on c.id=o.idcliente
JOIN movimento m on o.id=m.idconto
GROUP BY c.id
HAVING AVG(m.importo) BETWEEN 200 and 300;