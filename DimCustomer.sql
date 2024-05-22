/****** Script for SelectTopNRows command from SSMS  ******/
GO
  
 CREATE VIEW CustomerTbl AS
 (
 SELECT  [CustomerID]
		,[FirstName]
      --,[MiddleName]
        ,[LastName]
		,CONCAT([FirstName],(' '),[LastName]) FullNames
		,CASE
		WHEN st.[CountryRegionCode] ='US' THEN 'United States'	--replacing Country code to countty full name
		WHEN st.[CountryRegionCode] ='CA' THEN 'Canada'
		WHEN st.[CountryRegionCode] ='FR' THEN 'France'
		WHEN st.[CountryRegionCode] ='DE' THEN 'Germany'
		WHEN st.[CountryRegionCode] ='AU' THEN 'Australia'
		WHEN st.[CountryRegionCode] ='GB' THEN 'United Kingdom'
		ELSE 'NA'
		END Countries
		,st.[Group] AS Region --renaming group to Region
		,CONCAT([Group],('_'),[CountryRegionCode] ) RegionCountry	
		
     -- ,[PersonID]
    --  ,[StoreID]
     -- ,c.[TerritoryID]
     -- ,[AccountNumber]
    --  ,[rowguid]
     -- ,[ModifiedDate]
  FROM [AdventureWorks2022].[Sales].[Customer] c LEFT JOIN 
		[AdventureWorks2022].[Person].[Person] pp
	ON c.[PersonID]=pp.[BusinessEntityID]
	LEFT JOIN [AdventureWorks2022].[Sales].[SalesTerritory] st
	ON c.[TerritoryID]=st.[TerritoryID]
	--Joining of [Sales].[Customer] & [Person].[Person] tbl
  )
  GO