# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\Hotel_Mativel.sql

drop database if exists Hotel_Mativel;
create database Hotel_Mativel;
use Hotel_Mativel;

create table direktor(
	id 		int not null primary key auto_increment,
	ime 	varchar (50) not null,
	prezime varchar (50) not null,
	email 	varchar (100) not null
);

create table gost(
	id 				int not null primary key auto_increment,
	ime 			varchar (50) not null,
	prezime 		varchar (50) not null,
	email 			varchar (100) not null,
	datum_rodjenja 	datetime not null,
	drzavljanstvo 	char (3) not null
);

create table djelatnik(
	id 				int not null primary key auto_increment,
	ime 			varchar (50) not null,
	prezime 		varchar (50) not null,
	oib 			char (11) not null,
	radno_mjesto 	varchar (50) not null,
	direktor 		int
);

create table usluga_djelatnika(
	usluga 		int not null,
	djelatnik 	int not null
);

create table usluga(
	id 			int not null primary key auto_increment,
	vrsta 		varchar (50) not null,
	naziv 		varchar (50) not null,
	opis 		text not null,
	redni_broj 	varchar (1000) not null,
	datum 		date not null
);

create table hotelska_usluga(
	gost 	int not null,
	usluga 	int not null
);
alter table djelatnik add foreign key (direktor) references direktor (id);

alter table usluga_djelatnika add foreign key (djelatnik) references djelatnik (id);
alter table usluga_djelatnika add foreign key (usluga) references usluga (id);

alter table hotelska_usluga add foreign key (usluga) references usluga (id);
alter table hotelska_usluga add foreign key (gost) references gost (id);

#show tables;
#describe direktor;

insert into direktor(ime, prezime, email)
values ('Marko', 'Markić', 'markomarkicc@mail.com');

#describe djelatnik;

insert into djelatnik(ime, prezime, oib, radno_mjesto)
values ('Rade', 'Radić', 88016235844, 'vrtlar');

#describe usluga;

insert into usluga(vrsta, naziv, opis, redni_broj, datum)
values ('privatni_izlet', 'elafiti', 'cjelodnevni_izlet', 150, '2020-07-07');

#describe gost;

insert into gost(ime, prezime, email, datum_rodjenja, drzavljanstvo)
values ('Henry', 'Smith', 'henrysmith@mail.com', '1970-12-20', 'GBR');






