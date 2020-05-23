# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\kolokvij_vjezba_2.sql
drop database if exists kolokvij_vjezba_2;
create database kolokvij_vjezba_2;
use kolokvij_vjezba_2;

create table punica(
	sifra int not null primary key auto_increment,
	bojaociju varchar(36),
	bojakose varchar(42) not null,
	majica varchar(30),
	prviputa datetime,
	hlace varchar(31),
	asocijalno bit not null
);

create table zarucnik_punica(
	sifra int not null primary key auto_increment,
	zarucnik int not null,
	punica int not null
);

create table zarucnik(
	sifra int not null primary key auto_increment,
	indiferentno bit not null,
	carape varchar(38),
	kratkamajica varchar(39),
	ekstroventno bit not null,
	narukvica int,
	kuna decimal(14,8)
);

create table prijateljica(
	sifra int not null primary key auto_increment,
	dukserica varchar(39),
	eura decimal(14,7),
	treciputa datetime,
	hlace varchar(44),
	zarucnik int
);

create table neprijateljica(
	sifra int not null primary key auto_increment,
	introvertno bit,
	vesta varchar(50) not null,
	gustoca decimal(16,8),
	carape varchar(38) not null,
	lipa decimal(18,5) not null,
	prijateljica int not null
);

create table svekar(
	sifra int not null primary key auto_increment,
	prstena int not null,
	jmbag char(11),
	lipa decimal(17,7) not null,
	eura decimal(17,9) not null,
	neprijateljica int not null
);

create table punac(
	sifra int not null primary key auto_increment,
	suknja varchar(40),
	vesta varchar(49) not null,
	prviputa datetime,
	brat int
);

create table brat(
	sifra int not null primary key auto_increment,
	gustoca decimal(13,7),
	bojaociju varchar(47) not null,
	modelnaocala varchar(47) not null,
	suknja varchar(44),
	maraka decimal(12,10) not null,
	hlace varchar(48) not null
);

show tables;

alter table zarucnik_punica add foreign key (punica) references punica (sifra);
alter table zarucnik_punica add foreign key (zarucnik) references zarucnik (sifra);

alter table svekar add foreign key (neprijateljica) references neprijateljica (sifra);

alter table neprijateljica add foreign key (prijateljica) references prijateljica (sifra);

alter table punac add foreign key (brat) references brat (sifra);

#describe prijateljica;
select * from prijateljica;
insert into prijateljica(dukserica)
values
('zuta'),
('bijela'),
('plava');
#describe neprijateljica;

insert into neprijateljica(vesta, carape, lipa, prijateljica)
values
('bijela', 'bijele', 10, 1),
('zuta', 'zute', 20, 2),
('crvena', 'crvene', 30, 3);

#describe zarucnik;

insert into zarucnik(indiferentno, ekstroventno)
values
(0, 0),
(1, 1),
(1, 0);

#describe punica;

insert into punica(bojakose, asocijalno)
values
('crvena', 0),
('zuta', 1),
('plava', 1);

#describe zarucnik_punica;
#select * from zarucnik;
#select * from punica;

insert into zarucnik_punica(zarucnik, punica)
values
(1, 1),
(2, 2),
(3, 3);

#describe punac;
select * from punac;

update punac set vesta='Osijek';

delete from svekar where jmbag=00000000007;

#describe prijateljica;
select treciputa from prijateljica 
where eura not in(6,14,19,30,40);

#5
select a.prviputa, b.eura, c.vesta, d.eura, e.carape
from punac a
inner join svekar b on b.sifra=a.sifra
inner join neprijateljica c on c.sifra=b.eura
inner join prijateljica d on d.sifra=c.vesta 
inner join zarucnik e on e.sifra=d.eura 
where d.eura=84 and e.carape like '%ba%'
order by c.vesta desc;

#6
select a.carape, a.kratkamajica
from zarucnik a
left join zarucnik_punica b on b.zarucnik=a.sifra;