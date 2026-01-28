create database centro;
use centro;

create table sala(
    id_sala int(5) primary key AUTO_INCREMENT,
    capienza_max int(5) not null,
    superficie int(5),
    piena char(2)
);

create table attivita(
    id_att int(5) primary key AUTO_INCREMENT,
    nome varchar(20) not null,
    iscritti int(5)
);

create table assegnazione(
    id int(5) primary key AUTO_INCREMENT,
    id_sala int(5) REFERENCES sala(id_sala)on update cascade on delete cascade,
    foreign key(id_sala) REFERENCES sala(id_sala)
    id_attivita int(5) REFERENCES attivita(id_attivita)on update cascade on delete cascade
);

insert into .....

alter table attivita
change iscritti partecipanti int(5);

update sala
set capienza_max = 40;

update sala 
set capienza_max = capienza_max * 1.1
WHERE superficie > 100;

update sala
set piena = 'SI'
where 
