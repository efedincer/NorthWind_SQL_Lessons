--Ders 38
Select Top 10 Percent P.ProductName, P.UnitPrice
From Products P
Order By P.UnitPrice Desc
----------------------------------------
--SQL Fonksiyonları

--Date Functions

--DateDiff => Date Difference, 2 tarih arasındaki farkı verir
--DateDiff(kısaltma, başlangıç tarihi, bitiş tarihi)

Select E.FirstName + ' ' + E.LastName As AdSoyad
,DATEDIFF(YY, E.BirthDate, GETDATE()) As Yil
,DATEDIFF(MM, E.BirthDate, GETDATE()) As Ay
,DATEDIFF(DD, E.BirthDate, GETDATE()) As Gun
From Employees E

Select E.FirstName + ' ' + E.LastName As AdSoyad, E.BirthDate
--,DATEDIFF(YY, E.BirthDate, GETDATE()) As Yil
From Employees E
/*
	year		yy, yyyy
	quarter		qq, q
	month		mm, m
	dayofyear	dy, y
	day			dd, d
	week		wk, ww
	hour		hh
	minute		mi, n
	second		ss, s
	millisecond ms
	microsecond mcs
	nanosecond	ns
*/

--GetDate()
Select GETDATE() GununTarihi

--DatePart

/* kısaltmaları

	weekday		dw, w
	TZoffset	tz
	ISO_WEEK	isowk, isoww

*/
Select O.CustomerID, O.EmployeeID,
DATEPART(YYYY, O.OrderDate) As SiparisYil,
DATEPART(MM, O.OrderDate) As SiparisAy,
DATEPART(DD, O.OrderDate) As SiparisGun,
DATEPART(QQ, O.OrderDate) As Quarters
From Orders O
Order By O.EmployeeID
------------------------------------
--DateAdd(yy,10,tarih)
Select O.OrderID, O.OrderDate,
DATEADD(YY, 15, OrderDate) As xYilSonra
From Orders O
------------------------------------
Declare @Gun int, @Yas as Date
Set @Gun = DATEDIFF(DD, '2000.12.10', '1900.01.01')
--Select @Gun
Set @Yas = DATEADD(dy, @Gun, GETDATE())
--Select @Yas
Select DATEPART(YY, @Yas)-1900 As Yil,
DATEPART(MM, @Yas)-1 as Ay,
DATEPART(DD, @Yas)-1 as Gun
-----------------------------------
--DateName
SELECT DATENAME(YY,GETDATE()) AS YIL
	, DATENAME(MM,GETDATE()) AS AY
	, DATENAME(DD,GETDATE()) AS GUN
	, DATENAME(W,GETDATE()) AS GUNADI
------------------------------------
--Day()
Print DAY(GETDATE())

--Month()
Print MONTH(getdate())

--Year()
Print YEAR(GETDATE())

--DATEFROMPARTS()
select DATEFROMPARTS(2024, 2, 29)

--DATETIMEFROMPART()
select DATETIMEFROMPARTS(2024, 2, 29, 21, 15, 10, 0)

--SMALLDATETIMEFROMPARTS
select SMALLDATETIMEFROMPARTS(2024, 2, 29, 21, 15)

--TimeFromParts
Select TIMEFROMPARTS(21,19,45,500,3)

--sysdatetime
Select SYSDATETIME() SysDateTimes, GETDATE() GetDates

--GetUtcDate
Select GETUTCDATE() GetUTCDates, GETDATE() GetDates

--@@DateFirst()
Select @@DATEFIRST As 'İlk Gün'

SET LANGUAGE Turkish;
Select @@DATEFIRST As 'İlk Gün'
	, DATEPART(DW, GETDATE()) As 'Bugün'

--Current_TimeStamp
Select SYSDATETIME(), CURRENT_TIMESTAMP, GETDATE()

--EOMONTH
Select EOMONTH('20241210')

Select EOMONTH('10.12.2024')

Set DateFormat DMY
Select EOMONTH('10.12.2024')
----------------------------
--SysDateTimeOffSet
Select SYSDATETIMEOFFSET() UTC,
SWITCHOFFSET(SYSDATETIMEOFFSET(),'+01:30') GMT,
GETDATE() Tarih, GETUTCDATE() Universal
----------------------------
--IsDate
Select ISDATE('04.06.2024 20,58')
	, ISDATE('04.06.2024 20.58')
	, ISDATE('04.06.2024 20:58')

-------------------------------------
Set DateFormat DMY
Select DATEDIFF(DAY, '04.06.2024', '04.07.2024')
----------------------------------------------------
--Kümeleme Fonksiyonları (Aggregate Functions)

--AVG
Select AVG(DATEDIFF(YEAR, BirthDate, GETDATE()))
From Employees

--COUNT
Select COUNT(O.OrderID)
From Orders O

Select COUNT(O.ShipRegion)
From Orders O
-------------------------------
Select COUNT(O.OrderID) SiparisAdedi
From Orders O
Where O.OrderDate Between '01.07.1996' and '01.04.1997'