-- Question 1
SELECT QuantityPerUnit FROM dbo.Products;

-- Question 2
SELECT DISTINCT CategoryID FROM dbo.Products;

-- Question 3
SELECT ProductName FROM dbo.Products
WHERE UnitsInStock > 20;

-- Question 4
SELECT TOP(10) ProductID, ProductName, UnitPrice
FROM dbo.Products
ORDER BY UnitPrice DESC;

-- Question 5
SELECT ProductID, ProductName, QuantityPerUnit
FROM dbo.Products
ORDER BY ProductName;

-- Question 6
SELECT ProductID, ProductName, UnitPrice 
FROM dbo.Products
ORDER BY UnitsInStock DESC
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY;

-- Question 7
SELECT FirstName + ' has an EmployeeID of ' + CONVERT(nvarchar(30), EmployeeID) + ' and was born ' + CONVERT(NVARCHAR(30), BirthDate, 126)
FROM dbo.Employees;

-- Question 8
SELECT ShipName + ' is from ' + COALESCE(ShipCity, ShipRegion, ShipCountry)
FROM dbo.Orders;

-- Question 9
SELECT ShipName, ISNULL(ShipPostalCode, 'unknown')
FROM dbo.Orders;

-- Question 10
SELECT CompanyName,
    CASE
        WHEN Fax IS NULL THEN 'modern'
        ELSE 'outdated'
    END AS FaxStatus
FROM dbo.Suppliers;