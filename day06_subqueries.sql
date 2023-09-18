/*================================= SUBQUERY =================================
    Sorgu icinde calisan sorguya SUBQUERY (ALT SORGU) denir.
============================================================================*/
use sys;
CREATE TABLE calisanlar
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
INSERT INTO calisanlar VALUES(456783456, 'Selgun Bey', 'Ankara', 5500, 'Ford');
CREATE TABLE sirketler
(
sirket_id int,
sirket varchar(20),
calisan_sayisi int
);
INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);
SELECT * FROM calisanlar;
SELECT * FROM sirketler;
-- ======================== WHERE ile SUBQUERY ===========================
/*----------------------------------------------------------------
 1) Calisan sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/
select sirket
from sirketler
where calisan_sayisi>15000; -- Ford ve Toyota dondurur.alter

-- 2. Adim : Ford ve Toyota'da calisan personeli listeleyin.
SET SQL_SAFE_UPDATES = 0;
select isim
from calisanlar
where sirket in (select sirket
from sirketler
where calisan_sayisi > 15000); 

-- Honda sirketinin calisan sayisini 16000 olarak guncelleyiniz.

update sirketler
set calisan_sayisi=1600
where sirket ='Honda';

-- Ford sirketinin calisan sayisini 13000 olarak guncelleyiniz
update sirketler
set calisan_sayisi=1300
where sirket ='Ford';
/*----------------------------------------------------------------
 2) Sirket_id'si 101'den buyuk olan sirketlerin 
 maaslarini ve sehirlerini listeleyiniz
----------------------------------------------------------------*/

SELECT maas, sehir
FROM calisanlar
WHERE sirket IN (SELECT sirket
				 FROM sirketler
				 WHERE sirket_id > 101);
                 
                 /*----------------------------------------------------------------                
  5) Isminde e harfi icermeyen personellerin calistigi sirketlerin 
  sirket ismini ve sirket idlerini listeleyiniz.
----------------------------------------------------------------*/

SELECT sirket, sirket_id
FROM sirketler
WHERE sirket IN (SELECT sirket
				 FROM calisanlar
				 WHERE isim not like'%e%');

  /* ======================== SELECT ile SUBQUERY ===========================
  SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
  
 * Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
  * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
=> Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
kullanmaniz gerekir?
=========================================================================*/
/*----------------------------------------------------------------
 SORU 1- Her sirketin ismini, calisan sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
select sirket, calisan_sayisi, (select avg(maas)
                                from calisanlar
                                where calisanlar.sirket= sirketler.sirket)
from sirketler;








