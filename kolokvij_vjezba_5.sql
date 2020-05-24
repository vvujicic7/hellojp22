# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\kolokvij_vjezba_5.sql
	drop database if exists kolokvij_vjezba_5;
	create database kolokvij_vjezba_5;
	use kolokvij_vjezba_5;
	
create table brat(
	sifra int not null primary key auto_increment,
	kuna decimal(14,9),
	drugiputa datetime not null,
	hlace varchar(46),
	jmbag char(11),
	sestra int not null
);

create table sestra(
	sifra int not null primary key auto_increment,
	kratkamajica varchar(50) not null,
	bojaociju varchar(30),
	haljina varchar(44),
	treciputa datetime
);

create table cura(
	sifra int not null primary key auto_increment,
	carape varchar(47) not null,
	bojakose varchar(50),
	bojaociju varchar(30),
	majica varchar(46) not null,
	eura decimal(13,8) not null,
	zarucnik int not null
);

create table zarucnik(
	sifra int not null primary key auto_increment,
	vesta varchar(49),
	bojakose varchar(42),
	eura decimal(18,6) not null,
	gustoca decimal(17,10) not null,
	suknja varchar(45),
	dukserica varchar(42),
	becar int
);

create table becar(
	sifra int not null primary key auto_increment,
	treciputa datetime,
	haljina varchar(38) not null,
	prstena int,
	narukvica int not null,
	eura decimal(17,5),
	zarucnica int not null
);

create table snasa(
	sifra int not null primary key auto_increment,
	narukvica int not null,
	lipa decimal(16,5) not null,
	bojakose varchar(42) not null,
	bojaociju varchar(38)
); 

create table zarucnica_snasa(
	sifra int not null primary key auto_increment,
	zarucnica int not null,
	snasa int not null
);

create table zarucnica(
	sifra int not null primary key auto_increment,
	narukvica int,
	indiferentno bit not null,
	eura decimal(14,5),
	lipa decimal(14,7) not null,
	kuna decimal(13,5),
	nausnica int
);

#show tables;

alter table brat add foreign key (sestra) references sestra (sifra);

alter table cura add foreign key (zarucnik) references zarucnik (sifra);

alter table zarucnik add foreign key (becar) references becar (sifra);

alter table becar add foreign key (zarucnica) references zarucnica (sifra);

alter table zarucnica_snasa add foreign key (zarucnica) references zarucnica (sifra);
alter table zarucnica_snasa add foreign key (snasa) references snasa (sifra);


#describe zarucnik;

insert into zarucnik(eura, gustoca)
values
(10, 10),
(20, 20),
(30, 30)
;

#describe zarucnica;

insert into zarucnica(indiferentno, lipa)
values 
(0, 10),
(1, 20),
(0, 20)
;

#describe snasa;

insert into snasa(narukvica, lipa, bojakose)
values
(1, 10, 'b'),
(0, 20, 'a'),
(1, 30, 'c')
;

#describe becar;

insert into becar(haljina, narukvica, zarucnica)
values
('bijela', 1, 1),
('zuta', 2, 2),
('plava', 3, 3)
;

#describe zarucnica_snasa;

insert into zarucnica_snasa(zarucnica, snasa)
values
(1, 1),
(2, 2),
(3, 3)
;

update brat set drugiputa ='2016-04-10';


delete from cura 
where bojakose not like 'AB';


select prstena from becar 
where haljina like '%ana%';


select a.hlace, b.majica, c.bojakose, d.haljina, e.indiferentno
from brat a
inner join cura b on b.sifra=a.sifra 
inner join zarucnik c on c.sifra=b.sifra 
inner join becar d on d.sifra=c.sifra 
inner join zarucnica e on e.sifra=d.sifra 
where d.haljina like 'a%' and e.indiferentno is not null
order by c.bojakose desc;


select a.indiferentno, a.eura
from zarucnica a
left join zarucnica_snasa b on b.zarucnica=a.sifra 
where a.sifra=null;
