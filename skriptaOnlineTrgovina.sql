
# 18/5/2020
drop database if exists onlineTrgovina;
create database onlineTrgovina;
use onlineTrgovina;

create table korisnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
ulica varchar(50),
grad varchar(50),
postanskiBroj int
);

create  table narudzba (
sifra int not null primary key auto_increment,
korisnik int not null,
adresa int not null
);

create table proizvod (
sifra int not null primary key auto_increment,
kolicina int not null,
vrsta varchar(50) not null 
);

create table dostava (
proizvod int not null,
narudzba int not null,
datumPakiranja datetime not null
);

create table adresa (
sifra int not null primary key auto_increment,
ulica varchar(100) not null,
mjesto varchar(50) not null,
drzava varchar(50) not null,
postanskiBroj int not null
);

alter table narudzba add foreign key (korisnik) references korisnik(sifra);
alter table narudzba  add foreign key (adresa) references adresa(sifra);

alter table dostava  add foreign key (narudzba) references narudzba(sifra);
alter table dostava  add foreign key (proizvod) references proizvod(sifra);
