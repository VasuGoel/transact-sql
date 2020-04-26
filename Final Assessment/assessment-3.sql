-- Question 1
SELECT ProductName, UnitPrice
FROM dbo.Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM dbo.[Order Details]
);

-- Question 2
SELECT FirstName, EmployeeID
FROM dbo.Employees
WHERE EmployeeID IN (
    SELECT DISTINCT EmployeeID
    FROM dbo.Orders
    WHERE ShipCountry = 'USA'
);

-- Question 3
CREATE TABLE #ProductNames (ProductName VARCHAR(40));
INSERT INTO #ProductNames
SELECT ProductName
FROM Products;
SELECT * FROM #ProductNames;