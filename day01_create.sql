-- comment line

/*
in this space that can i right how long comment i want.
*/
/*=============================================
TABLO OLUSTURMA 1 (CRUD - Create)
===============================================*/




-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.

USE sys;

CREATE TABLE ogrenciler1(
id CHAR(4),
isim VARCHAR(20),
not_ortalamasi DOUBLE,
adres VARCHAR(100),
son_degistirme_tarihi DATE
);

SELECT *FROM ogrenciler1;
/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/

CREATE TABLE tedarikciler (
tedarikciler_id CHAR(4),
tedarikciler_ismi VARCHAR(20),
tedarikci_adres VARCHAR(100),
ulasim_tarihi DATE
);
SElEct tedarikciler_id, tedarikciler_ismi From tedarikciler;
/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/
-- ogrenciler1 tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.

create table ogrenci_derece
as
select isim, not_ortalamasi
from ogrenciler1;

select * from ogrenci_derece;

/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/
create table tedarikciler_son
as
select tedarikciler_ismi, ulasim_tarihi
from tedarikciler;
select * from tedarikciler_son;





