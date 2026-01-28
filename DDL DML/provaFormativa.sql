/*schema logico
Museo(idMuseo, nome, via civico, idCitta);
Citta(idCitta, nome, idNazione);
Opera(codOpera, nome, anno, descrizione, idMuseo, idTipologia)
Artista(idArtista, nome, cognome, dataNascita, dataMorte)
Crea(idCrea, idOpera, idArtista)

creare il database e le tabelle*/


create database opere if not exist opere;
use opere;

-- tabella nazione
CREATE Table if NOT exists Nazione(
    IDNazione int(5) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) not NULL
);

-- tabella citta
CREATE Table if NOT exists Citta(
    IDCitta int(5) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) not NULL,
    IDNazione int(5) not NULL,
    Foreign Key (IDNazione) REFERENCES Nazione(IDNazione)
);

--tabella museo
CREATE Table if NOT exists Museo(
    IDMuseo int(5) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) not NULL,
    via VARCHAR(255) not NULL,
    civico char(5) not NULL,
    IDCitta int(5) not NULL,
    Foreign Key (IDCitta) REFERENCES Citta(IDCitta) 
);

-- tabella tipologia
CREATE Table if NOT exists Tipologia(
    IDTipologia int(5) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) not NULL
);

--tabella opera
CREATE Table if NOT exists Opera(
    codOpera int(5) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) not NULL,
    anno date not null,
    descrizione VARCHAR(255) not null,
    IDMuseo int(5) not null,
    Foreign Key (IDMuseo) REFERENCES Museo(IdMuseo),
    IDTipologia int(5) not NULL,
    Foreign Key (IDTipologia) REFERENCES Tipologia(IDTipologia)
);

--tabella artista
CREATE Table if NOT exists Artista(
    IDArtista int(5) AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) not NULL,
    dataNascita date not null,
    dataMorte date
);

--tabella crea collega opera-artista
CREATE Table if NOT exists Crea(
    IDCrea int(5) AUTO_INCREMENT PRIMARY KEY,
    IDOpera int(5) not null,
    Foreign Key (IDOpera) REFERENCES Opera(codOpera) on update cascade on delete CASCADE,
    IDArtista int(5) not NULL,
    Foreign Key (IDArtista) REFERENCES Artista(IDArtista) on update cascade on delete CASCADE
);

-- NAZIONE (10)
INSERT INTO Nazione (nome) VALUES
('Italia'),
('Francia'),
('Spagna'),
('Germania'),
('Regno Unito'),
('Stati Uniti'),
('Paesi Bassi'),
('Belgio'),
('Svizzera'),
('Austria');

-- CITTA (10)
INSERT INTO Citta (nome, idNazione) VALUES
('Roma',        1),
('Milano',      1),
('Firenze',     1),
('Parigi',      2),
('Madrid',      3),
('Berlino',     4),
('Londra',      5),
('New York',    6),
('Amsterdam',   7),
('Vienna',      10);

-- MUSEO (10)
INSERT INTO Museo (nome, via,civico, idCitta) VALUES
('Musei Vaticani',             'Viale Vaticano', '1',          1),
('Galleria degli Uffizi',      'Piazzale degli Uffizi', '6',   3),
('Museo del Louvre',           'Rue de Rivoli', '99',          4),
('Museo del Prado',            'Calle Ruiz de Alarcón', '23',  5),
('National Gallery',           'Trafalgar Square', '1',        7),
('Metropolitan Museum of Art', '5th Ave', '1000',              8),
('Rijksmuseum',                'Museumstraat', '1',            9),
('Museo di Capodimonte',       'Via Miano', '2',               1),
('Pergamonmuseum',             'Bodestraße', '1-3',            6),
('Kunsthistorisches Museum',   'Maria-Theresien-Platz','1',     10);

-- TIPOLOGIA (10)
INSERT INTO Tipologia (nome) VALUES
('Pittura'),
('Scultura'),
('Affresco'),
('Installazione'),
('Fotografia'),
('Disegno'),
('Incisione'),
('Mosaico'),
('Arte digitale'),
('Oggetto archeologico');

-- ARTISTA (10)
INSERT INTO Artista (nome, cognome, dataNascita, dataMorte) VALUES
('Leonardo',   'da Vinci',   '1452-04-15', '1519-05-02'),
('Michelangelo','Buonarroti','1475-03-06', '1564-02-18'),
('Raffaello',  'Sanzio',    '1483-04-06', '1520-04-06'),
('Vincent',    'van Gogh',  '1853-03-30', '1890-07-29'),
('Pablo',      'Picasso',   '1881-10-25', '1973-04-08'),
('Claude',     'Monet',     '1840-11-14', '1926-12-05'),
('Caravaggio', 'Merisi',    '1571-09-29', '1610-07-18'),
('Sandro',     'Botticelli','1445-03-01', '1510-05-17'),
('Salvador',   'Dalí',      '1904-05-11', '1989-01-23'),
('Frida',      'Kahlo',     '1907-07-06', '1954-07-13');

-- OPERA (10)
INSERT INTO Opera (nome, anno, descrizione, idMuseo, idTipologia) VALUES
('La Gioconda',              1503, 'Ritratto su tavola',                     3, 1),
('Ultima Cena',              1498, 'Affresco parietale',                    2, 3),
('Nascita di Venere',        1486, 'Pittura su tela',                       2, 1),
('Guernica',                 1937, 'Grande pittura murale',                 4, 1),
('Notte stellata',           1889, 'Paesaggio notturno',                    6, 1),
('Impression, soleil levant',1872, 'Paesaggio marino impressionista',       3, 1),
('David',                    1504, 'Scultura in marmo',                     2, 2),
('Apollo e Dafne',           1625, 'Scultura barocca',                      8, 2),
('Lezione di anatomia',      1632, 'Scena di gruppo',                       7, 1),
('Autoritratto con collana', 1940, 'Autoritratto simbolico',                6, 1);

-- CREA (10)  (associazioni Opera–Artista)
INSERT INTO Crea (idOpera, idArtista) VALUES
(1, 1),  -- La Gioconda - Leonardo da Vinci
(2, 1),  -- Ultima Cena - Leonardo
(3, 8),  -- Nascita di Venere - Botticelli
(4, 5),  -- Guernica - Picasso
(5, 4),  -- Notte stellata - Van Gogh
(6, 6),  -- Impression, soleil levant - Monet
(7, 2),  -- David - Michelangelo
(8, 7),  -- Apollo e Dafne - Caravaggio
(9, 4),  -- Lezione di anatomia - Van Gogh (esempio fittizio)
(10,9);  -- Autoritratto con collana - Dalí (esempio fittizio


alter table Opera
add valoreStimato decimal(10,2);

alter table Crea
add ruoloArtista varchar(30) null;

create index idice_anno
on Opera (anno);

create index indice_cognome
on Artista (cognome);

alter table Museo
add annoFondazione int null;

alter table Opera
modify descrizione varchar(500);

update Opera
set valoreStimato= 75000000
where nome = 'La gioconda';

alter table Crea
add ruoloArtista varchar(20);

update Museo
set annoFondazione = 1581
where nome='Uffizi';

update Opera
set valoreStimato = valoreStimato *1.1
where cognome .....