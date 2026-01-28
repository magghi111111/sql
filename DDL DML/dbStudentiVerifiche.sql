/*● STUDENTI: id, cognome, nome, classe, sezione
● VERIFICHE: id, data, tipo
● SVOLGONO: id, voto, fk_studente, fk_verifica*/

create database StudentiVeriche;
use StudentiVeriche;

create table studenti(
    id int(5) primary key AUTO_INCREMENT,
    nome varchar(255),
    cognome varchar(255),
    classe char(1),
    sezione char(1)
);

create table verifiche(
    id int(5) primary key AUTO_INCREMENT,
    data date,
    tipo varchar(20)
);

create table svolgono(
    id int(5) primary key AUTO_INCREMENT,
    voto decimal(3,1),
    id_studente int(5),
    id_verifica int(5),
    foreign key (id_studente) references studenti(id),
    foreign key (id_verifica) references verifiche(id)
);

insert into studenti(nome,cognome,classe,sezione)
values ('marchi','mario','1','A'),
    ('marcello','celani','5','C');

insert into veriche(data,tipo)
values ('2010-02-15','s'),
    ('2010-02-15','o');

insert into svolgono(voto,id_studente,id_verifica)
values ('10',2,2);

alter table studenti
add sesso char(1);

insert into studenti(sesso)
values ('M'),('M');

delete from studenti
where nome='marcello' and cognome='celani';

update verifiche
set tipo='s'
where tipo='p';