drop database if exists kolokvij3;
create database kolokvij3;
use kolokvij3;

create table cura(
sifra int not null primary key auto_increment,
suknja varchar(35),
gustoca decimal(16,8),
ogrlica int not null,
narukvica int,
hlace varchar(40),
decko int 
);

create table decko(
sifra int not null primary key auto_increment,
suknja varchar(45) not null,
carape varchar(30) not null,
dukserica varchar(32) not null
);

alter table cura add foreign key (decko) references decko(sifra);

create table neprijatelj (
sifra int not null primary key auto_increment,
prstena int,
carape varchar(36),
nausnica int,
prviputa datetime,
stilfrizura varchar(39),
becar int not null
);

create table brat (
sifra int not null primary key auto_increment,
narukvica int,
introvertno boolean,
ekstrovertno boolean not null,
vesta varchar(50) not null,
nausnica int not null,
neprijatelj int 
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

create table becar(
sifra int not null primary key auto_increment,
vesta varchar(42) not null,
novcica decimal(14,9),
ekstrovertno boolean,
modelnaocala varchar(35),
bojaociju varchar(44),
maraka decimal(16,8)
);

alter table neprijatelj add foreign key (becar) references becar(sifra);

create table prijatelj(
sifra int not null primary key auto_increment,
kuna decimal(17,5),
asocijalno boolean,
bojaociju varchar(43),
prviputa datetime not null,
hlace varchar(45),
modelnaocala varchar(37) not null,
brat int 
);

alter table prijatelj add foreign key (brat) references brat(sifra);

create table becar_djevojka(
sifra int not null primary key auto_increment,
becar int not null,
djevojka int not null
);

alter table becar_djevojka add foreign key (becar) references becar(sifra);

create table djevojka(
sifra int not null primary key auto_increment,
introvertno boolean not null,
maraka decimal(18,9),
haljina varchar(47),
hlace varchar (33) not null,
prviputa datetime 
);

alter table becar_djevojka add foreign key (djevojka) references djevojka(sifra);




#1. U tablice brat, neprijatelj i becar_djevojka unesite po 3 retka. (7)
select * from brat;
alter table brat 
add column posao varchar(50),
add column imecure varchar(50),
add column vrijedan boolean;

alter table neprijatelj 
add column opasan boolean,
add column odKada datetime,
add column ime varchar (50);

alter table becar_djevojka 
add column imeBecara varchar(50),
add column imeDjevojke varchar(50), 
add column voleSe boolean;

#2. U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 14,76. (4)

select * from cura;
update cura set gustoca = '14,76';

#3. U tablici prijatelj obrišite sve zapise čija je vrijednost kolone asocijalno false. (4)
select *from prijatelj;
delete from prijatelj where asocijalno is false;

#4. Izlistajte nausnica iz tablice neprijatelj uz uvjet da vrijednost kolone carape sadrže slova ana. (6)

select nausnica from neprijatelj 
where carape like '%ana%';

/*5. Prikažite ogrlica iz tablice cura, prviputa iz tablice prijatelj te
introvertno iz tablice brat uz uvjet da su vrijednosti kolone carape iz
tablice neprijatelj počinju slovom a te da su vrijednosti kolone
novcica iz tablice becar različite od 28. Podatke posložite po
introvertno iz tablice brat silazno. (10)*/
show tables;
select a.ogrlica ,b.prviputa ,c.introvertno ,d.carape ,e.novcica 
from cura a 
inner join prijatelj b on b.prviputa = a.sifra 
inner join brat c on c.introvertno =b.sifra 
inner join neprijatelj d on d.carape =c.sifra 
inner join becar e on e.novcica = d.sifra 
where d.carape like 'a%' and e.novcica != 28
order by c.introvertno asc;

#6. Prikažite kolone novcica i ekstroventno iz tablice becar čiji se primarni ključ ne nalaze u tablici becar_djevojka. (5)

select novcica, ekstrovertno from becar a
left join becar_djevojka b on b.sifra = null;




