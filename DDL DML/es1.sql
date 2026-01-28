create table autori(
    codice char(5) primary key,
    cf char(16) unique,
    cognome varchar(30),
    nome varchar(30),
    citta varchar(30)
)

alter table autori
change column cf codice_fiscale char(16);

alter table autori
add indrizzo char(40);

alter table autori
add cap char(5);

alter table autori
modify nome varchar(30) not null;

alter table autori
modify cognome varchar(30) not null;