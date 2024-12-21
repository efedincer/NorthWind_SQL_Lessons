SELECT *
FROM Categories
WHERE CategoryID > 4

---------------------------

SELECT TOP (1000) [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
  FROM [NorthWind].[dbo].[Products]
  WHERE UnitPrice > 30

  ------------------------------------

  SELECT TOP (1000) [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
  FROM [NorthWind].[dbo].[Products]
  WHERE UnitPrice Between 30 and 50
  ----------------------------------------------------
  Select Top (8) * From Products
  -------------------------------

Select E.FirstName As Ad, E.LastName As Soyad
From Employees E
---------------------------------------

Select E.FirstName + ' ' + E.LastName As [Adı Soyadı]
From Employees E
---------------------------------------
Select E.FirstName + ' ' + E.LastName as [Adı Soyadı]
	, E.BirthDate as [Doğum Tarihi]
	, YEAR(GETDATE()) - YEAR(E.BirthDate) as Yaş
	, E.Country as Ülke
From Employees E
Where YEAR(GETDATE()) - YEAR(E.BirthDate) > 80

----------------------------------

--Distinct
Select Distinct City From Employees
Select Distinct Country From Employees
---------------------------------------
Select E.FirstName + ' ' + E.LastName as [Adı Soyadı]
	,E.BirthDate as [Doğum Tarihi]
	--,E.Country as Ülke
From Employees E
Where YEAR(E.BirthDate) Between 1930 and 1960
And E.Country = 'USA'
---------------------------------------------
--or bağlacı ile koşul
Select P.ProductID, P.ProductName as [Ürün Adı]
	,P.UnitPrice as [Birim Fiyatı]
From Products P
Where P.UnitPrice = 18 or P.UnitPrice = 19 or P.UnitPrice = 25
----------------------------------------------
--sıralama 1 (default - artan sırada - yükselen ucuzdan pahalıya Ascending)
Select P.ProductName as [Ürün Adı]
	,P.UnitPrice as [Birim Fiyatı]
From Products P
Where P.UnitPrice = 18 or P.UnitPrice = 19 or P.UnitPrice = 25
Order By P.UnitPrice
---------------------------------------
--sıralama 2 (asc - artan)
Select P.ProductName as [Ürün Adı]
	,P.UnitPrice as [Birim Fiyatı]
From Products P
Where P.UnitPrice = 18 or P.UnitPrice = 19 or P.UnitPrice = 25
Order By P.UnitPrice Asc
---------------------------------------
--sıralama 3 (desc - azalan - büyükten küçüğe - descending)
Select P.ProductName as [Ürün Adı]
	,P.UnitPrice as [Birim Fiyatı]
From Products P
Where P.UnitPrice = 18 or P.UnitPrice = 19 or P.UnitPrice = 25
Order By P.UnitPrice Desc
--------------------------------------------------------
--ard arda sıralama
Select P.ProductName as [Ürün Adı]
	,P.UnitPrice as [Birim Fiyatı]
From Products P
Where P.UnitPrice = 18 or P.UnitPrice = 19 or P.UnitPrice = 25
Order By P.UnitPrice Asc, P.ProductName Asc
--------------------------------------------------------
--IN
Select P.ProductName as [Ürün Adı]
	,P.UnitPrice as [Birim Fiyatı]
From Products P
Where P.UnitPrice IN(18,19,25)
Order By P.UnitPrice Asc, P.ProductName Asc
--------------------------------------------------------
--Like
/*

	_
	[A-C]
	[0-9]
	[]
	[^]
	%
	+
*/
-------------------------
Select P.ProductName as [Ürün Adı]
	,P.QuantityPerUnit [Ambalaj]
From Products P
Where P.QuantityPerUnit Like '%boxes%'
----------------------------------------
--not like
Select P.ProductName as [Ürün Adı]
	,P.QuantityPerUnit [Ambalaj]
From Products P
Where P.QuantityPerUnit Not Like '%boxes%'

Select P.ProductName as [Ürün Adı]
	,P.QuantityPerUnit [Ambalaj]
From Products P
Where P.QuantityPerUnit Not Like '%box%'
And P.ProductName != 'Ikura'
----------------------------------------------

Select E.FirstName
	,E.LastName
From Employees E
Where E.FirstName Like '[A-J]%'
Order By E.FirstName
----------------------------------------------
Select E.FirstName + SPACE(20) + E.LastName AS [Ad Soyad]
From Employees E
---------------------------------------------