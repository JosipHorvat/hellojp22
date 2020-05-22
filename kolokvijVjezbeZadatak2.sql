drop database if exists kolokvijVjezba2;
create database kolokvijVjezba2;
use kolokvijVjezba2;

create table punac (
sifra int not null primary key auto_increment,
suknja varchar(40),
vrsta varchar (40),
prviputa datetime,
brat int 
);

create table brat(
sifra int not null primary key auto_increment,
gustoca decimal (13,7),
bojaociju varchar(47),
modelnaocala varchar(47) not null,
suknja varchar(44), 
maraka decimal (12,10) not null,
hlace varchar(48) not null
);

alter table punac add foreign key (brat) references brat(sifra);

create table prijateljica (
sifra int not null primary key auto_increment,
dukserica varchar (39),
eura decimal (14,7),
treciputa datetime,
hlace varchar(44),
zarucnik int
);

create table neprijateljica (
sifra int not null primary key auto_increment,
introvertno boolean,
vesta varchar(50) not null,
gustoca decimal(16,8),
carape varchar(38) not null,
lipa decimal(18,5) not null,
prijateljica int not null
);

alter table neprijateljica add foreign key (prijateljica) references prijateljica(sifra);

create table svekar (
sifra int not null primary key auto_increment,
prstena int not null, 
jmbag char(11),
lipa decimal(17,7) not null,
eura decimal(17,9) not null,
neprijateljica int 
);

alter table svekar add foreign key (neprijateljica) references neprijateljica(sifra);

create table zarucnik(
sifra int not null primary key auto_increment,
indiferentno boolean,
carape varchar(38),
kratkamajica varchar(39), 
ekstrovertno boolean not null,
narukvica int,
kuna decimal(14,8)
);

alter table prijateljica add foreign key (zarucnik) references zarucnik(sifra);

create table zarucnik_punica(
sifra int not null primary key auto_increment,
zarucnik int not null,
punica int not null
);

alter table zarucnik_punica add foreign key (zarucnik) references zarucnik(sifra);

create table punica(
sifra int not null primary key auto_increment,
bojaociju varchar(36),
bojakose varchar(42) not null,
majica varchar (30),
prviputa datetime,
hlace varchar(31),
asocijalno boolean not null
);

alter table zarucnik_punica add foreign key (punica) references punica(sifra);

#1. U tablice neprijateljica, prijateljica i zarucnik_punica unesite po 3 retka. (7)

describe neprijateljica; 
alter table neprijateljica 
add column haljina varchar(50),
add column  siba varchar(50),
add column  luda boolean;

alter table prijateljica 
add column poklon varchar(50),
add column naKavu boolean,
add column posaoUVrtu varchar(50);

alter table zarucnik_punica 
add column oruzje varchar(50),
add column orudje varchar(50),
add column posloviOkoKuce varchar(50);

#2. U tablici punac postavite svim zapisima kolonu vesta na vrijednost Osijek. (4)

describe punac ;
select * from punac  ;
insert into punac  (vrsta) values
('Crna'),
('Bozicna'),
('uff');
update punac set vrsta = 'Osijek';

#3. U tablici svekar obrišite sve zapise čija je vrijednost kolone jmbag 00000000007. (4)
describe svekar;
select *from svekar  ;
insert into svekar (jmbag,prstena,lipa,eura ) values
(00000000007,11,14,10),
(00000000007,11,15,20),
(12345678889,12,17,30);

delete from svekar where jmbag = 00000000007;

#4. Izlistajte treciputa iz tablice prijateljica uz uvjet da vrijednost kolone eura nije 6,14,19,30 ili 40. (6)

select * from prijateljica 
where eura != 7 and eura != 14; #......
select * from prijateljica 
where not (eura =7 or eura = 14 or eura= 19 or eura = 30 or eura = 40);


/*  5. Prikažite prviputa iz tablice punac, eura iz tablice svekar te vesta iz
tablice neprijateljica uz uvjet da su vrijednosti kolone eura iz tablice
prijateljica jednako 84te da su vrijednosti kolone carape iz tablice
zarucnik sadrže niz znakova ba. Podatke posložite po vesta iz tablice
neprijateljica silazno. (10)*/

select a.prviputa as joinovi, b.eura as su  ,c.vesta as takvi ,d.eura as kakvi, e.carape as jesu
from punac a
inner join svekar b on b.sifra =a.sifra 
inner join neprijateljica c on c.sifra  = b.eura 
inner join prijateljica d on d.sifra = c.vesta 
inner join zarucnik e on e.sifra = d.eura 
where d.eura =84 and e.carape like '%BA%'
group by c.vesta asc;


