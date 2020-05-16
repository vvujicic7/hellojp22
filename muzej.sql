 #c:\xampp\mysql\bin\mysql\ -uedunova -pedunova < d:\jp22\muzej.sql
 
drop database if exists muzej;
create database muzej;
use muzej;

create table izlozba(
sifra int not null primary key auto_increment,
sponzor int not null,
mjesto varchar (50),
kustos int
);

create table djela(
sifra int not null primary key auto_increment,
autor varchar (50),
godina char (4),
izlozba int
);

create table kustos(
sifra int not null primary key auto_increment,
ime varchar (50),
prezime varchar (50)
);

create table sponzor(
sifra int not null primary key auto_increment,
opis text,
naziv varchar (50) not null
);

#describe izlozba;
alter table djela add foreign key (izlozba) references izlozba (sifra);

alter table izlozba add foreign key (sponzor) references sponzor (sifra);
alter table izlozba add foreign key (kustos) references kustos (sifra);

#describe djela;
insert into djela (autor, godina, izlozba)
values ('Mišo Kovač', 1950, null);

#describe sponzor;
insert into sponzor (opis, naziv)
values ('Autokuća', 'Audi Hrvatska');

#describe kustos;
insert into kustos (ime, prezime)
values (null, null);

#describe kustos;
#select * from kustos;
#select * from izlozba;

insert into izlozba (sponzor, mjesto, kustos)
values (1, 'Zagreb', 1);
