-- Question 1
SELECT OrderID, ShippedDate, 
    CHOOSE(MONTH(ShippedDate), 'Winter', 'Winter', 'Spring', 'Spring', 'Spring', 'Summer', 'Summer', 'Summer', 'Autumn', 
    'Autumn', 'Autumn', 'Winter') AS ShippedSeason
FROM dbo.Orders
WHERE ShippedDate IS NOT NULL;

-- Question 2
SELECT CompanyName, IIF(Fax IS NOT NULL, 'outdated', 'modern') AS Status
FROM dbo.Suppliers;

-- Question 3
SELECT c.Country, SUM(od.Quantity) AS TotalQuantity
FROM dbo.Customers AS c
JOIN dbo.Orders AS o
ON c.CustomerID = o.CustomerID
JOIN dbo.[Order Details] AS od
ON o.OrderID = od.OrderID
GROUP BY ROLLUP(c.Country);

-- Question 4
SELECT Country, ContactTitle, COUNT(ContactTitle) AS Count, 
    CASE
        WHEN GROUPING_ID(ContactTitle) = 1 THEN 'Subtotal for ' + Country
        WHEN GROUPING_ID(ContactTitle) = 0 THEN ''
    END AS Legend
FROM dbo.Customers
GROUP BY ROLLUP(Country, ContactTitle);

-- Question 5
SELECT * FROM (
    SELECT CategoryID, UnitPrice, 'Average Unit Price' AS 'Per Category'
    FROM Products
) AS AvgUnitPriceByCategory
PIVOT(AVG(AvgUnitPriceByCategory.UnitPrice) FOR CategoryID IN ([1],[2], [3], [4], [5], [6], [7], [8])) AS PivotTable;

-- Question 6
INSERT INTO dbo.Region
VALUES (5, 'Space');
SELECT * FROM dbo.Region
WHERE RegionID = 5;

-- Question 7
UPDATE dbo.Region
SET RegionDescription = UPPER(RegionDescription);
SELECT * FROM dbo.Region;

-- Question 8
DECLARE @region AS NVARCHAR(25) = 'Space';
IF NOT EXISTS (SELECT * FROM Region WHERE RegionDescription = @region)
    THROW 50001, 'Error!', 0
ELSE
BEGIN
    SELECT * FROM Region 
    WHERE RegionDescription = @region
END