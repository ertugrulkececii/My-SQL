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

					-- 2. gun grup Calismalari ---------------------------------------

      select * from kisiler;  -- deneme listem kayitli mi diye yapildi
        
     /* 3 farkli kullanimi var

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

-- siralamayi biliyorsak dogrudan degerleri yazariz
INSERT INTO table_name
VALUES (value1, value2, value3, ...);

-- birden fazla satir icin
INSERT INTO table_name
VALUES  (value1, value2, value3, ...)
		(value5, value6, value7, ...),
		(value10, value11, value12, ...);
*/


INSERT INTO kisiler (id, ad, soyad, adres)
VALUES  (11,'Dilaver','Kara','Bartin');
        
-- UPDATE taloyu günceller
-- SET 
-- telefon ve adresi güncelle
UPDATE kisiler
SET telefon = '64131685431', adres = 'Samsun'
WHERE id = 11;        
        
UPDATE kisiler
SET adres = 'Malatya'
WHERE id = 10 or id =2 ;

-- DELETE FROM table_name WHERE condition;
delete from kisiler
where ad = 'Dilaver';

-- LIMIT 
-- özellikle bu komutta veritablarinda farkliliklar var
-- MS Access, SQL Server, Oracle da farkli kullaniliyor
/*
SELECT sütun_adi
FROM tablo_adi
WHERE kosul
LIMIT yasi;
*/
-- En kisa 4 kisinin ad,soyad,maas ve boyunu listeleyin
select ad, soyad, boy, maas
from kisiler
order by boy
limit 4 ;

-- En uzun 3 kisinin ad,soyad,maas ve boyunu listeleyin
select ad, soyad, boy, maas
from kisiler
order by boy desc
limit 3 ;

 -- MIN MAX COUNT SUM AVG 
-- en uzun adan ile en kisa kisileri listeleyin
-- normalde bunlar group by ile kullanilir 
-- ancak tekil sonuclar icin kullanilabilir

-- 1 - en uzun kisi kim
select max(boy)
from kisiler;
-- 2 - en kisa kisi kim       
select min(boy)
from kisiler;  
 
 select avg(maas)
from kisiler;
 
 SELECT MAX(maas)   -- en büyük degeri buluyor
FROM kisiler;

select max(maas)
from kisiler
where boy<170;
select*from kisiler;

select count(adres)
from kisiler
where adres= 'Ankara';

-- adresin ikinci harfi a olan   LIKE
-- maas ortalamasini   AVG
-- listeleyin

select avg(maas)
from kisiler
where adres like '_a%' ;

-- GROUP BY
-- aggregate fonksiyonlar ile kullanilir
-- bunlar COUNT(), MAX(), MIN(), SUM(), AVG()

select count(adres), adres
from kisiler
group by adres;

-- hangi adresten kac tane var 
-- sayi sirasina gore büyükten kücüge listeleyin
select count(adres) as adet, adres
from kisiler
group by adres
order by adet desc;

-- Sehirlerin Maas ortalamasini ve sehirleri yazin
select avg(maas) as Maas_Ortalamasi, adres
from kisiler
group by adres;

-- Sehirlerin Maas ortalamasini ve sehirleri yazin
-- buyukten kucuge siralayin
select avg(maas) as Maas_Ortalamasi, adres
from kisiler
group by adres;
order by Maas_Ortalamasi desc;

SELECT sum(maas)as maas_toplami, adres as adres
FROM kisiler
GROUP BY adres
ORDER BY maas_toplami desc;

-- Mesleklere göre ortalama maas büyükten kücüge siralayalim
SELECT AVG(maas) AS Maas_Ortalamasi, meslek as meslek
FROM kisiler
GROUP BY meslek
ORDER BY Maas_Ortalamasi DESC;

-- WHERE kullanilabilir mi?
-- halihazirda var olan veritabanindaki sütunlar üzerinde
-- kullanilir

-- HAVING  sonradan olusturulan sütunlarda kullanilir
-- dolayisiyla GROUP BY ile birlikte kullanilir

-- Ortalama maasi 5000 >= olan meslekler 

SELECT AVG(maas) AS Maas_Ortalamasi, meslek as meslek
FROM kisiler
GROUP BY meslek
having Maas_Ortalamasi >=5000
ORDER BY Maas_Ortalamasi DESC;








        
        
        