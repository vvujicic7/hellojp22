# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\galerijaslika.sql
drop database if exists galerijaslika;
create database galerijaslika;
use galerijaslika;

create table galerija(
sifra int not null primary key auto_increment,
slika int,
mjesto int not null,
autor int not null
);

create table slika(
sifra int not null primary key auto_increment,
autor int not null,
godina char(4) not null,
mjesto int
);

create table autor(
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
mjesto_rodjenja varchar (50)
);

create table mjesto(
sifra int not null primary key auto_increment,
naziv int not null,
drzava varchar (50) not null
);

alter table slika add foreign key (autor) references autor (sifra);
alter table slika add foreign key (mjesto) references mjesto (sifra);

alter table galerija add foreign key (slika) references slika (sifra);
alter table galerija add foreign key (autor) references autor (sifra);

#show tables;

#describe mjesto;

insert into mjesto (naziv, drzava)
values (1, 'Hrvatska');

#describe autor;

#select * from autor;

insert into autor (ime, prezime, mjesto_rodjenja)
values ('Vlaho','Bukovac', 'Dubrovnik');

#describe galerija;

insert into galerija (slika, mjesto, autor)
values (null, 1, 1);

#describe slika;

insert into slika (autor, godina, mjesto)
values (1, 1900, 1);