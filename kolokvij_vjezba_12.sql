drop database if exists kolokvij_vjezba_12;
create database kolokvij_vjezba_12;
use kolokvij_vjezba_12;

create table zena(
	sifra int not null primary key auto_increment,
	eura decimal(16,6) not null,
	indiferentno bit,
	novcica decimal(15,5)
);

create table decko(
	sifra int not null primary key auto_increment,
	hlace varchar(46),
	asocijalno bit,
	stilfrizura varchar(43) not null,
	indiferentno bit not null,
	ogrlica int,
	zena int not null
);

create table zarucnica(
	sifra int not null primary key auto_increment,
	hlace varchar(48) not null,
	kratkamajica varchar(46) not null,
	jmbag char(11),
	nausnica int
);

create table sestra(
	sifra int not null primary key auto_increment,
	lipa decimal(15,9),
	ogrlica int,
	kratkamajica varchar(43) not null
);

create table zarucnica_sestra(
	sifra int not null primary key auto_increment,
	zarucnica int not null,
	sestra int not null
);

create table svekrva(
	sifra int not null primary key auto_increment,
	maraka decimal(14,7),
	kuna decimal(15,8),
	vesta varchar(44),
	asocijalno bit not null,
	ekstrovertno bit,
	zarucnica int
);

create table djevojka(
	sifra int not null primary key auto_increment,
	modelnaocala varchar(34) not null,
	vesta varchar(40) not null,
	kratkamajica varchar(39) not null,
	suknja varchar(36) not null,
	bojaociju varchar(32) not null,
	prstena int not null,
	svekrva int not null
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	lipa decimal(16,10),
	asocijalno bit,
	stilfrizura varchar(37),
	kuna decimal(14,6),
	modelnaocala varchar(38),
	djevojka int
);

alter table decko add foreign key (zena) references zena(sifra);

alter table svekrva add foreign key (zarucnica) references zarucnica(sifra);

alter table djevojka add foreign key (svekrva) references svekrva(sifra);

alter table prijatelj add foreign key (djevojka) references djevojka(sifra);

alter table zarucnica_sestra add foreign key (zarucnica) references zarucnica(sifra);
alter table zarucnica_sestra add foreign key (sestra) references sestra(sifra);

#U tablice djevojka, svekrva i zarucnica_sestra unesite po 3 retka.
insert into zarucnica(hlace,kratkamajica)
values('traper','ljetna'),('sportske','kratkih rukava'),('uske','adidas');

insert into sestra(kratkamajica)
values('ljetna'),('adidas'),('reebok');

insert into zarucnica_sestra (zarucnica,sestra)
values(1,1),(3,3),(2,2);

insert into svekrva(asocijalno)
values(0),(0),(0);

insert into djevojka(modelnaocala,vesta,kratkamajica,suknja,bojaociju,prstena,svekrva)
values('sunčane','s kapuljačom','adidas','duga','zelena',12,1),
('za čitanje','zimska','nike','kratka','crna',11,2),
('rayban','proljetna','puma','uska','smeđa',32,3);

#U tablici decko postavite svim zapisima kolonu asocijalno na vrijednost false.
update decko set asocijalno = false;

#U tablici prijatelj obrišite sve zapise čija je vrijednost kolone asocijalno false.
delete from prijatelj where asocijalno = false;

#Izlistajte vesta iz tablice svekrva uz uvjet da vrijednost kolone kuna nije 8,13,20,28 ili 35.
select vesta 
from svekrva where kuna not in(8,13,20,28,35);










