create table alunni(
    codice char(5) primary key,
    cf char(16) unique,
    cognome varchar(30),
    nome varchar (30),
    data date,
    classe char(2)
)

alter table alunni
change cf codice_fiscale char(16) unique;

alter table alunni
change data data_nascita date;

alter table alunni
add corso varchar(20);

alter table alunni
add sezione char(5);

alter table alunni
change corso indirizzo varchar(20);

alter table alunni
drop column telefono;