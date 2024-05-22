
  SELECT CAST(MIN(OrderDate) AS date) min_date,CAST(MAX(OrderDate) AS date) max_date
   FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
  SELECT DATEDIFF(YEAR,CAST(MIN(OrderDate) AS date),CAST(MAX(OrderDate) AS date))
   FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]


DECLARE @StartDate DATE ='2011-05-31',  @years int =3
DECLARE @CutoffDate DATE = DATEADD(DAY, -1, DATEADD(YEAR, @years,@StartDate));

WITH seq(n) AS (
SELECT n=value
FROM generate_series(0,DATEDIFF(DAY,@StartDate,@CutoffDate)-1)
),
d(d) AS (
SELECT DATEADD(DAY, n,@StartDate)
FROM seq
WHERE n<DATEDIFF(DAY,@StartDate,@CutoffDate )
),

dte AS (
SELECT 
Date			    	=CONVERT(date,d),
DayNumber				=DATEPART(DAY,d),
MonthNumber				=DATEPART(MONTH,d),
Year					=YEAR(d),
MonthName				=FORMAT(d,'MMM'),
MonthYear				=FORMAT(d,'MMM-yyyy'),
WeekdayName				=FORMAT(d,'ddd'),
WeekDayNumber			=DATEPART(WEEKDAY,d),
Quarter					=DATEPART(QUARTER,d)
FROM d)
SELECT * 
INTO DimDateTbl
FROM dte