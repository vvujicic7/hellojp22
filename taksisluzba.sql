# c:\xampp\mysql\bin\mysql\ -uedunova -pedunova < d:\jp22\taksisluzba.sql

drop database if exists taksisluzba;
create database taksisluzba;
use taksisluzba;

create table vozac(
sifra int not null primary key auto_increment,
vozilo int,
ime varchar (50) not null,
prezime varchar (50) not null,
putnik int
);

create table vozilo(
sifra int not null primary key auto_increment,
putnik int,
marka_vozila varchar (50),
voznja int
);

create table putnik(
sifra int not null primary key auto_increment,
vozilo int,
voznja int,
cijena decimal(18,5) not null
);

create table voznja(
sifra int not null primary key auto_increment,
cijena decimal(18,5),
br_voznji varchar (50)
);

alter table vozac add foreign key (vozilo) references vozilo (sifra);
alter table vozac add foreign key (putnik) references putnik (sifra);

alter table putnik add foreign key (voznja) references voznja (sifra);
alter table putnik add foreign key (vozilo) references vozilo (sifra);

alter table vozilo add foreign key (voznja) references voznja (sifra);

#describe putnik;
#select * from putnik;

insert into putnik (vozilo, voznja, cijena)
values (null, null, 10);

#describe vozilo;
#select * from vozilo;
insert into vozilo (putnik, marka_vozila, voznja)
values (null, 'Ford', null);

#describe vozac;

insert into vozac(vozilo, ime, prezime, putnik)
values (1, 'Maro', 'Marić', 1);

#describe voznja;

insert into voznja (cijena, br_voznji)
values (50, 2);