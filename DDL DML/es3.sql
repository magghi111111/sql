create table docenti(
    codice char(5) primary key,
    cf char(16) unique,
    nome varchar(20),
    cognome varchar(20),
    abilitazione varchar(30)
)

alter table docenti
change abilitazione classe_concorso varchar(30);

alter table docenti
change cf codice_fiscale char(16) unique;

alter table docenti
add stato boolean;

alter table docenti
drop column citta;

alter table docenti
drop column telefono;

alter table docenti
modify classe_concorso varchar(30) not null;