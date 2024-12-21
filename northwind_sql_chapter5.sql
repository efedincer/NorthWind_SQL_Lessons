--Ders 40
--Stuff
Select STUFF('Efe Dincer', 2, 4, 'efe') --Eefeincer
------------------------------------------------
--Set Statement
Set DateFirst 7
-----------------
Select * From Products
Set RowCount 6
Select * From Products
------------------
Set RowCount 0
--------------------------------
--DateFormat YMD
Set DateFormat DMY
Go
Declare @Tarih Date
Set @Tarih = '14.12.2024'
Select DATEADD(D, 7, @Tarih)
-----------------------------------
--Kullanıcı (Developer) Tanımlı Fonksiyonlar
--KDV Fonksiyonu
Declare @Oran float = 0.20
Select OD.OrderID, UnitPrice, UnitPrice*@Oran KDV
From [Order Details] OD
---------------------------------------------------
GO
Create Function fn_KDVHesabi(@Fiyat Money, @Oran Money) Returns Money
Begin
	Return @Fiyat * @Oran
End
GO
--------------------------------------------------
Select OD.OrderID, UnitPrice, dbo.fn_KDVHesabi(UnitPrice, 0.20) KDV
From [Order Details] OD
---------------------------------------------------
GO
--Tarihleri TR Formatında Gösteren Fonksiyon
Create Function fn_DMY(@Tarih Date) Returns varchar(10)
Begin
	Return Convert(varchar(10), @Tarih, 104)
End
----------------------------------------------------
GO
Select FirstName, LastName, dbo.fn_DMY(BirthDate) DogumTarihi From Employees
----------------------------------------------------
GO
--Ay adını döndüren fonk.
CREATE FUNCTION FN_AYADI (@AYNO AS INT) RETURNS VARCHAR(7)
BEGIN
	RETURN (CASE @AYNO
			WHEN 1 THEN 'Ocak'
			WHEN 2 THEN 'Şubat'
            WHEN 3 THEN 'Mart'
            WHEN 4 THEN 'Nisan'
            WHEN 5 THEN 'Mayıs'
            WHEN 6 THEN 'Haziran'
            WHEN 7 THEN 'Temmuz'
            WHEN 8 THEN 'Ağustos'
            WHEN 9 THEN 'Eylül'
            WHEN 10 THEN 'Ekim'
            WHEN 11 THEN 'Kasım'
            WHEN 12 THEN 'Aralık'
			END)
END
-------------------------------------------------------
GO
Select dbo.fn_AYADI(7)
------------------------------------------------------
--CASE WHEN THEN
/*

	Case X
		When 6
		then 'Haziran'
	End

*/

/*

	Case When X kontrol
		Then 'asdf'
	End

*/
--------------------------------------
Select C.CategoryName, C.Description,
Case C.CategoryName
	When 'a' Then 'b'
End
From Categories C
---------------------------------------
Select C.CategoryName, C.Description,
Case C.CategoryName
	When 'Beverages' Then 'İçecekler'
	When 'Condiments' Then 'Bal'
	When 'Confections' Then 'Şekerlemeler'
	When 'Dairy Products' Then 'Süt Ürünleri'
	When 'Grains/Cereals' Then 'Tahıllar'
	When 'Meat/Poultry' Then 'Et-Tavuk'
	When 'Produce' Then 'İmalat'
	When 'Seafood' Then 'Deniz Ürünleri'
End AS Kategori
From Categories C
--Order By C.CategoryName Desc
--------------------------------------------------------
Select P.ProductName, P.UnitPrice, P.UnitsInStock,
Case
	When P.UnitsInStock <= 25 Then 'Kritik Stok Seviyesi'
	When P.UnitsInStock Between 25 And 50 Then 'İdeal Stok Seviyesi'
	Else 'Kampanya Yapılmalı'
End StokDurumu
From Products P
--------------------------------------------------------
--If Exists
if Exists(Select ProductName From Products Where ProductName = 'Chai')
Begin
	Print 'Kayıt Bulundu'
End
------------------------------------------
if Exists(Select C.Country From Customers C Where C.Country = 'Germany')
Begin
	Select C.CompanyName, C.Country, C.Phone
	From Customers C Where C.Country = 'Germany'
End
---------------------------------------------------------------
--InnerJoin
Select P.ProductName, C.CategoryName From Products P
Inner Join Categories C On P.CategoryID = C.CategoryID
---------------------------------------------------------------
--left join
Select P.ProductName, C.CategoryName From Products P --sol
Left Join Categories C --sağ
On P.CategoryID = C.CategoryID
---------------------------------------------------------------
--right join
Select C.CategoryName, P.ProductName From Products P
Right Join Categories C On P.CategoryID = C.CategoryID
---------------------------------------------------------------
--Full Join
Select P.ProductName, C.CategoryName From Products P
Full Join Categories C On P.CategoryID = C.CategoryID
--------------------------------------------------------------
Select * From Categories C
Select * From Products P
------------------------------------------------------------
Select * From Categories C
Inner Join Products P
On C.CategoryID = P.CategoryID
-------------------------------------------
Select C.CategoryName, P.ProductName, P.UnitsInStock From Categories C
Inner Join Products P
On C.CategoryID = P.CategoryID
Order By C.CategoryName
---------------------------------------------