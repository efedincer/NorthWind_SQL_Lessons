--Ders 37
/*
	KARŞILAŞTIRMA OPERATÖRLERİ
	(Tipleri aynı olan 2 veriyi karşılaştırmak için kullanılır)

	=	eşit mi
	!=	eşit değil dimi
	<>	eşit değil dimi
	>	büyük mü
	<	küçük mü
	>= büyük eşit mi ( > or = )
	<= küçük eşit mi ( < or = )

	**NULL -> HİÇLİK (boşluk değildir)
	**boşluk da bir karakterdir

*/

--Is Null -> null mı kontrolü
Select C.CompanyName, C.Region
From Customers C
Where C.Region Is Null
--------------------------------
--IsNull fonksiyonu
Select C.CompanyName as [Şirket Adı]
	,ISNULL(C.Region, '(yok)') as [Bölge]
From Customers C
----------------------------------------------
--convert
Select E.FirstName + ' ' + E.LastName AdSoyad
	,CONVERT(varchar(10), E.BirthDate, 104) DogumTarihi
From Employees E
Order By E.FirstName Asc, E.LastName Asc
----------------------------------------------
--top örneği 1
Select Top 3 P.ProductName, P.UnitPrice
From Products P
Order By P.UnitPrice
----------------------------------------------
--top örneği 2 (aynı) - yine artan sırada
Select Top 3 P.ProductName, P.UnitPrice
From Products P
Order By P.UnitPrice Asc
----------------------------------------------
--top örneği 3 - azalan
Select Top 3 P.ProductName, P.UnitPrice
From Products P
Order By P.UnitPrice Desc
----------------------------------------------
--with ties => top ile kullanılır, eğer listelenen son elemanın değeri ile
--eşleşen başka kayıtlar varsa, bu kayıtları da listeye dahil et
Select Top 12 With Ties P.ProductName UrunAdi, P.UnitPrice Fiyat
From Products P
Order By P.UnitPrice Asc
-----------------------------------------------
--değişken
Declare @Metin nvarchar(50)
Go
Declare @Metin nvarchar(40)
Go
-------------------------------------------
Declare @Metin nvarchar(50)
Set @Metin = 'bu bir yazıdır ama trimlenmelidir'
Print @Metin;
Go
-------------------------------------------
--değişken
Declare @Metin nvarchar(50)
Set @Metin = '		efe@hotmail.com'
Select @Metin;

--lefttrim örneği
Declare @Metin2 nvarchar(50)
Set @Metin2 = '		efe@hotmail.com'
Select LTRIM(@Metin2) Trimli;

--righttrim + lefttrim örneği
Declare @Metin3 nvarchar(50)
Set @Metin3 = '		efe@hotmail.com      '
Select RTRIM(LTRIM(@Metin3)) [RL Trimli];
--------------------------------
--Convert(hangiTipeÇevrilecek,ÇevrilecekVeri)
Select CONVERT(varchar(1), C.CategoryID) + SPACE(1) + C.CategoryName Kategori
From Categories C
----------------------------------
Select
RIGHT(REPLICATE(0,2)+CONVERT(varchar(2), C.CategoryID),2)
+ ':' + SPACE(1) + C.CategoryName Kategori
From Categories C
Order By C.CategoryID
-------------------------------------------------------

Select E.FirstName + ' ' + E.LastName AdSoyad
	,CONVERT(varchar(11), E.BirthDate, 100) DogumTarihi
From Employees E
Order By E.FirstName Asc, E.LastName Asc

/*
	d => gün
	m => ay
	y => yıl
	Mon => yazısal olarak ay bilgisinin ilk 3 hanesi Jan veya Mar
	h	=> saat
	mi	=> dakika
	s	=> saniye

	100	mon dd yyyy			Default
	101	mm/dd/yyyy			USA
	102	yy.mm.dd			ANSI
	103	dd/mm/yy			British/French
	104	dd.mm.yy			Türkiye/German
	105	dd-mm-yy			Italian
	106 dd mon yy
	107 Mon dd, yy
	108 hh:mm:ss
	109	mon dd yy hh:mi:ss:mmmAM (or PM)		Default+millisec
	110 mm-dd-yy			USA
	111	yy/mm/dd			Japan
	112	yymmdd				ISO
	113 dd mon yyyy hh:mi:ss:mmm (24h)
	114 hh:mi:ss:mmm (24h)
	120 yyyy-mm-dd hh:mi:ss (24h)
	121 yyyy-mm-dd hh:mi:ss.mmm (24h)
	126 yyyy-mm-dd hh:mi:ss.mmm (no spaces) ISO8601
	130 dd mon yyyy hh:mi:ss:mmmAM		Hicri/Hijiri
	131	dd/mm/yy hh:mi:ss:mmmAM		Hicri/Hijiri
*/

Select E.FirstName + ' ' + E.LastName AdSoyad
	,CONVERT(varchar(50), E.BirthDate, 126) DogumTarihi
From Employees E
Order By E.FirstName Asc, E.LastName Asc

------------------------------------------------------------
Select Top 3 E.FirstName + ' ' + E.LastName AdSoyad
,CONVERT(varchar, E.BirthDate, 105) DogumTarihi
From Employees E
Order By E.FirstName
-------------------------------------------------------------
--try convert çevirmeyi dener, çevrilebilir bir değerse çevirir
SET DateFormat dmy
Select TRY_CONVERT(date, '25/06/2023') as Sonuc

--try convert çeviremez ise NULL döner
SET DateFormat dmy
Select TRY_CONVERT(date, '25/06/2023') as Sonuc
---------------------------------------------------------------
--CAST (çevrilecekVeri AS Tipi)
Select E.FirstName + ' ' + E.LastName + ' ' +
CAST(Year(E.BirthDate) as nvarchar(4)) + ' doğumludur'
AS CalisanlarinDogumYillari
From Employees E
Order By E.BirthDate
--------------------------------------------------------------
--Parse
Select PARSE('04-22-2022' as date USING 'tr-TR') as Sonuc
Select PARSE('22/04/2022' as date USING 'tr-TR') as Sonuc
Select PARSE('22-04-2022' as date USING 'tr-TR') as Sonuc
Select PARSE('22.04.2022' as date USING 'tr-TR') as Sonuc
Select PARSE('22-04/2022' as date USING 'tr-TR') as Sonuc

--------------------------------------------------------------
--Try Parse
Select TRY_PARSE('22.05.2022' as date USING 'tr-TR') Sonuc
Select TRY_PARSE('22.15.2022' as date USING 'tr-TR') Sonuc
--------------------------------------------------------------
--VeriTipleri: Sayısal, Metinsel, Mantıksal, Var, DateTime

--TSQL
	--DML	=> SELECT, UPDATE, DELETE, INSERT
	--DDL	=> CREATE TABLE, ALTER TABLE, DROP TABLE, CREATE INDEX
	--DCL	=> Grant, Deny, Revoke