--STUDIO DELLA SINTASSI SQL in DDL e DML

--DDL : Creare o eliminare nuovi database e definire schemi di relazioni,modificarli o eliminarli

CREATE DATABASE nomeDatabase;
USE nomeDatabase;
DROP nomeDatabase;

CREATE TABLE nomeTabella(
    nomeColonna tipo,
    nomeColonna tipo,
    nomeColonna tipo,
);

UNSIGNED --modulo del numero
ZEROFILL --usato per aggiungere degli zeri a sinistra del numero

AUTO_INCREMENT --campi numerici interi che si autoincrementano

ENUM('AA','AG') default 'AA' --dominio della colonna

--Vincoli intrarelazionali

Cf char(16) NOT NULL; --vieta la presenza di valori nulli
DEFAULT 'Reggio Emilia'  -- se non viene esplicitamente fornito un valore viene settato a quello di default

codice char(16) PRIMARY KEY;--dichiarazione in linea
codice char(16),
PRIMARY KEY(codice)--dichiarazione di tabella

nome varchar(255),
cognome varchar(255),
PRIMARY KEY (nome,cognome) --chiave composta

UNIQUE --valore univoco tipo email o telefono ed è una possibile chiave

Nome varchar(20),
Cognome varchar(25),
UNIQUE (Nome, Cognome)--la composizione dei due attributi sara unica

Nome varchar(20),
Cognome varchar(25),
UNIQUE (Nome),
UNIQUE (Cognome)--piu attributi singolarmenti unici

stipendio int CHECK(stipendio>0) --ammette solo stipendi positivi
                                 -- esppressione a livello di riga

CHECK (ImportoLordo = Netto + Ritenute)
CHECK (Stipendio>0 and AnnoAssunzione>1900)
--l'espressione a livello di tabella permette di riferirsi a piu valori

codice_persona char(5) REFERENCES persona(codice),--dichiarazione in linea
codice_persona char(5) REFERENCES persona--se omesso l'attributo di riferimento viene prese in considerazione la chiave primaria della tabella

codice_persona char(5),
FOREIGN KEY(codice_persona) REFERENCES persoan(codice)--dichiarazione di tabella

--Nominazione di vincoli

stipendio int CONSTRAINT StipendioPOsitivo CHECK(stipendio>0),

codice_persona char(5),
CONSTRAINT fkPersona FOREIGN KEY(codice_persona) REFERENCES persoan(codice),

--Politiche di reazione

On Delete
On Update

cascade - set null - set default - no action

--Creare una tabella da una esistente

CREATE TABLE Persona AS
SELECT id,nome,cognome
FROM impiegato;

DROP TABLE nomeTabella; --eliminazione di una tabella

--Modifica di una tabella esistente

ALTER TABLE nomeTabella
ADD nomeColonna tipo,--aggiunta di una colonna in coda

ALTER TABLE nomeTabella
ADD nomeColonna tipo AFTER nomeColonna1, --aggiunta in una posizione specifica

ALTER TABLE nomeTabella
DROP COLUMN nomeColonna, --eliminazione di una colonna

ALTER TABLE nomeTabella
MODIFY COLUMN nomeColonna nuovoTipo, --modifica del tipo di dato

ALTER TABLE nomeTabella
CHANGE vecchioNomeColonna nuovoNomeColonna tipo, --modificare il nome di una colonna esistente

ALTER TABLE nomeTabella
ADD CHECK (stipendio>0) --aggiunta di vincoli

ALTER TABLE nomeTabella
ADD CONSTRAINT stipendioPositivo CHECK (stipendio>0) --aggiunta di vincoli con denominazione

ALTER TABLE nomeTabella
ALTER nomeColonna SET DEFAULT 'reggio emilia' --aggiungere valore di deafult

ALTER TABLE nomeTabella
DROP CHECK stipendioPositivo --eliminazione di vincoli solo se nominati

ALTER TABLE nomeTabella
MODIFY stipendio int CHECK (stipendio >= 10),--modifica di vincoli

Codice CHAR(a) CHECK (Codice LIKE ‘IIS_’),--operatore like per confrontare una stringa

YEAR(now()) --Estrapola l’anno della data corrente
YEAR(currentdate()) --Estrapola la data corrente


--DML manipolare i dati

--Inserimento di dati
INSERT INTO Impiegato(ID, Nome, Cognome, Residenza, Stipendio, Dipartimento)
VALUES(20,'Mario','Rossini','Caserta',31500,'Mag');

INSERT INTO Impiegato
VALUES(20,'Mario','Rossini','Caserta',31500,'Mag');

INSERT INTO Impiegato (ID, Nome, Cognome, Stipendio)
VALUES(22,'Bruno','Locatelli',33000);--solo alcuni campi specifici

INSERT INTO Impiegato (ID, Nome, Cognome, Stipendio)
VALUES (22,'Bruno','Locatelli',33000),
       (23, 'Giorgio', 'Refa', 40000);--inserimento di piu righe dentro la tabella

--Modifica di dati esistenti

UPDATE impiegato --nometabella
SET Dipartimento = 'prod' --colonna da modificare
WHERE matricola = 20 --condizione (senza il WHERE tutti gli elementi vengono modificati)

--Cancellazione dati

DELETE FROM nomeTabella
WHERE ID = 20 , --condizione  --cancellazione di una riga singola

DELETE FROM Impiegato
WHERE Dipartimento = 'R&S';   --cancellazione di piu righe

DELETE FROM nomeTabella --la tabella si svuota