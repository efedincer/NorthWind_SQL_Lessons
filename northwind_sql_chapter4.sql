--Ders 39
Select COUNT(O.OrderID) SiparisAdedi, O.EmployeeID
From Orders O
Group By O.EmployeeID

Select COUNT(OrderID) From Orders
------------------------------------------------
Select O.EmployeeID, COUNT(O.OrderID) SiparisAdedi 
From Orders O
Group By O.EmployeeID
Union All
Select Null, COUNT(OrderID) From Orders
------------------------------------------------
--SUM
Select SUM(OD.UnitPrice * OD.Quantity) SiparisToplamTutar
From [Order Details] OD
-------------------------------------------------

--MAX-MIN
Select MAX(DATEDIFF(YEAR, BirthDate, GETDATE())) as BuyukYas,
MIN(DATEDIFF(YEAR, BirthDate, GETDATE())) as KucukYas
From Employees
--------------------------------------------
--SCALAR FUNCTIONS
--String Fonksiyonları
--Upper
--Lower

Select FirstName, UPPER(LastName) LastName From Employees

----------------------------------------------------
--Substring
Select SUBSTRING('Efe Dincer', 2, 2)
----------------------------------------------------
Select S.CompanyName
	, S.Phone
	, SUBSTRING(S.Phone, 1, 5) AlanKodu
	, SUBSTRING(S.Phone, 7, 8) TelefonNo
From Shippers S
-----------------------------------------------
Select S.CompanyName
	, S.Phone
	, SUBSTRING(S.Phone, 1, 5) AlanKodu
	, SUBSTRING(S.Phone, 7, LEN(S.Phone)) TelefonNo
From Shippers S
----------------------------------------------
Declare @AlanKodLen int = 5
Select S.CompanyName
	, S.Phone
	, SUBSTRING(S.Phone, 1, @AlanKodLen) AlanKodu
	, SUBSTRING(S.Phone, @AlanKodLen+2, LEN(S.Phone)-@AlanKodLen-1) TelefonNo
From Shippers S

--(503) 555-9831
---------------------------------------
Select LEN('Efe Dincer')
---------------------------------------
--Round
Select ROUND(23.146, 1) --23.100
Select ROUND(23.146, 2) --23.150
Select ROUND(23.1469, 3) --23.1470

-- 17.000,50
-- 17,000.50
--------------------------------------------
--ASCII
Select ASCII('A') --65 DÖNER
Select ASCII('B')
Select ASCII('C')
Select ASCII('D')
Select ASCII('E')

Select ASCII('a') --97 döner

Select UNICODE('Ğ')
Select ASCII('Ğ')

Select UNICODE(' ') --32 space

Select UNICODE('
')					--13 enter

Select UNICODE('	') --9 tab

--CHAR
Select CHAR(99) -- c harfi

/*
	65: A
	66: B
	67: C
	-
	-
	-
	-
	97: a
	98: b
	99: c
	-
	-
	-
	-
*/
--CHARINDEX
Select CHARINDEX('i', 'Efe Dincer', 1)

--Left-Right
Select LEFT('YazılımaOrg', 7) --Yazılıma
Select RIGHT('YazılımaOrg', 3) --Org

--RTRIM-LTRIM
Select RTRIM(LTRIM('    Yazılım    aOrg Kış Kampı    '))

--Replace
Select Distinct(REPLACE(Country, 'USA', 'ABD')) Country
From Employees
Order By Country

Select REPLACE(Country, 'USA', 'ABD') Country
From Employees
Order By Country

--Reverse
Select REVERSE('Bu Yazı Tersten Yazdırılacak')

--FORMAT
Select GETDATE()
Select FORMAT(GETDATE(), 'dd.M.yyyy', 'tr-TR') TarihFormat
SELECT FORMAT(GETDATE(), 'dd.mm.yyyy', 'en-US') AS TarihFormati;
Select FORMAT(123456789, '###,##') RakamFormati --123,456,789
Select FORMAT(123456789, 'N') NumberFormat --123,456,789.00
--10.000,50
--10,000.50

--CONCAT
Select CONCAT('Buradaki', 'Verileri', 'Birleştir', 55) ConcatOrnegi

Select CONCAT(FirstName, SPACE(1), LastName, BirthDate) From Employees
--------------------------------
--Replicate
Select ProductName, REPLICATE('-.', 10) + ProductName as UrunAdi
From Products

--------------------------------
--PATINDEX
Select FirstName, PATINDEX('%an%', FirstName) From Employees
--------------------------------

--Group By
Select O.CustomerID, SUM(O.Freight) Freight
From Orders O
Group By O.CustomerID
Order By SUM(O.Freight) Desc
-----
Select O.CustomerID, SUM(O.Freight) Freight
From Orders O
Group By O.CustomerID
Order By Freight Desc
--------------------------------------------------

Select OD.OrderID
	, ROUND(SUM((1-OD.Discount)*OD.Quantity*OD.UnitPrice), 2) IndirimliFiyat
From [Order Details] OD
Group By OD.OrderID
Order By IndirimliFiyat Desc

-----------------------------------------------------------
Select OD.OrderID
	, ROUND(SUM((1-OD.Discount)*OD.Quantity*OD.UnitPrice), 2) IndirimliFiyat
From [Order Details] OD
Group By OD.OrderID
Having ROUND(SUM((1-OD.Discount)*OD.Quantity*OD.UnitPrice), 2) > 12000
Order By IndirimliFiyat Desc
-----------------------------------------------------------
Select OD.OrderID
	, ROUND(SUM((1-OD.Discount)*OD.Quantity*OD.UnitPrice), 2) IndirimliFiyat
From [Order Details] OD
Group By OD.OrderID
Having OD.OrderID > 11000
Order By IndirimliFiyat Desc
-------------------------
Select OD.OrderID ID
	, ROUND(SUM((1-OD.Discount)*OD.Quantity*OD.UnitPrice), 2) IndirimliFiyat
From [Order Details] OD
Group By OD.OrderID
Having OD.OrderID > 11000
Order By ID Desc
-------------------------
Select OD.OrderID, SUM(OD.Quantity) Toplam
From [Order Details] OD
Group By OD.OrderID
Having SUM(OD.Quantity) > 250
Order By Toplam Desc
--------------------------
--STR
Declare @Sayi as Float
Set @Sayi = 123.123456789123
Select STR(@Sayi, 16, 8); --    123.12345679
Select STR(@Sayi, 16, 7); --     123.1234568