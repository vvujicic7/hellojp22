# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\kolokvij_vjezba_1.sql

drop database if exists kolokvij_vjezba_1;
create database kolokvij_vjezba_1;
use kolokvij_vjezba_1;

create table sestra(
	sifra 			int not null primary key auto_increment,
	jmbag 			char(11),
	hlace 			varchar(42) not null,
	vesta 			varchar(41),
	prviputa 		datetime not null,
	modelnaocala 	varchar (33),
	becar 			int
);

create table becar(
	sifra 		int not null primary key auto_increment,
	drugiputa 	datetime not null,
	carape 		varchar(36),
	bojaociju 	varchar(46),
	haljina 	varchar(32)
);

create table ostavljena(
	sifra int not null primary key auto_increment,
	jmbag char(11),
	bojaociju varchar(49),
	suknja varchar(31) not null,
	bojakose varchar(45) not null,
	prviputa datetime,
	carape varchar(41) not null
);

create table mladic(
	sifra int not null primary key auto_increment,
	prstena int not null,
	maraka decimal(15,9) not null,
	suknja varchar(30),
	narukvica int not null,
	ostavljena int not null
);

create table cura(
	sifra int not null primary key auto_increment,
	bojakose varchar(36),
	jmbag char(11) not null,
	prstena int not null,
	dukserica varchar(38),
	mladic int
);

create table punac(
	sifra int not null primary key auto_increment,
	ekstroventno bit not null,
	vesta varchar(31),
	asocijalno bit not null,
	prviputa datetime,
	eura decimal(15,6) not null,
	cura int
);

create table snasa(
	sifra int not null primary key auto_increment,
	eura decimal(14,5),
	narukvica int,
	drugiputa datetime not null,
	carape varchar(41)
);

create table ostavljena_snasa(
	sifra int not null primary key auto_increment,
	ostavljena int not null,
	snasa int not null
);
show tables;

alter table sestra add foreign key (becar) references becar (sifra);

alter table ostavljena_snasa add foreign key (ostavljena) references ostavljena (sifra);
alter table ostavljena_snasa add foreign key (snasa) references snasa (sifra);

alter table mladic add foreign key (ostavljena) references ostavljena (sifra);

alter table cura add foreign key (mladic) references mladic (sifra);

alter table punac add foreign key (cura) references cura (sifra);

#describe cura;
insert into cura (bojakose, jmbag, prstena)
values 
('crna', 12345678910, 123),
('plava', 65006445876, 124),
('crvena', 45301415721, 125);

select * from cura;

#describe ostavljena;
insert into ostavljena(jmbag, bojaociju, suknja, bojakose, prviputa, carape)
values
(null, null, 'kratka', 'plava', null, 'duge' ),
(null, null, 'duga', 'crna', null, 'kratke'),
(null, null, 'srednja', 'smedja', null, 'zute');
select * from ostavljena;

#describe snasa;
insert into snasa(eura, narukvica, drugiputa, carape)
values
(null, null, '2020-04-30', null),
(null, null, '2020-05-15', null),
(null, null, '2020-05-20', null);
select * from snasa;
#describe ostavljena_snasa;
insert into ostavljena_snasa(ostavljena, snasa)
values
(1, 1),
(2, 2),
(3, 3);
select * from ostavljena_snasa;

#describe mladic;

insert into mladic(prstena, maraka, suknja, narukvica, ostavljena)
values
(1, 100, null, 1, 1),
(1, 200, null, 1, 2),
(1, 200, null, 1, 3);
select * from mladic;

insert into sestra(jmbag, hlace, vesta, prviputa, modelnaocala, becar)
values (null, 'levis', null, '2020-01-30', null, null);
#describe sestra;
select * from sestra;
update sestra set hlace='Osijek' where sifra=1;

#describe punac;
select * from punac;

insert into punac(ekstroventno, vesta, asocijalno, prviputa, eura, cura)
values(0, null, 0, null, 100, null);

#describe mladic;
select * from mladic;

select suknja from mladic 
where sifra=3;