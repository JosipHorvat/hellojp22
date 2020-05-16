drop database if exists galerija;
CREATE database galerija;
use galerija;

CREATE  table autor (
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
datumRodenja datetime
);

CREATE table djelo (
sifra int not null primary key auto_increment,
izlozba int not null,
naziv varchar(100) not null,
vrsta varchar (50) not null,
autor int not null,
naProdaju boolean
);

CREATE table izlozba (
sifra int not null primary key auto_increment, 
djelo int not null,
naziv varchar (50) not null,
mjesto varchar(50) not null,
datum datetime 
);


