/*========================================
        VERI GIRISI - INSERT 
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/



create table fen_lisesi(
okul_no int unique,
isim varchar(20) not null,
derece double,
adres varchar(20),
son_degisiklik_tarihi date
);
select * from fen_lisesi;

-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder, 
-- diger kayitlarda duplicate hatasi verir.

insert into fen_lisesi values (101,'Ertugrul Kececi',5.0, 'Hollanda','2023-09-06');
insert into fen_lisesi values (102,'Arif Emre Comert',4.5, 'Nigde','2023-09-06');
insert into fen_lisesi values (103,'Resul Acar',4.3, 'Istanbul','2023-09-06');
insert into fen_lisesi values (104,'Gulay Gumus',4.8, 'Ankara','2023-09-06');
insert into fen_lisesi values (105,'Hilal Ciftci',4.9, 'Istanbul','2023-09-06');
insert into fen_lisesi values (106,'Yusuf Ihsan Esen',5.0, 'Leeds','2023-09-06');
insert into fen_lisesi values (107,'Mertkan Seferoglu',4.3, 'Istanbul','2023-09-06');
insert into fen_lisesi values (108,null,4.3, 'Istanbul','2023-09-06'); -- isim degeri null olamaz.
insert into fen_lisesi values (108,'Ramazan Tarhana', 2.8, null,'2023-09-06'); 
insert into fen_lisesi values (109,'Halil Gunes', null, 'Kahramanmaras','2023-09-06');
insert into fen_lisesi values (null,'Samet Ari', 4.5, 'Ankara','2023-09-06');
insert into fen_lisesi values (null,'Samet Ari', 4.5, 'Ankara','2023-09-06');

/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak.
------------------------------------------------- */

create table anadolu_lisesi(
okul_no char(5) unique,
isim varchar(20) not null,
adres varchar(50),
derece double
);

select * from anadolu_lisesi;

INSERT INTO anadolu_lisesi VALUES ('101','Esat Fatih','Ankara',4.7);
INSERT INTO anadolu_lisesi VALUES ('102','Yusuf Rahman','Ankara',4.8);
INSERT INTO anadolu_lisesi VALUES ('103','Sevda Bagci','Istanbul',3.5);
INSERT INTO anadolu_lisesi VALUES ('104','Muhammet Ozyon','Ankara',4.3);
INSERT INTO anadolu_lisesi VALUES ('105','Saida Aliyeva','Ankara',4.1);
INSERT INTO anadolu_lisesi VALUES ('106','Cemil Cetin','Mardin',4.9);
INSERT INTO anadolu_lisesi VALUES ('','Mustafa Anar','Erzurum',4.6);
INSERT INTO anadolu_lisesi VALUES ('','Bugra Kagan','Kayseri',4.6);-- bunu kaydetmez duplicate hatsi verir. 
insert into anadolu_lisesi (okul_no, isim) values ('107', 'Bugra Kagan');
insert into anadolu_lisesi (isim,derece, okul_no) values ('Tugba Akgun','4.7','108');
insert into anadolu_lisesi (derece, okul_no) values ('4.7','108');-- not null olarak belirttigmiz icin kayit etmez


