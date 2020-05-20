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




