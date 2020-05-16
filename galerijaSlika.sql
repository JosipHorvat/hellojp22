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

alter table djelo add foreign key (autor) references autor(sifra);
alter table izlozba add foreign key (djelo) references djelo(sifra);

insert into autor (ime ,prezime )
values 
('Tomo', 'Tomic'),
('Iva', 'Ivic'),
('Marija', 'Maric'),
('Josip','Josipovic'),
('Boris', 'Borovski');
select * from autor;

insert into djelo (naziv ,vrsta ,autor,izlozba )
values ('Zalazak sunca', 'Olovka', 1,1),
('Pas na livadi', 'Ulje na platnu',2,2),
('Rad na polju', '3D paint', 3,3),
('Mrtva priroda', 'kolaz papir',4,4),
('Dan D', 'tempera',5,5);

insert into izlozba (naziv ,mjesto ,djelo )
values
('naivna umjetnost', 'Osijek', 4),
('fotorealisticni portreti', 'Vukovar',1),
('pejzazi', 'Zagreb',3),
('Terror', 'Rijeka', 5),
('Moderna umjetnost', 'Split', 3);
