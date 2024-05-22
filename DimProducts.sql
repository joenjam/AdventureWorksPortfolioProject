/****** Script for SelectTopNRows command from SSMS  ******/
GO
CREATE VIEW DimProduct AS 

SELECT   ProductID
		,pp.[Name] AS ProductName
	   ,ISNULL(ps.[Name], 'N/A') AS SubcategoryName
	  ,ISNULL(pc.[Name], 'N/A') AS CategoryName
      --,[ProductNumber]
      --,[MakeFlag]
      --,[FinishedGoodsFlag]
      --,[Color]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      ,[StandardCost]
      ,[ListPrice]
      --,[Size]
      --,[SizeUnitMeasureCode]
      --,[WeightUnitMeasureCode]
      --,[Weight]
      --,[DaysToManufacture]
      --,[ProductLine]
      --,[Class]
      --,[Style]
   --   ,ps.[ProductSubcategoryID]
	  --,pc.ProductCategoryID
      ----,[ProductModelID]
      --,[SellStartDate]
      --,[SellEndDate]
      --,[DiscontinuedDate]
      --,[rowguid]
      --,[ModifiedDate]
  FROM [AdventureWorks2022].[Production].[Product] pp
  LEFT JOIN [Production].[ProductSubcategory] ps
  ON pp.[ProductSubcategoryID]=ps.[ProductSubcategoryID]
  LEFT JOIN [Production].[ProductCategory] pc
  ON ps.ProductCategoryID=pc.ProductCategoryID
  GO


 