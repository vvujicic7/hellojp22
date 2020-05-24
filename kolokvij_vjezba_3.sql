# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\kolokvij_vjezba_3.sql

drop database if exists kolokvij_vjezba_3;
create database kolokvij_vjezba_3;
use kolokvij_vjezba_3;

create table cura(
	sifra int not null primary key auto_increment,
	suknja varchar(35),
	gustoca decimal(16,8),
	ogrlica int not null,
	narukvica int,
	hlace varchar(40),
	decko int
);

create table decko(
	sifra int not null primary key auto_increment,
	suknja varchar(45) not null,
	carape varchar(30) not null,
	dukserica varchar(32) not null
);

create table becar(
	sifra int not null primary key auto_increment,
	vesta varchar(42) not null,
	novcica decimal(14,9),
	ekstroventno bit,
	modelnaocala varchar(35) not null,
	bojaociju varchar(44),
	maraka decimal (16,8)
);

create table becar_djevojka(
	sifra int not null primary key auto_increment,
	becar int not null,
	djevojka int not null
);

create table djevojka(
	sifra int not null primary key auto_increment,
	introvertno bit not null,
	maraka decimal (18,9),
	haljina varchar(47),
	hlace varchar(33) not null,
	prviputa datetime
);

create table neprijatelj(
	sifra int not null primary key auto_increment,
	prstena int,
	carape varchar(36),
	nausnica int,
	prviputa datetime,
	stilfrizura varchar(39),
	becar int not null
);

create table brat(
	sifra int not null primary key auto_increment,
	narukvica int,
	introvertno bit,
	ekstroventno bit not null,
	vesta varchar(50) not null,
	nausnica int not null,
	neprijatelj int
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	kuna decimal(17,5),
	asocijalno bit,
	bojaociju varchar(43) not null,
	prviputa datetime not null,
	hlace varchar(45),
	modelnaocala varchar(37) not null,
	brat int
);

#show tables;

alter table cura add foreign key (decko) references decko (sifra);

alter table becar_djevojka add foreign key (becar) references becar (sifra);
alter table becar_djevojka add foreign key (djevojka) references djevojka (sifra);

alter table neprijatelj add foreign key (becar) references becar (sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj (sifra);

alter table prijatelj add foreign key (brat) references brat (sifra);

#describe brat;

insert into brat(ekstroventno, vesta, nausnica)
values
(0, 'plava', 1),
(1, 'zuta', 2),
(0, 'crvena', 3)
;

#select * from brat;

#describe becar;

insert into becar(vesta, modelnaocala)
values
('plava', 'prvi'),
('zuta', 'drugi'),
('crvena', 'treci')
;

#select * from becar;


#describe neprijatelj;

insert into neprijatelj(becar)
values
(1),
(2),
(3)
;

#select * from neprijatelj;

#describe djevojka;

insert into djevojka(introvertno, hlace)
values
(0, 'roze'),
(1, 'crvene'),
(0, 'plave')
;

#select * from djevojka;

#describe becar_djevojka;

insert into becar_djevojka(becar, djevojka)
values
(1, 1),
(2, 2),
(3, 3)
;


update cura set gustoca ='14,76';


delete from prijatelj where asocijalno ='0';


select nausnica from neprijatelj 
where carape like '%ana%';


select a.ogrlica, b.prviputa, c.introvertno, d.carape, e.novcica
from cura a
inner join prijatelj b on b.sifra=a.sifra 
inner join brat c on c.sifra=b.sifra 
inner join neprijatelj d on d.sifra=c.sifra
inner join becar e on e.sifra=d.sifra 
where d.carape like 'a%' and not e.novcica =28
order by c.introvertno desc;


select a.novcica, a.ekstroventno
from becar a
left join becar_djevojka b on b.becar=a.sifra 
where a.sifra=null;
