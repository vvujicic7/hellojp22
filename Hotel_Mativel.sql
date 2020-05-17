# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\Hotel_Mativel.sql

drop database if exists Hotel_Mativel;
create database Hotel_Mativel;
use Hotel_Mativel;

create table vlasnik(
	id 		int not null primary key auto_increment,
	ime 	varchar (50) not null,
	prezime varchar (50) not null,
	email 	varchar (100)not null,
	oib 	char (11)
);

create table direktor(
	id 		int not null primary key auto_increment,
	ime 	varchar (50) not null,
	prezime varchar (50) not null,
	email 	varchar (100) not null,
	oib 	char (11),
	vlasnik int not null
);

create table recepcija(
	id 				int not null primary key auto_increment,
	opis 			text,
	broj_soba 		int not null,
	vrsta_placanja 	varchar (50) not null,
	kat 			varchar (50) not null,
	broj_zaposlenih int
);

create table soba(
	id 			int not null primary key auto_increment,
	vrsta 		varchar (50),
	cijena 		decimal (18,5) not null,
	kat 		varchar (50) not null,
	broj 		varchar (100) not null,
	direktor 	int not null,
	recepcija int
);

create table recepcioner(
	id 			int not null primary key auto_increment,
	ime 		varchar (50) not null,
	prezime 	varchar (50) not null,
	oib 		char (11) not null,
	recepcija 	int
);

create table gost(
	id 				int not null primary key auto_increment,
	ime 			varchar (50) not null,
	prezime 		varchar (50) not null,
	email 			varchar (100) not null,
	datum_rodjenja 	datetime not null,
	drzavljanstvo 	char (3) not null,
	restoran 		int,
	soba 			int,
	vozac 			int,
	vozilo 			int,
	recepcija 		int
);

create table restoran(
	id 				int not null primary key auto_increment,
	vrsta 			varchar (50),
	opis 			text not null,
	kat 			varchar (50) not null,
	cijena_dorucka 	decimal(15,5)
);

create table konobar(
	id 			int not null primary key auto_increment,
	ime 		varchar (50) not null,
	prezime 	varchar (50) not null,
	staz 		varchar (50),
	rajom 		varchar (50),
	restoran 	int
);

create table vozac(
	id 			int not null primary key auto_increment,
	ime 		varchar (50) not null,
	prezime 	varchar (50) not null,
	oib 		char (11),
	recepcija 	int
);

create table voznje(
	vozac 	int not null,
	vozilo 	int not null
);

create table vozilo(
	id 			int not null primary key auto_increment,
	marka 		varchar (50) not null,
	vrsta 		varchar (50) not null,
	recepcija 	int
);

create table prodaja_izleta(
	recepcioner int not null,
	izlet 		int not null
);

create table izlet(
	id 			int not null primary key auto_increment,
	vrsta 		varchar (50) not null,
	opis 		text,
	naziv 		varchar (50) not null,
	cijena 		decimal (15,5) not null,
	redni_broj 	varchar (100)
);

create table gost_izlet(
	gost 	int not null,
	izlet 	int not null
);

#show tables;
alter table direktor add foreign key (vlasnik) references vlasnik (id);

alter table soba add foreign key (direktor) references direktor (id);
alter table soba add foreign key (recepcija) references recepcija (id);

alter table recepcioner add foreign key (recepcija) references recepcija (id);

alter table vozac add foreign key (recepcija) references recepcija (id);

alter table vozilo add foreign key (recepcija) references recepcija (id);

alter table voznje add foreign key (vozac) references vozac (id);
alter table voznje add foreign key (vozilo) references vozilo (id);

alter table gost add foreign key (soba) references soba (id);
alter table gost add foreign key (restoran) references restoran (id);
alter table gost add foreign key (recepcija) references recepcija (id);

alter table konobar add foreign key (restoran) references restoran (id);

alter table prodaja_izleta add foreign key (recepcioner) references recepcioner (id);
alter table prodaja_izleta add foreign key (izlet) references izlet (id);

alter table gost_izlet add foreign key (gost) references gost (id);
alter table gost_izlet add foreign key (izlet) references izlet (id);


