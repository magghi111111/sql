create database citta_musei;
use citta_musei;

create table if not exists citta(
	id char(3) primary key,
	nome varchar(255) not null,
	nazione varchar(255)
);

create table if not exists museo(
	id char(3) primary key,
	denominazione varchar(255) not null,
	id_citta char(3) references citta(id)
	on delete cascade 
	on update cascade
);