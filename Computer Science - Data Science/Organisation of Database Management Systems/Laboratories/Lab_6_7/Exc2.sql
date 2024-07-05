SELECT * INTO [SalesOrderHeader2] FROM [AdventureWorks2017].[Sales].[SalesOrderHeader]

SELECT TOP 1000 * FROM SalesOrderHeader2
ORDER BY OrderDate

CREATE CLUSTERED INDEX Order_Date2_Idx ON SalesOrderHeader2(OrderDate)
SELECT TOP 1000 * FROM SalesOrderHeader2
ORDER BY OrderDate


-- Wersja bez sortowania
SELECT TOP 1000 * FROM SalesOrderHeader2
WHERE OrderDate BETWEEN '2010-10-01' AND '2011-06-01'

-- Wersja z sortowaniem DESC
SELECT TOP 1000 * FROM SalesOrderHeader2
WHERE OrderDate BETWEEN '2010-10-01' AND '2011-06-01'
order by OrderDate desc

-- Wersja z sortowaniem ASC
SELECT TOP 1000 * FROM SalesOrderHeader2
WHERE OrderDate BETWEEN '2010-10-01' AND '2011-06-01'
order by OrderDate asc
