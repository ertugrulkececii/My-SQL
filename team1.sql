use team;
CREATE TABLE kisiler (
    id INT PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    adres VARCHAR(100),
    telefon VARCHAR(20),
    meslek VARCHAR(50),
    maas INT,
    dogum_tarihi DATE,
    boy INT
);

INSERT INTO kisiler (id, ad, soyad, adres, telefon, meslek, maas, dogum_tarihi, boy)
VALUES 	(1,  'Ahmet', 'Can',   'Istanbul','35551234567', 'Mühendis', 6000,  '1975-01-25', 169),
		(2,  'Mehmet','Tekin','Ankara',  '25562345678', 'Doktor',    8000,  '1980-02-15', 165),
        (3,  'Aylin', 'Yildiz','Izmir',   '34672345689', 'Eczaci',   5000,  '1977-05-13', 160),
        (4,  'Fatma', 'Arslan','Kars',    '26584610698', 'Hemsire',  5500,  '1988-01-10', 166),
        (5,  'Melis', 'Demir', 'Mardin',  '32165498795', 'Kuaför',   4000,  '1990-07-28', 160),
        (6,  'Kerem', 'Yilmaz','Antalya', '34275451288', 'Soför',    6000,  '1985-11-17', 175),
        (7,  'Sefa',  'Kurt',  'Tekirdag','57244618134', 'Isci',     10000, '1987-12-16', 170),
        (8,  'Meryem','Avci',  'Ankara',  '32165456124', 'Terzi',    4000,  '1991-9-11' , 168),
        (9,  'Nergis','Sari',  'Ankara',  '36654248122', 'Pilot',    8500,  '1995-3-11' , 177),
        (10, 'Samet', 'Tekin', 'Istanbul','43158881421', 'Mühendis', 9500,  '1999-6-10' , 170);
        
        select * from kisiler;
        
        select ad, soyad, adres, maas from kisiler;
        select distinct soyad from kisiler;
        
        -- kac farkli adres (sehir var)
        select distinct adres from kisiler;
        
        -- kac farkli sehir var?
        select count(adres) from kisiler;
        
        select count(distinct adres) from kisiler;
        
        select avg(maas) as ortalama_maas from kisiler; -- 6650 birim
        
        -- WHERE ifadesi
       -- select *from kisiler;
       -- where adres
        
        -- Maasi 7000 den buyuk olanlari ve meslekleri 
        select ad, soyad, meslek, maas from kisiler
        where maas >7000;
        
        -- Ankarada olmayanlarin ad,soyad,adres
        select ad, soyad, adres from kisiler
        where adres !='ankara';
        
        -- BETWEEN ifadesi aralik belirtir
-- Maasi 5000 ile 7000 arasinda olanlarin
-- ad,soyad ve maasini listele
-- BETWEEN X AND Y
SELECT ad, soyad, maas
FROM kisiler 
WHERE maas BETWEEN 5000 AND 7000;

-- adinin 2.harfi e olan kisilerin ad soydai
SELECT ad, soyad
from kisiler
where ad like '_e%';

-- tam tersi
SELECT ad, soyad
from kisiler
where ad not like '_e%';

-- IN ifadesi listeye dahil olanlari alir
-- 'istanbul ','ankara', 'izmir' dekilerin ad, soyad,meslek ve adreslerini listele
select ad, soyad, meslek, adres
from kisiler
where adres in ('istanbul','ankara', 'izmir');

-- ORDER BY siralar
-- boya gore siralayin 
        
select ad, soyad, boy
from kisiler
order by boy;	
        
       -- 170 den buyuk olalari listele
select ad, soyad, boy
from kisiler
where boy >=170 
order by boy desc;	

select *
from kisiler
where adres = 'ankara'

-- maasi 6000 ve 6000 den büyük 
-- ankara veya istanbul da oturanlarin
-- ad, soyad, adres ve maaslarini
-- maasla göre b>k sirala

select ad, soyad, adres, maas
from kisiler
where maas >= 6000 and (adres='istanbul' or adres= 'ankara')
order by maas desc;

        
        
        
        
        
        
        
        
        
        
        
        
        