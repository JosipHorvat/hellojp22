drop database if exists taxiPrijevoz;
create database taxiPrijevoz;
use taxiPrijevoz;

create table vozilo (
sifra int not null primary key auto_increment,
proizvodjac int not null,
boja varchar(50) not null,
registracijskaOznaka varchar(20) not null
);

create table proizvodjac (
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
tipVozila varchar(50),
marka varchar(50) not null,
godinaProizvodnje datetime not null 
);

create table vozac (
sifra int not null primary key auto_increment,
ime varchar(50),
prezime varchar(50),
vozilo int not null,
oib char(11)
);



create table prijevoz(
sifra int not null primary key auto_increment,
vozac int not null ,
polaziste varchar(150),
odrediste varchar(150), # ide nesto drugo??
ukupnoKm decimal(16,1) not null,
cijena decimal(16,1),
ukupnoputnika int not null 
);



alter table vozilo add foreign key (proizvodjac) references proizvodjac(sifra);
alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table prijevoz add foreign key (vozac) references vozac(sifra);