create table libri(
    isbn char(30) primary key,
    titolo varchar(30),
    autore varchar(30),
    argomento varchar(30),
    editore varchar(30),
    anno year,
    edizione varchar(30)
)

alter table libri
change anno anno_pubblicazione year;

alter table libri
add cognome varchar(40);

alter table libri
add nome varchar(40);

alter table libri
drop column autore;

alter table libri
change cognome autore_cognome varchar(40);

alter table libri
change nome autore_nome varchar(40);

alter table libri
modify nome varchar(40) not null;

alter table libri
modify cognome varchar(40) not null;