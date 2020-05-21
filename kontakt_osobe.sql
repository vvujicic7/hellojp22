#c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\kontakt_osobe.sql

drop database if exists kontakt_osobe;
create database kontakt_osobe;
use kontakt_osobe;

create table kontakt(
	sifra 		int not null primary key auto_increment,
	osoba 		int,
	vrsta 		int,
	vrijednost 	decimal (15,5) not null
);

create table vrsta(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null
);

create table osoba(
	sifra 	int not null primary key auto_increment,
	ime 	varchar (50) not null,
	prezime varchar (50) not null,
	spol 	char (1)
);

alter table kontakt add foreign key (vrsta) references vrsta (sifra);
alter table kontakt add foreign key (osoba) references osoba (sifra);

#describe kontakt;
insert into kontakt(osoba, vrsta, vrijednost)
values (null, null, 200);

#describe vrsta;
insert into vrsta (naziv)
values ('email');

#describe osoba;
insert into osoba(ime, prezime, spol)
values ('Ayrton', 'Senna', null);

#select * from osoba;

#select * from osoba where sifra=1;

update osoba set prezime= 'Schumacher' where sifra=1;
update osoba set ime= 'Michael' where sifra=1;
#select * from kontakt;
update kontakt set vrijednost= 555 where sifra=1;
update osoba set spol='m' where spol is null;

insert into osoba (ime, prezime, spol)
values
('Damon', 'Hill', null),
('David', 'Coulthard', null),
('Kimi', 'Raikkonen', null);
#select * from osoba;
#select * from osoba where sifra=3;
update osoba set spol='f' where sifra= 5;
#describe osoba;

delete from osoba where sifra=2;
delete from osoba where sifra=6;
delete from osoba where sifra=5;



