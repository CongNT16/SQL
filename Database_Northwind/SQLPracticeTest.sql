--Exercise 1
SELECT o.OrderID, o.ProductID, o.UnitPrice, o.Quantity, (o.UnitPrice * o.Quantity) as 'Total Money'
FROM dbo.[Order Details] o
WHERE o.OrderID = 10327

UNION 

SELECT NULL, NULL, NULL, NULL, SUM(o.UnitPrice * o.Quantity)
FROM dbo.[Order Details] o
WHERE o.OrderID = 10327
--Exercise 2

SELECT EmployeeID, LastName, FirstName
FROM Employees
UNION ALL
SELECT NULL, 'Total Employee:' , CONVERT(varchar,COUNT(*))
FROM Employees

--Exercise 3

SELECT A.EmployeeID, A.LastName, A.FirstName, A.ReportsTo as 'BossID', B.LastName as 'BossName'
FROM Employees A
LEFT OUTER JOIN Employees B 
ON A.ReportsTo = B.EmployeeID

--Exercise 4

SELECT A.EmployeeID, A.LastName, A.FirstName, B.TerritoryID
FROM Employees A
INNER JOIN  EmployeeTerritories B
ON A.EmployeeID = B.EmployeeID

--Exercise 5
SELECT A.EmployeeID, A.LastName, A.FirstName, COUNT(B.TerritoryID) 'Total Territories'
FROM Employees A
INNER JOIN EmployeeTerritories B
ON A.EmployeeID = B.EmployeeID
GROUP BY A.EmployeeID,  A.LastName, A.FirstName

--Exercise 6
SELECT TOP (1) A.EmployeeID, A.LastName, A.FirstName, COUNT(B.TerritoryID) 'Total Territories'
FROM Employees A
INNER JOIN EmployeeTerritories B
ON A.EmployeeID = B.EmployeeID
GROUP BY A.EmployeeID,  A.LastName, A.FirstName
ORDER BY COUNT(B.TerritoryID) DESC

--Exercise 7
SELECT TOP (1) A.EmployeeID, A.LastName, A.FirstName, COUNT(B.TerritoryID) 'Total Territories'
FROM Employees A
INNER JOIN EmployeeTerritories B
ON A.EmployeeID = B.EmployeeID
GROUP BY A.EmployeeID,  A.LastName, A.FirstName
ORDER BY COUNT(B.TerritoryID) 

--Exercise 8

SELECT TOP (3) ProductID, UnitPrice
FROM Products
ORDER BY UnitPrice DESC

--Exercise 9
SELECT TOP (3) ProductID, UnitPrice
FROM Products
ORDER BY UnitPrice

--Exercise 10

SELECT SUM([Total record]) as[Total record] FROM
(SELECT COUNT(*) as [Total record]
FROM [Customer and Suppliers by City] 
union
SELECT COUNT(*) as [Total record]
FROM Employees ) as c1

--Exercise 11
SELECT A.CategoryID, CategoryName ,B.ProductID, ProductName, MONTH(C.OrderDate) 'month', DAY(C.OrderDate) 'day', YEAR(C.OrderDate) 'year',  (D.Quantity * D.UnitPrice) AS Revenue
FROM Categories A 
INNER JOIN Products B ON A.CategoryID = B.CategoryID 
INNER JOIN [Order Details] D ON B.ProductID = D.ProductID
INNER JOIN Orders C ON C.OrderID = D.OrderID
WHERE MONTH(C.OrderDate) = 7   
      AND YEAR(C.OrderDate) = 1996
	  AND DAY(C.OrderDate) >= 1
	  AND DAY(C.OrderDate) <= 5
	  ORDER BY(CategoryID)
