--1
SELECT e.EmployeeID, (e.LastName + '  '+  e.FirstName) as 'EmpployeeName',e.HomePhone, DATEDIFF(year, e.BirthDate, GetDate() ) as 'Age'
FROM Employees e

--2
SELECT e.EmployeeID, e.LastName, e.FirstName, e.TitleOfCourtesy, e.BirthDate, e.HireDate, e.Address, e.City, e.Region, e.PostalCode, e.Country
FROM Employees e
WHERE year(e.BirthDate) <=1960

--3
SELECT p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.ReorderLevel, p.Discontinued
FROM Products p
WHERE p.QuantityPerUnit like ('%Boxes%')

--4
SELECT p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
FROM Products p
WHERE p.UnitPrice > 10 and p.UnitPrice < 15

--5
SELECT *
FROM Orders o
WHERE MONTH(o.OrderDate)=9 AND YEAR(o.OrderDate)=1996

--6

SELECT p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock, (p.UnitPrice*p.UnitsInStock) AS 'TotalAccount'
FROM Products p

--7

SELECT TOP 5 *
FROM Customers c
WHERE c.City LIKE 'M%'

--8

SELECT TOP 2 e.EmployeeID, (e.LastName+' '+e.FirstName) AS 'EmployeeName', DATEDIFF(year, e.BirthDate, GetDate() ) as 'Age'
FROM Employees e
ORDER BY e.BirthDate ASC

--9

SELECT DISTINCT p.ProductID, p.ProductName, p.UnitPrice
FROM Products p
INNER JOIN [Order Details] o ON p.ProductID = o.ProductID; 

SELECT *
FROM Products p
LEFT JOIN [Order Details] o ON p.ProductID = o.ProductID; 

--10
with t as(
select o.CustomerID, count(o.OrderID) as 'number order'
from [Orders] o
group by o.CustomerID)

select c.*
from t
left outer join Customers c
on c.CustomerID = t.CustomerID
where t.[number order]=0

--11
with t as(
select o.CustomerID, o.OrderDate, count(o.OrderID) as 'number order'
from [Orders] o
group by o.CustomerID, o.OrderDate)

select c.*
from t
left outer join Customers c
on c.CustomerID = t.CustomerID
where t.[number order]=0 and month(t.OrderDate)=7 and year(t.OrderDate) = 1997

--12
with t as(
select o.CustomerID, o.OrderDate, count(o.OrderID) as 'number order'
from [Orders] o
group by o.CustomerID, o.OrderDate)
select c.*
from t
left outer join Customers c
on c.CustomerID = t.CustomerID
where t.[number order]=0 and month(t.OrderDate)=7 and year(t.OrderDate) = 1997 and day(t.OrderDate)>=1 and day(t.OrderDate)<=15

--13
select p.ProductName, c.CategoryName, p.UnitPrice
from Products p
left outer join Categories c
on p.CategoryID = c.CategoryID

--14
with t as(
select c.City
from Customers c
union all
select e.City
from Employees e)
select distinct t.*
from t

--15
with t as(
select c.Country
from Customers c
union all
select e.Country
from Employees e
)
select distinct t.*
from t

--16
select convert(nvarchar, e.EmployeeID) as 'CodeID', e.LastName + e.FirstName as 'Name', e.Address, e.HomePhone as 'Phong'
from Employees e
union all
select c.CustomerID as 'CodeID', c.CompanyName as 'Name', c.Address, c.Phone
from Customers c


--đêm số employee, tên cuối cùng trong bảng chữ cái.
select count(e.employeeID), max(e.FirstName)
from Employees e

--Tìm product đắt nhất
select p.*
from Products p
where p.Unitprice >= all(
select p.UnitPrice
from Products p)
--hoặc
select p1.*
from Products p1
where not exists
	(select p2.*
	from Products p2
	where p2.UnitPrice>p1.UnitPrice
	)

-- Check
if exists (select * from Products where UnitPrice >=500)
begin 
	print '....'
end
else
begin
	print 'not found'
END

--tìm những nhân viên không theo tôn giáo
select e.*
from Employees e
where e.Region is NULL

--số order đc thực hiện bởi mỗi nhân viên
SELECT o.EmployeeID, o.CustomerID, COUNT(o.OrderID) AS 'NumOfOrder'
FROM dbo.Orders o
GROUP BY o.EmployeeID, o.CustomerID
ORDER BY COUNT(o.OrderID) DESC

select o.EmployeeID, count(o.OrderID) 'NumOfOrder', o.OrderDate
from Orders o
where YEAR(o.OrderDate)=1997
group by o.EmployeeID, o.OrderDate
having count(o.orderID)<=100
order by count(o.orderID) DESC

with t as(
select o.CustomerID , count(o.OrderID) 'NumOfOrder'
from Orders o
group by o.CustomerID)
select t.*
from t
where t.[NumOfOrder] = (
select Max(t.[NumOfOrder]) from t)
order by t.[NumOfOrder]


