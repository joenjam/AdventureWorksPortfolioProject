/****** Script for SelectTopNRows command from SSMS  ******/

GO
CREATE VIEW FactSale AS (
SELECT sh.[SalesOrderID]
      --,[RevisionNumber]
		 ,CAST([OrderDate] AS DATE) OrderDate
		 ,CAST([DueDate] AS date) DueDate
		 ,CAST([ShipDate] AS date) ShipDate
		 , DATEDIFF(DAY,OrderDate,ShipDate) AS OPT_Days
		 ,[Status]
      --,[OnlineOrderFlag]
      --,[SalesOrderNumber]
      --,[PurchaseOrderNumber]
      --,[AccountNumber]
		 ,[CustomerID]
		 ,[SalesPersonID]
		 ,[TerritoryID]
      ----,[BillToAddressID]
      ----,[ShipToAddressID]
		  ,[ShipMethodID]
		  ,[OrderQty]
		  ,[ProductID]
		  --,[SpecialOfferID]
		  ,[UnitPrice]
		  --,[UnitPriceDiscount]
		  ,[LineTotal] 
		  --,[CreditCardID]
		  --,[CreditCardApprovalCode]
		  --,[CurrencyRateID]
		  --,[SubTotal]
		  --,[TaxAmt]
		  ,[Freight]
		  --,[TotalDue]
		  --,[Comment]
		  --,[rowguid]
		  --,[ModifiedDate]
  FROM [AdventureWorks2022].[Sales].[SalesOrderHeader] sh
  JOIN [Sales].[SalesOrderDetail] sd
  ON sh.[SalesOrderID] = sd.SalesOrderID
  )
  GO