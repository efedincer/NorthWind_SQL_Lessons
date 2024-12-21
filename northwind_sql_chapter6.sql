--Ders 41
Select C.CategoryName, P.ProductName, SUM(P.UnitsInStock) From Categories C
Inner Join Products P
On C.CategoryID = P.CategoryID
Order By C.CategoryName
Go
-----------yukarıdaki hatalı/eksik----------------------
Select C.CategoryName, SUM(P.UnitsInStock) From Categories C
Inner Join Products P
On C.CategoryID = P.CategoryID
Group By C.CategoryName
Order By C.CategoryName
Go
----------------------------------------------------------
Select CONCAT(E.FirstName, SPACE(1), E.LastName) CalisanAdSoyad
,O.OrderID Siparis
,C.CompanyName Unvan
From Orders O
Join Customers C On O.CustomerID = C.CustomerID
Join Employees E On O.EmployeeID = E.EmployeeID
Go
----------------------------------------------------------
Select OD.OrderID,
ROUND( SUM( (1-OD.Discount) * (OD.UnitPrice * OD.Quantity) ), 2 ) As ToplamFiyat
From [Order Details] As OD
Group By OD.OrderID
Order By OD.OrderID
Go
----------------------------------------------------------
Select OD.ProductID,
P.ProductName,
Format(
ROUND( SUM( (1-OD.Discount) * (OD.UnitPrice * OD.Quantity) ), 2 ),
'C', 'en-US'
)
As ToplamFiyat
From [Order Details] OD
JOIN Products P On OD.ProductID = P.ProductID
Group By OD.ProductID, P.ProductName
Order By ToplamFiyat DESC
Go
------------------------------------------------
--DML
--Insert
/*

	Insert TabloAdı(Sütun1, Sütun2) Values 
	(Sütun1içinDeğer, Sütun2içinDeğer),
	(Sütun1içinBaşkaDeğer, Sütun2içinBaşkaDeğer)

*/
INSERT INTO Categories(CategoryName, Description)
VALUES ('Hobi', 'Puzzle vb ürünler')
GO
---------------------------------------------------
Declare @CatName NvarChar(15)
Set @CatName = 'Müzik Aletleri'
if Not Exists (Select CategoryName From Categories Where CategoryName = @CatName)
	Insert Into Categories (CategoryName) Values (@CatName)
else
	Select CategoryID, CategoryName, Description
	From Categories
	Where CategoryName = @CatName
go
-----------------------------------------------------
Select S.ShipperID, S.CompanyName, S.Phone From Shippers S
Go
----------------------------------------------
Insert Into Shippers
Values ('Yeni Bir Kargo', '053212345670532123456798')
Go
----------------------------------------------
Select * From Employees
Go
----------------------------------------------
Insert Into Employees (FirstName, LastName)
Values
('Nezihe', 'Tekin'),
('Emre', 'Okuducu'),
('Efekan', 'Özkan'),
('Mehmet Ali', 'Tığlı'),
('Mazhar', 'Kartal'),
('Kayra', 'Göğebakan'),
('İbrahim', 'Esen'),
('Emrah', 'Türer')
Go
--------------------------------------------------
--Update
/*

	Update TabloAdı Set (GüncellenecekKolon = YeniDeğer) Where 

*/
Select EmployeeID, FirstName, LastName, BirthDate
From Employees Where BirthDate Is Null
Go
----------------------------------------------------
Declare @Tarih As Date, @ID As Int
Set @Tarih = '19860821'
Set @ID = 17

UPDATE Employees Set BirthDate = @Tarih Where EmployeeID = @ID
Go
----------------------------------------------------
--Delete
--Delete From TabloAdi Where Koşul

Delete From Employees Where EmployeeID = 18
----------------------------------------------------
--Truncate Table TABLOADI
----------------------------------------------------
--Stored Procedure - derlenmiş sorgular - saklı yordamlar