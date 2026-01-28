create table persona(
    nr_tessera int(5) primary key AUTO_INCREMENT not null,
    cf char(16) unique not null,
    cognome varchar(30) not null,
    nome varchar(30) not null,
    date date,
    patologia varchar(50),
    esenzione varchar(30),
    allergia varchar(30)
)

insert into persona
values ('1111222233334444','marcello','celani','2025-12-14','festa'),
('55556666777788889999','marcello','celani','2025-12-14','festa'),
('9999111122225555999','marcello','celani','2025-12-14','festa');

delete from persona
where esenzione='E48';

update persona
set cognome = upper(cognome),
nome = upper(nome);

update persona 
set esenzione = 'per eta'
where data < '1953-1-1';
