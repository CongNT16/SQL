--Exercise 1
SELECT lower(e.LastName + '  '+  e.FirstName) as 'FullName',e.TitleOfCourtesy FROM Employees e

--Exercise 2

SELECT upper(e.LastName + '  '+ e.FirstName) as 'FullName' FROM Employees e

--Exercise 3

SELECT e.EmployeeID , e.LastName, e.FirstName, e.Title, e.City, e.Country FROM Employees e

--Exercise 4

SELECT c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Country FROM Customers c where Country = 'UK'

--Exercise 5

SELECT c.CustomerID, c.CompanyName, c.[Address], c.City, c.Country  FROM Customers c where Country = 'Mexico'

--Exercise 6

SELECT c.CustomerID, c.CompanyName, c.Phone, c.[Address], c.City, c.Country FROM Customers c where Country = 'Sweden'

--Exercise 7

SELECT p.ProductID, p.ProductName, p.UnitPrice, p.UnitsInStock FROM Products p WHERE UnitsInStock between 5 and 10

--Exercise 8

SELECT p.ProductID, p.ProductName, p.UnitPrice, p.ReorderLevel, p.UnitsOnOrder FROM Products p WHERE UnitsOnOrder between 60 and 100 

--Exercise 9

SELECT e.EmployeeID, e.LastName, e.FirstName, e.Title, year(o.OrderDate) as [Year], COUNT(e.EmployeeID) AS 'TotalOrder'
FROM Employees e
LEFT OUTER JOIN Orders o
ON o.EmployeeID = e.EmployeeID
WHERE year(o.OrderDate) = 1996
GROUP BY e.EmployeeID, e.LastName, e.FirstName, e.Title, year(o.OrderDate)

-- Exersice 10

SELECT e.EmployeeID, e.LastName, e.FirstName, e.City, e.Country, COUNT(e.EmployeeID) AS 'TotalOrder'
FROM Employees e
LEFT OUTER JOIN Orders o
ON o.EmployeeID = e.EmployeeID
WHERE year(o.OrderDate) = 1996
GROUP BY e.EmployeeID, e.LastName, e.FirstName, e.City, e.Country

--Exersice 11

SELECT e.EmployeeID, e.LastName, e.FirstName, e.HireDate, COUNT(e.EmployeeID) AS 'TotalOrder'
FROM Employees e
LEFT OUTER JOIN Orders o
ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate BETWEEN '01/01/1998' AND '07/31/1998'
GROUP BY e.EmployeeID, e.LastName, e.FirstName, e.HireDate

--Exersice 12

SELECT e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone, COUNT(e.EmployeeID) AS 'TotalOrder'
FROM Employees e
LEFT OUTER JOIN Orders o
ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate BETWEEN '01/01/1997' AND '06/30/1997'
GROUP BY e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone

--Exersice 13

SELECT o.OrderID, Day(o.OrderDate) as 'OrderDay', Month(o.OrderDate) as 'OrderMonth', Year(o.OrderDate) as 'OrderYear', o.Freight,
CASE WHEN o.Freight >=100 THEN '10%' ELSE '5%' END AS 'tax',
CASE WHEN o.Freight >=100 THEN o.Freight*1.1 ELSE o.Freight*1.05 END AS 'Freight with tax'
FROM Orders o
WHERE o.OrderDate BETWEEN '8/1/1996' AND '8/5/1996'

--Exersice 14
 
SELECT (e.LastName + '  '+ e.FirstName) as 'FullName', e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy = 'Mr.' then 'Male' 
WHEN e.TitleOfCourtesy ='Ms.' OR e.TitleOfCourtesy='Mrs.' THEN 'Female' end as 'Sex'
FROM Employees e 
WHERE e.TitleOfCourtesy IN ('Mr.','Ms.', 'Mrs.')
ORDER BY Sex DESC

--Exersice 15

SELECT (e.LastName + '  '+ e.FirstName) as 'FullName', e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy = 'Mr.' or e.TitleOfCourtesy = 'Dr.' then 'M' 
WHEN e.TitleOfCourtesy ='Ms.' OR e.TitleOfCourtesy='Mrs.' THEN 'F' end as 'Sex'
FROM Employees e 
WHERE e.TitleOfCourtesy IN ('Mr.', 'Dr.','Ms.', 'Mrs.')
ORDER BY Sex DESC


SELECT e.LastName+' '+e.FirstName AS 'full name', e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy='Mr.' OR e.TitleOfCourtesy='Dr.' THEN 'M'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Mr.','Dr.')
UNION all
SELECT e.LastName+' '+e.FirstName AS 'full name', e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy='Ms.' OR e.TitleOfCourtesy= 'Mrs.' THEN 'F'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Ms.','Mrs.')

--Exersice 16

SELECT (e.LastName + '  '+ e.FirstName) as 'FullName', e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy = 'Mr.' then 'Male' 
WHEN e.TitleOfCourtesy ='Ms.' OR e.TitleOfCourtesy='Mrs.' THEN 'Female' 
else 'Unknown' end as 'Sex'
FROM Employees e 
ORDER BY Sex


SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy, 
CASE WHEN e.TitleOfCourtesy='Mr.' THEN 'Male'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Mr.')
UNION ALL
SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy='Mrs.' OR  e.TitleOfCourtesy='Ms.' THEN 'Female'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Mrs.','Ms.')
UNION ALL
SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy='Dr.' THEN 'Unknown'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Dr.')

--Exersicse 17

SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy, 
CASE WHEN e.TitleOfCourtesy='Mr.' THEN '1'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Mr.')
UNION ALL
SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy='Mrs.' OR  e.TitleOfCourtesy='Ms.' THEN '0'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Mrs.','Ms.')
UNION ALL
SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy!='Mr.' AND e.TitleOfCourtesy!='Ms.' AND e.TitleOfCourtesy!='Mrs.' THEN '2'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Dr.')

--Exersice 18

SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy, 
CASE WHEN e.TitleOfCourtesy='Mr.' THEN 'M'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Mr.')
UNION ALL
SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy='Mrs.' OR  e.TitleOfCourtesy='Ms.' THEN 'F'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Mrs.','Ms.')
UNION ALL
SELECT e.LastName+' '+e.FirstName, e.TitleOfCourtesy,
CASE WHEN e.TitleOfCourtesy!='Mr.' AND e.TitleOfCourtesy!='Ms.' AND e.TitleOfCourtesy!='Mrs.' THEN 'N/A'
END AS 'sex'
FROM dbo.Employees e
WHERE e.TitleOfCourtesy IN ('Dr.')

--Exersice 19
--Exersice 20

--Exersice 21

--21
SELECT p.CategoryID, c.CategoryName, p.ProductID, p.ProductName, DAY(o.OrderDate) AS 'day', MONTH(o.OrderDate) AS 'month', YEAR(o.OrderDate) AS 'year',
od.Quantity*od.UnitPrice AS 'Revenue'
FROM dbo.Products p, dbo.Categories c, dbo.[Order Details] od, dbo.Orders o
WHERE p.CategoryID=c.CategoryID AND p.ProductID = od.ProductID AND od.OrderID=o.OrderID AND o.OrderDate BETWEEN '7/1/1996' AND '7/5/1996'
ORDER BY c.CategoryID, p.ProductID

--22
SELECT e.EmployeeID, e.LastName, e.FirstName, o.OrderID, o.OrderDate, o.RequiredDate, o.ShippedDate
FROM dbo.Employees e
INNER JOIN dbo.Orders o
ON o.EmployeeID = e.EmployeeID
WHERE (o.ShippedDate-o.RequiredDate)>7
ORDER BY e.EmployeeID

--23
SELECT c.CompanyName, c.Phone
FROM dbo.Customers c
WHERE c.CompanyName LIKE 'W%'
UNION ALL
SELECT e.LastName +' '+e.FirstName, e.HomePhone
FROM dbo.Employees e

--24
SELECT c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle
FROM dbo.Orders o
LEFT OUTER JOIN dbo.Customers c
ON c.CustomerID = o.CustomerID
WHERE o.OrderID ='10643'

--25
WITH t AS (SELECT p.ProductID, p.ProductName, SUM(o.Quantity) AS 'Total ordered'
FROM dbo.Products p
LEFT OUTER JOIN dbo.[Order Details] o
ON o.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName)
SELECT t.*
FROM t
WHERE t.[Total ordered] >=1200

--26
WITH t AS(
SELECT p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, SUM(o.Quantity) AS 'Total ordered'
FROM dbo.Products p
LEFT OUTER JOIN dbo.[Order Details] o
ON o.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName, p.SupplierID, p.CategoryID)
SELECT t.*
FROM t
WHERE t.[Total ordered] >=1400
ORDER BY t.[Total ordered] DESC

--27 
WITH t AS(
SELECT p.CategoryID, COUNT(p.ProductID) AS 'total product'
FROM dbo.Products p
GROUP BY p.CategoryID)
SELECT c.CategoryID, c.CategoryName, t.[total product] AS 'total products'
FROM dbo.Categories c
LEFT OUTER JOIN t 
ON t.CategoryID = c.CategoryID
WHERE t.[total product] = (SELECT MAX(t.[total product]) FROM t)

--28
WITH t AS(
SELECT p.CategoryID, COUNT(p.ProductID) AS 'total products'
FROM dbo.Products p
GROUP BY p.CategoryID)
SELECT c.CategoryID, c.CategoryName, t.[total products]
FROM dbo.Categories c
LEFT OUTER JOIN t
ON t.CategoryID = c.CategoryID
WHERE t.[total products] = (SELECT MIN(t.[total products]) FROM t)

--29
SELECT COUNT(e.EmployeeID) + (SELECT COUNT(c.CustomerID) FROM dbo.Customers c)
FROM dbo.Employees e

--30
WITH t AS(
SELECT o.EmployeeID, COUNT(o.OrderID) AS 'total orders'
FROM dbo.Orders o
GROUP BY o.EmployeeID)
SELECT e.EmployeeID, e.LastName, e.FirstName, e.Title, t.[total orders]
FROM dbo.Employees e
LEFT OUTER JOIN t
ON t.EmployeeID = e.EmployeeID
WHERE t.[total orders] = (SELECT MIN(t.[total orders]) FROM t)

--31
WITH t AS(
SELECT o.EmployeeID, COUNT(o.OrderID) AS 'total orders'
FROM dbo.Orders o
GROUP BY o.EmployeeID
)
SELECT e.EmployeeID, e.LastName, e.FirstName, e.Title, t.[total orders]
FROM dbo.Employees e
LEFT OUTER JOIN t
ON t.EmployeeID = e.EmployeeID
WHERE t.[total orders] = (SELECT MAX(t.[total orders]) FROM t)

--32
SELECT p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, p.UnitsInStock
FROM dbo.Products p
WHERE p.UnitsInStock = (SELECT MAX(UnitsInStock) FROM dbo.Products)

--33
SELECT p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, p.UnitsInStock
FROM dbo.Products p
WHERE p.UnitsInStock = (SELECT MIN(UnitsInStock) FROM dbo.Products)

--34
SELECT p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, p.UnitsOnOrder
FROM dbo.Products p
WHERE p.UnitsOnOrder = (SELECT MAX(UnitsOnOrder) FROM dbo.Products)

--35
SELECT p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, p.ReorderLevel
FROM dbo.Products p
WHERE p.ReorderLevel = (SELECT MAX(ReorderLevel) FROM dbo.Products)

--36
WITH t AS(
SELECT e.EmployeeID, e.LastName, e.FirstName, COUNT(e.EmployeeID) 'Delayed Orders'
FROM dbo.Employees e 
INNER JOIN dbo.Orders o
ON o.EmployeeID = e.EmployeeID
WHERE (o.ShippedDate - o.RequiredDate >0)
GROUP BY e.EmployeeID, e.LastName, e.FirstName)
SELECT t.*
FROM t
WHERE t.[Delayed Orders] = (SELECT MAX([Delayed Orders]) FROM t)

--37
WITH t AS(
SELECT e.EmployeeID, e.LastName, e.FirstName, COUNT(e.EmployeeID) 'Delayed Orders'
FROM dbo.Employees e 
INNER JOIN dbo.Orders o
ON o.EmployeeID = e.EmployeeID
WHERE (o.ShippedDate - o.RequiredDate >0)
GROUP BY e.EmployeeID, e.LastName, e.FirstName)
SELECT t.*
FROM t
WHERE t.[Delayed Orders] = (SELECT MIN([Delayed Orders]) FROM t)

--38
WITH t AS(
SELECT TOP 3 p.ProductID, p.ProductName, SUM(od.Quantity) AS 'Total Ordered'
FROM dbo.Products p
LEFT OUTER JOIN dbo.[Order Details] od
ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY SUM(od.Quantity) DESC
)
SELECT TOP 3 t.*
FROM t
ORDER BY t.[Total Ordered] ASC

--39
WITH t AS(
SELECT TOP 5 p.ProductID, p.ProductName, SUM(od.Quantity) AS 'Total Ordered'
FROM dbo.Products p
LEFT OUTER JOIN dbo.[Order Details] od
ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY SUM(od.Quantity) DESC)

SELECT TOP 5 t.*
FROM t
ORDER BY t.[Total Ordered] ASC



