
GO
CREATE VIEW PopularProductsByCountry
AS
WITH CTE AS (
SELECT 
p.Name
,SUM(sd.[OrderQty]) AS Qty
,RANK() OVER (PARTITION BY st.CountryRegionCode ORDER BY SUM(sd.[OrderQty]) DESC) AS Rank
,CASE WHEN st.CountryRegionCode='US' THEN 'United States'
	  WHEN st.CountryRegionCode='CA' THEN 'Canada'
	  WHEN st.CountryRegionCode='AU' THEN 'Australia'
	  WHEN st.CountryRegionCode='GB' THEN 'United Kingdom'
	  WHEN st.CountryRegionCode='FR' THEN 'France'
	  WHEN st.CountryRegionCode='US' THEN 'United States'
	  WHEN st.CountryRegionCode='DE' THEN 'Germany'
	  ELSE 'N/A'
	  END AS CountryName
FROM [AdventureWorks2022].[Production].[Product] p
JOIN [Sales].[SalesOrderDetail] sd 
ON sd.ProductID=p.ProductID
JOIN [Sales].[SalesOrderHeader] sh 
ON sh.SalesOrderID=sd.SalesOrderID
JOIN Sales.SalesTerritory st
ON st.TerritoryID=sh.TerritoryID
GROUP BY p.Name, st.CountryRegionCode
)
SELECT CTE.Name,CTE.CountryName,Qty 
FROM CTE
WHERE RANK =1
GO

