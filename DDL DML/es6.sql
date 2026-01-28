create table disco(
    nr_catalogo INT PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(50),
    titolo VARCHAR(50),
    etichetta VARCHAR(50),
    data DATE,
    condizioni_disco VARCHAR(20),
    condizioni_cover VARCHAR(20),
    prezzo_minimo DECIMAL(6,2),
    prezzo_massimo DECIMAL(6,2),
    prezzo_nuovo DECIMAL(6,2),
    paese VARCHAR(30),
    formato VARCHAR(20)
)

insert into disco .....

alter table disco
alter prezzo_minimo set defaul 10;

delete from disco
where prezzo_massimo < prezzo_minimo;

update disco
set prezzo_nuovo = prezzo_nuovo * 1,1
where data < '2013-1-1';

update disco 
set prezzo_nuovo = prezzo_nuovo * 0,95
where data >= '2024-1-1';

update disco
set prezzo_massimo = prezzo_massimo * 1,1
where condizioni_cover ='mint';

delete form disco
where formato ='78 giri';