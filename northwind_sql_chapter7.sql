--Ders 42
--Stored Procedures
Create Procedure [dbo].pr_OrderDisc As
Select OD.OrderID,
ROUND( SUM( (1-OD.Discount) * (OD.Quantity * OD.UnitPrice) ), 2 ) Indirimli
From [Order Details] OD
Group By OD.OrderID
Order By Indirimli Desc
Go
Exec pr_OrderDisc
--------------------------------------------------------
Go
Create Proc pr_CatProd @CatName Nvarchar(15)
As
Select C.CategoryName, P.ProductName
From Categories C
Join Products P ON C.CategoryID = P.CategoryID
Where C.CategoryName = @CatName
Order By C.CategoryID, P.CategoryID
-----------------------------------------------------
Exec pr_CatProd @CatName = 'Beverages'
Exec pr_CatProd @CatName = 'produc'
-----------------------------------------------------
Go
Alter Proc pr_CatProd @CatName Nvarchar(15)
As
Select C.CategoryName, P.ProductName
From Categories C
Join Products P ON C.CategoryID = P.CategoryID
Where C.CategoryName Like '%' + @CatName + '%'
Order By C.CategoryID, P.CategoryID
-----------------------------------------------------
Exec pr_CatProd @CatName = 'Con'
-----------------------------------------------------
Go
Create Proc pr_Topla
@Sayi1 int, @Sayi2 int, @Sayi3 int
As
Return @Sayi1 + @Sayi2 + @Sayi3
-------------------------------------------------
Declare @Sonuc int
Exec @Sonuc = pr_Topla '10', '20', 40
Select @Sonuc Toplam
-------------------------------------------------
Go
Create Proc pr_EmpInsert @EmpName NvarChar(10), @EmpLastName NvarChar(20), @EmpBirthDate DateTime
As
if Not Exists
(Select E.FirstName, E.LastName, E.BirthDate From Employees E
Where E.FirstName = @EmpName AND
E.LastName = @EmpLastName AND
E.BirthDate = @EmpBirthDate)
	Insert Into Employees
	(FirstName, LastName, BirthDate)
	Values
	(@EmpName, @EmpLastName, @EmpBirthDate)
else
	Print 'Bu personel zaten kay tl '
Select E.FirstName, E.LastName, E.BirthDate From Employees E
Where E.FirstName = @EmpName AND
E.LastName = @EmpLastName AND
E.BirthDate = @EmpBirthDate
Go
-------------------------------------------------------------------------------
Select * From Employees

Exec pr_EmpInsert 'Nancy', 'Davolio', '19481208'

Exec pr_EmpInsert 'Efe', 'Dincer', '19481208'
-------------------------------------------------------------------------------
Go
Alter Proc pr_CatInsert @CatName NvarChar(15) As
Declare @CatID int
if Not Exists (Select CategoryName From Categories C Where CategoryName = @CatName)
	Begin
		Insert Into Categories (CategoryName) Values (@CatName)
		Set @CatID = SCOPE_IDENTITY()
	End
Else
	Begin
		Select @CatID = CategoryID From Categories Where CategoryName = @CatName
		Print 'Bu kategori zaten var'
	End

Select C.CategoryID, C.CategoryName From Categories C Where C.CategoryName = @CatName

Return @CatID
--------------------------------------------------------------
Go
Declare @CatID int
Exec @CatID = pr_CatInsert 'Temizlik'
Print @CatID
GO
--------------------------------------------------------------
--update prosed r 
create procedure sp_Employees_Update
(
	@FirstName nvarchar(10),
	@LastName nvarchar(20),
	@BirthDate datetime,
	@City nvarchar(15),
	@EmployeeID int
)
as
update Employees
set
FirstName = @FirstName,
LastName = @LastName,
BirthDate = @BirthDate,
City = @City
where EmployeeID = @EmployeeID
Go
----------------------------------------------------
exec sp_Employees_Update 'Ali', 'Veli', '2000/02/12', ' stanbul', 19
----------------------------------------------------
Go
--delete prosed r 
Create Procedure sp_Employees_Delete
(
@EmployeeID int
)
as
delete from Employees where EmployeeID = @EmployeeID
------------------------------------------------
exec sp_Employees_Delete 19
------------------------------------------------
Go
--select prosed r 
create procedure sp_Employees_Select
(
@TitleOfCourtesy nvarchar(25)
)
as
Select * From Employees Where TitleOfCourtesy = @TitleOfCourtesy
---------------------------------------
exec sp_Employees_Select 'Mr.'
------------------------------------------
go
create procedure sp_Product_Like
(
	@ProductName nvarchar(40)
)
as
select *
from Products
where ProductName Like '%' + @ProductName + '%'

exec sp_Product_Like 'sir'