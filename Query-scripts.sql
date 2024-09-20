
-- 1. Product.csv 

SELECT p.ProductKey, 
    p.EnglishProductName as Product, 
    p.StandardCost, 
    p.Color, 
    sp.EnglishProductSubcategoryName as Subcategory, 
    pc.EnglishProductCategoryName as EnglishProductCategoryName
FROM dbo.DimProduct as p
LEFT JOIN dbo.DimProductSubcategory as sp ON p.ProductSubcategoryKey = sp.ProductSubcategoryKey
LEFT JOIN dbo.DimProductCategory as pc ON sp.ProductCategoryKey = pc.ProductCategoryKey
WHERE p.ProductKey > 209 AND p.ProductKey < 607;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--2. Reseller.csv 

SELECT r.ResellerKey, r.BusinessType, r.ResellerName, g.City, g.StateProvinceName, g.EnglishCountryRegionName as Country_Region
FROM dbo.DimReseller as r
LEFT JOIN dbo.DimGeography as g ON r.GeographyKey = g.GeographyKey
ORDER BY 1 ASC;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--3. DimEmployee.csv

SELECT  *
from dbo.DimEmployee;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--4. DimSalesTerritory.csv

SELECT *
FROM dbo.DimSalesTerritory;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--5. DimEmployeeSalesTerritory.csv 

SELECT *
FROM dbo.DimEmployeeSalesTerritory;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--6. FactResellerSales.csv

SELECT r.SalesOrderNumber,
    r.OrderDate,
    r.ProductKey,
    r.ResellerKey,
    r.EmployeeKey,
    r.SalesTerritoryKey,
    r.OrderQuantity,
    r.UnitPrice,
    r.TotalProductCost,
    r.SalesAmount,
    p.StandardCost
FROM dbo.FactResellerSales r
LEFT JOIN dbo.DimProduct p ON r.ProductKey = p.ProductKey
;

