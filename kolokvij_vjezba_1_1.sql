# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\kolokvij_vjezba_1_1.sql
	drop database if exists kolokvij_vjezba_1_1;
	create database kolokvij_vjezba_1_1;
	use kolokvij_vjezba_1_1;

create table svekar(
	sifra int not null primary key auto_increment,
	bojaociju varchar(40) not null,
	prstena int,
	dukserica varchar(41),
	lipa decimal(13,8),
	eura decimal(12,7),
	majica varchar(35)
);

create table sestra_svekar(
	sifra int not null primary key auto_increment,
	sestra int not null,
	svekar int not null
);

create table mladic(
	sifra int not null primary key auto_increment,
	suknja varchar(50) not null,
	kuna decimal(16,8) not null,
	drugiputa datetime,
	asocijalno bit,
	ekstroventno bit not null,
	dukserica varchar(48) not null,
	muskarac int
);

create table muskarac(
	sifra int not null primary key auto_increment,
	bojaociju varchar(50) not null,
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal(14,5) not null,
	zena int not null
);

create table zena(
	sifra int not null primary key auto_increment,
	treciputa datetime,
	hlace varchar(46),
	kratkamajica varchar(31) not null,
	jmbag char(11) not null,
	bojaociju varchar(39) not null,
	haljina varchar(44),
	sestra int not null
);

create table sestra(
	sifra int not null primary key auto_increment,
	introvertno bit,
	haljina varchar(31) not null,
	maraka decimal(16,6),
	hlace varchar(46) not null,
	narukvica int not null
);

create table cura(
	sifra int not null primary key auto_increment,
	novcica decimal(16,5) not null,
	gustoca decimal(18,6) not null,
	lipa decimal(13,10),
	ogrlica int not null,
	bojakose varchar(38),
	suknja varchar(36),
	punac int
);

create table punac(
	sifra int not null primary key auto_increment,
	ogrlica int,
	gustoca decimal(14,9),
	hlace varchar(41) not null
);

#show tables;

alter table mladic add foreign key (muskarac) references muskarac (sifra);

alter table muskarac add foreign key (zena) references zena (sifra);

alter table zena add foreign key (sestra) references sestra (sifra);

alter table sestra_svekar add foreign key (svekar) references svekar (sifra);

alter table sestra_svekar add foreign key (sestra) references sestra (sifra);

alter table cura add foreign key (punac) references punac (sifra);



describe sestra;

insert into sestra(haljina, hlace, narukvica)
values 
('zubata', 'azute', 1),
('bijbaela', 'abijele', 2),
('plabava', 'aplave', 3)
;


describe mladic;

insert into mladic(suknja, kuna, asocijalno, ekstroventno, dukserica)
values
('plava', 50, 0, 0, 'plava'),
('zuta', 20, 1, 1, 'zuta'),
('crvena', 10, 0, 1, 'crvena')
;

#describe zena;

insert into zena(kratkamajica, jmbag, bojaociju, sestra)
values
('crvena', 12345678911, 'crvena', 1),
('zuta', 12345678912, 'zuta', 2),
('plava', 12345678913, 'plava', 3)
;


#describe muskarac;

insert into muskarac(bojaociju, maraka, zena)
values
('plava', 10, 1),
('zelena', 20, 2),
('crna', 30, 3)
;


#describe svekar;

insert into svekar(bojaociju, dukserica)
values
('plava'),
('zelena'),
('zuta')
;


#describe sestra_svekar;

insert into sestra_svekar(sestra, svekar)
values
(1, 1),
(2, 2),
(3, 3)
;


update cura set gustoca ='15,77';


delete from mladic 
where (kuna >'15,78');


select kratkamajica from zena 
where hlace like '%ana%';


select a.dukserica, f.asocijalno, c.hlace, d.hlace, e.haljina
from svekar a
inner join sestra_svekar b on a.sifra=b.svekar
inner join sestra e on b.sestra=e.sifra 
inner join zena d on e.sifra=d.sestra 
inner join muskarac c on d.sifra=c.zena
inner join mladic f on f.muskarac=c.sifra
where c.hlace like 'a%'and e.haljina like '%ab%'
order by c.hlace desc;


select a.haljina, a.maraka
from sestra a
left join sestra_svekar b on b.sestra=a.sifra
where a.sifra=null;



select * from sestra;


