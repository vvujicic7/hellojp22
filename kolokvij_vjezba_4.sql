# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\kolokvij_vjezba_4.sql

drop database if exists kolokvij_vjezba_4;
create database kolokvij_vjezba_4;
use kolokvij_vjezba_4;

create table svekrva(
	sifra int not null primary key auto_increment,
	hlace varchar(44) not null,
	stilfrizura varchar(33) not null,
	treciputa datetime,
	carape varchar(39),
	gustoca decimal(16,10) not null
);

create table prijateljica(
	sifra int not null primary key auto_increment,
	suknja varchar(46),
	ogrlica int not null,
	eura decimal(12,7) not null,
	introvertno bit not null,
	svekrva int not null
);

create table mladic(
	sifra int not null primary key auto_increment,
	majica varchar(42) not null,
	eura decimal(16,9) not null,
	hlace varchar(45) not null,
	nausnica int,
	bojaociju varchar(35) not null
);

create table zarucnica_mladic(
	sifra int not null primary key auto_increment,
	zarucnica int not null,
	mladic int not null
);

create table zarucnica(
	sifra int not null primary key auto_increment,
	ekstroventno bit,
	jmbag char(11),
	novcica decimal(18,6) not null,
	treciputa datetime not null
);

create table sestra(
	sifra int not null primary key auto_increment,
	indiferentno bit not null,
	prviputa datetime not null,
	suknja varchar(38),
	haljina varchar(31) not null,
	majica varchar(41) not null,
	zarucnica int
);

create table neprijatelj(
	sifra int not null primary key auto_increment,
	prviputa datetime not null,
	indiferentno bit not null,
	introvertno bit not null,
	nausnica int,
	vesta varchar(35),
	novcica decimal(17,9),
	sestra int not null
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	indiferentno bit,
	haljina varchar(40),
	ekstroventno bit,
	lipa decimal(18,5),
	ogrlica int not null,
	neprijatelj int
);

show tables;

alter table prijateljica add foreign key (svekrva) references svekrva (sifra);

alter table zarucnica_mladic add foreign key (zarucnica) references zarucnica (sifra);
alter table zarucnica_mladic add foreign key (mladic) references mladic (sifra);

alter table prijatelj add foreign key (neprijatelj) references neprijatelj (sifra);

alter table neprijatelj add foreign key (sestra) references sestra (sifra);

alter table sestra add foreign key (zarucnica) references zarucnica (sifra);


#describe sestra;

insert into sestra(indiferentno, prviputa, haljina, majica)
values
(0, '2020-10-10', 'zuta', 'zuta'),
(1, '2020-10-20', 'bijela', 'bijela'),
(0, '2020-10-30', 'crvena', 'crvena')
;


#describe neprijatelj;

insert into neprijatelj(prviputa, indiferentno, introvertno, sestra)
values
('2020-01-01', 0, 0, 1),
('2020-01-02', 1, 1, 2),
('2020-01-03', 0, 1, 3)
;


#describe sestra;

insert into sestra(indiferentno, prviputa, haljina, majica)
values
(0, '2020-01-01', 'b', 'b'),
(1, '2020-01-02', 'c', 'c'),
(1, '2020-01-05', 'd', 'f')
;

#describe zarucnica;

insert into zarucnica(novcica, treciputa)
values
(10, '2020-10-10'),
(20, '2020-10-20'),
(30, '2020-10-30')
;


#describe mladic;

insert into mladic(majica, eura, hlace, bojaociju)
values
('plava', 10, 'plave', 'plava'),
('zuta', 20, 'zuta', 'zuta'),
('bijela', 30, 'bijela', 'bijela')
;


#describe zarucnica_mladic;

insert into zarucnica_mladic(zarucnica, mladic)
values
(1, 1),
(2, 2),
(3, 3)
;

update prijateljica set ogrlica=17;


delete from prijatelj 
where haljina >'AB';


select suknja from sestra 
where prviputa =false;


select a.eura, b.lipa, c.indiferentno, d.prviputa, e.jmbag 
from prijateljica a
inner join prijatelj b on b.sifra=a.sifra 
inner join neprijatelj c on c.sifra=b.sifra 
inner join sestra d on d.sifra=c.sifra 
inner join zarucnica e on e.sifra=d.sifra 
where e.jmbag and d.prviputa is not null
order by c.indiferentno desc;


select e.jmbag, e.novcica
from zarucnica e
left join zarucnica_mladic b on b.mladic=e.sifra
where e.sifra=null;