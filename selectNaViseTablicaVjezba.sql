use knjiznica;



#dobio sam ime autora i naziv izdavaca umjesto sifri u tablici katalog katalog
#sa inner join sam spojio kljuceve FK autor sa PK tablice autor te FK izdavac koji se nalazi u katalogu sa PK tablice izdavac  
select b.ime  as autor ,
c.naziv  as izdavac 
from katalog a
inner join autor b  on b.sifra  = a.autor 
inner join izdavac c on c.sifra = a.izdavac 
where c.naziv like '%centar%';

describe autor;
#svi autori po imenu i prezimenu iz Zadra i Rijeke
select concat (b.prezime, '  ', b.ime )as autor , c.naziv as mjesto 
from katalog a
inner join autor b on b.sifra = a.autor 
inner join mjesto c on c.sifra = a.mjesto
where c.naziv like '%zadar%' or  c.naziv like '%rijeka%';


# ovo je obrnuto
select  a.naslov as katalog , concat( b.prezime, '  ',b.ime,b.datumrodenja ) as autor
from katalog a
left join autor b on a.sifra =b.prezime ;

#Ime i prezime autora cije ime sadrzi ime "Anka" u sebi, u jednom odlomku sa njihovim djelima.
select concat( a.ime, ' ', a.prezime )  as autor, b.naslov as katalog 
from autor a
left join katalog b on a.sifra =b.autor
where b.naslov is not null
and a.ime like '%anka%';

# Djelo, ime, mjesto i naziv izdavaca koji ima kljucnu rijec "grad"
select a.naslov ,b.ime ,d.naziv,c.naziv 
from katalog a
inner join autor b on b.sifra = a.autor
inner join izdavac c on c.sifra =a.izdavac
inner join mjesto d on d.sifra = a.mjesto
where c.naziv like '%grad%'; 

# right i left join primjeri:
select a.naslov as katalog,concat( b.ime, ' ', b.prezime ) as autor 
from katalog a
right join autor b on a.autor =b.sifra ;

select  b.naslov as katalog , concat( a.prezime, '  ',a.ime) as autor
from autor a
left join katalog b on a.sifra =b.autor ;

use sakila;
show tables;

select f.title as Naslov, f.description as Opis, a.first_name as Ime_Glumca 
from sakila.film f
	inner join sakila.film_category fc on fc.film_id = f.film_id 
	inner join sakila.category c on c.category_id = fc.category_id 
	inner join sakila.film_actor fa on fa.film_id = f.film_id 
	inner join sakila.actor a on a.actor_id = fa.actor_id 
where c.name ='Horror'  and  a.first_name like 'M%';

#ime adresu i grad
select a.first_name ,b.address , c.city 
from sakila.staff a
left join sakila.address b on a.address_id = b.address_id 
left join sakila.city c on b.city_id =c.city_id 

select a.title ,b.name ,c.category_id 
from sakila.film a
inner join sakila.category b on b.category_id = a.film_id 
inner join sakila.film_category c on c.category_id =b.category_id 

select a.description ,b.film_id ,b.category_id 
from sakila.film a
inner join sakila.film_category b on b.category_id = a.film_id 

use knjiznica;

show tables;

select a.naslov as nslov_djela ,b.ime as ime_pisca  
from katalog a
left join knjiznica.autor b on b.sifra = a.sifra 

select b.ime as ime_pisca ,b.prezime ,a.naslov ,c.naziv as izdavac ,d.drzava 
from katalog a
right join knjiznica.autor b on b.sifra = a.autor 
right join izdavac c on c.sifra = a.izdavac 
right join knjiznica.mjesto d on c.sifra = a.mjesto 

use sakila;
show tables;
select * from store;

select  a.first_name ,b.rating, c.country    ## TABLICE NE MORAJU BITI POVEZANE KLUCEVIMA DA BI JE JOINAOOOOOOOOOOOOOOO!!!!!!!!!!!!!!
from actor a 
left join film b on b.film_id = a.actor_id
left join country c on c.country_id = b.film_id 

show tables;
select title ,special_features from film f;
select title ,special_features from film f order by  1; # po prvom atributu se rasporedjuju vrijednosti u ovom slucaju a-z
select title ,special_features from film f order by  2 desc;
select distinct title  from film order by title# desc  asc;

select  title,description ,rental_duration from film f order by  3;# po 3 atributu se rasporedjuju vrijednosti od 1-000

select title, release_year from film f order by title desc limit 100; # zadnjih 100 filmova

alter table film add column ime varchar(50);
describe film;
update film set ime = 'Josip' where film_id = 1; # dodao sam novi atribut ime i imenu dao iem Josip gdje je sifra 1 
select title ,ime from film f2 where film_id =1;

select sum(`length` ) from film f ; #zbrojio sam duzinu svih filmova u bazi
select sum(`length` ) from film f where film_id >10 and film_id <20;
select avg (`length` ) from film;
select avg (`length`) from film where film_id >10 and film_id <20;

select  sum(`length` ), min(`length` ),max(`length` ),
avg(`length` ),count(`length` ),std(`length` ) 
from film group by `length` ;

select a.*
from film a 
left join film_actor b ON  a.film_id=b.film_id 
where b.film_id is null;

select * from film a
left join film_actor b on a.film_id =b.film_id 
where b.film_id is not null;

select  a.country ,b.city, c.address 
from country a 
inner join city b ON b.country_id = a.country_id 
inner join address c on c.city_id =b.city_id 
where country like '%ita%';

select * from city 
where city like '%udine%'; #551 city id , 49 country id
select * from address where city_id =551;


use world;

select a.Name as nazivDrzave ,b.Name as nazivGrada, c.`Language` as jezik,  a.LocalName 
from country a
inner join city b ON b.CountryCode =a.Code 
inner join countrylanguage c ON c.CountryCode =a.Code 
where a.Name like '%croa%'

select  a.Name ,b.Name ,b.Population
from country a
left join city b on b.CountryCode = a.Code 
where a.Name like '%Brazil%' ;

select sum(Population) from city;

use edunovajp22;
show tables;

select distinct concat (a.ime, ' ', a.prezime) as ImePrezime,  b.iban , c.naziv as grupa ,d.naziv as smjer, b.sifra 
from osoba a 
inner join predavac b on b.osoba =a.sifra 
inner join grupa c on c.predavac =b. sifra 
inner join smjer d on d.sifra =c.smjer ;

select distinct a.ime ,c.polaznik, d.naziv, e.naziv, e.cijena 
from osoba a
inner join polaznik b on b.osoba = a.sifra 
inner join clan c on c.polaznik = b.sifra 
inner join grupa d on d.sifra = c.grupa 
inner join smjer e on e.sifra = d.smjer 

select concat(lower(left(ime,1)),upper(right(ime,length(ime)-1))) from osoba;
use sakila;

select concat (a.first_name, ' ', a.last_name) , b.actor_id ,c.title ,b.film_id 
from actor a 
inner join film_actor b ON b.actor_id =a.actor_id 
inner join film c ON c.film_id =b.film_id 
order by a.last_name asc; 








