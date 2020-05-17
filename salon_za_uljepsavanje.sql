#c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\salon_za_uljepsavanje.sql

drop database if exists salon_za_uljepsavanje;
create database salon_za_uljepsavanje;
use salon_za_uljepsavanje;

create table djelatnica(
sifra int not null primary key auto_increment,
ime varchar (50) not null,
prezime varchar (50) not null,
korisnik int not null,
oib char (11) not null,
opis text
);

create table korisnik(
sifra int not null primary key auto_increment,
usluga int not null,
redni_broj varchar (50),
opis text
);

create table usluga(
sifra int not null primary key auto_increment,
naziv varchar (50) not null,
opis text,
datum date not null,
cijena decimal (15,4)
);

alter table djelatnica add foreign key (korisnik) references korisnik (sifra);

alter table korisnik add foreign key (usluga) references usluga (sifra);

#describe usluga;

insert into usluga (naziv, opis, datum, cijena)
values ('bojanje', 5, '2020-05-05', 100);

#describe korisnik;
insert into korisnik ( usluga, redni_broj, opis)
values (1, 22, null);

#show tables;
#select * from korisnik;
#describe djelatnica;
insert into djelatnica (ime, prezime, korisnik, oib, opis)
values ('Marina', 'Matić', 1, '53330062407', null);