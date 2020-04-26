-- Question 1
SELECT o.OrderID, od.UnitPrice
FROM dbo.Orders AS o
LEFT JOIN dbo.[Order Details] AS od
ON o.OrderID = od.OrderID;

-- Question 2
SELECT o.OrderID, e.FirstName
FROM dbo.Orders AS o
LEFT JOIN dbo.Employees AS e
ON o.EmployeeID = e.EmployeeID;

-- Question 3
SELECT e.EmployeeID, t.TerritoryDescription
FROM dbo.Employees AS e 
LEFT JOIN dbo.EmployeeTerritories AS et 
ON e.EmployeeID = et.EmployeeID
LEFT JOIN dbo.Territories AS t 
ON et.TerritoryID = t.TerritoryID;

-- Question 4
SELECT DISTINCT Country
FROM dbo.Customers
UNION
SELECT DISTINCT Country
FROM dbo.Suppliers;

-- Question 5
SELECT Country
FROM dbo.Customers
UNION ALL
SELECT Country
FROM dbo.Suppliers;

-- Question 6
SELECT ROUND(UnitPrice, 0)
FROM dbo.Products;

-- Question 7
SELECT SUM(UnitsInStock)
FROM dbo.Products;

-- Question 8
SELECT OrderID, YEAR(OrderDate) AS OrderYear
FROM dbo.Orders;

-- Question 9
SELECT OrderID, DATENAME(mm, OrderDate) AS OrderMonth
FROM dbo.Orders;

-- Question 10
SELECT LEFT(RegionDescription, 2)
FROM dbo.Region;

-- Question 11
SELECT City, PostalCode
FROM dbo.Suppliers
WHERE ISNUMERIC(PostalCode) = 1;

-- Question 12
SELECT UPPER(LEFT(RegionDescription, 1))
FROM dbo.Region;