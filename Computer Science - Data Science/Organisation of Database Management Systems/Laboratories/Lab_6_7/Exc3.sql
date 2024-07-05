
--Utw�rz tabel� testow�:
CREATE TABLE [dbo].[SalesHistory](
 [SalesOrderID] [int] NOT NULL,
 [SalesOrderDetailID] [int] NOT NULL,
 [CarrierTrackingNumber] [nvarchar](25) NULL,
 [OrderQty] [smallint] NOT NULL,
 [ProductID] [int] NOT NULL,
 [SpecialOfferID] [int] NOT NULL,
 [UnitPrice] [money] NOT NULL,
 [UnitPriceDiscount] [money] NOT NULL,
 [LineTotal] [numeric](38, 6) NOT NULL,
 [rowguid] [uniqueidentifier] NOT NULL,
 [ModifiedDate] [datetime] NOT NULL
 ) ON [PRIMARY]
GO

--Za�� indeks:
CREATE CLUSTERED INDEX [SalesHistory_Idx]
ON [SalesHistory]([SalesOrderDetailID])

/* Wype�nij tablic� danymi:
(UWAGA! 'GO 100' oznacza 100 krotne wykonanie polecenia. Je�eli podejrzewasz, �e Tw�j serwer mo�e to zbyt przeci��y�, zacznij od GO 10, GO 20, GO 50 (w sumie ju� b�dzie 80)) 
��cznie jest tutaj GO 80.
*/

/*INSERT INTO SalesHistory
 SELECT SH.*
 FROM [AdventureWorks2017].[Sales].SalesOrderDetail SH
GO 50*/

--Sprawd� jak zachowa si� zapytanie, kt�re u�ywa obecny indeks:
SELECT ProductID, SUM(UnitPrice), AVG(UnitPrice), SUM(OrderQty), AVG(OrderQty)
FROM SalesHistory
GROUP BY ProductID
ORDER BY ProductID

--Za�� indeks typu ColumnStore:
CREATE NONCLUSTERED COLUMNSTORE INDEX SalesHistory_ColumnStore
 ON SalesHistory(UnitPrice, OrderQty, ProductID)

