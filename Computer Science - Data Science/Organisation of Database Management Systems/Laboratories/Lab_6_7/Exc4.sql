
--Tworzymy tabelê bez indeksów 
SELECT top 100000 * INTO [TransactionHistory2] FROM [AdventureWorks2017].[Production].[TransactionHistory]

--Dodajemy klucz g³ówny
ALTER TABLE [TransactionHistory2] ADD  CONSTRAINT [PK_TransactionHistory2_TransactionID] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionHistory2', @level2type=N'CONSTRAINT',@level2name=N'PK_TransactionHistory2_TransactionID'
GO

--Wypisanie
select *
from TransactionHistory2


--Statystyki
select count(distinct TransactionId) as  unique_TransactionId, 
	   count(distinct ProductId) as unique_ProductId , 
	   count(distinct TransactionType ) as unique_TransactionType,
	   count(distinct TransactionDate ) as unique_TransactionDate,
	   count(distinct ReferenceOrderId ) as unique_ReferenceOrderId
from TransactionHistory2


--1.Klastrowane (dla atrybutu nie bêd¹cego kluczem g³ównym)
select *
from TransactionHistory2
where TransactionType in ('S' , 'W')


select *
from TransactionHistory2
where  ProductID = 712



CREATE CLUSTERED INDEX TransactionHistory2_Idx ON TransactionHistory2(ProductId)

--2.Indeksy Kolumnowe
CREATE NONCLUSTERED COLUMNSTORE INDEX idx_ColumnActualCost ON TransactionHistory2 (ActualCost);

CREATE NONCLUSTERED  INDEX idx_ActualCost ON TransactionHistory2 (ActualCost);

begin tran
update th set Quantity = 5
from TransactionHistory2 th
where ActualCost =1214.85 

rollback tran


select avg(ActualCost)
from TransactionHistory2 
with(index(idx_ActualCost))
where ActualCost between 1000.00 and 1500.00

select avg(ActualCost)
from TransactionHistory2 
with(index(idx_ActualCost))
where ActualCost between 1000.00 and 1500.00

--3.Indeksy Include

CREATE NONCLUSTERED INDEX IX_ProductID_Include 
ON dbo.TransactionHistory2 (ProductID) 
INCLUDE (TransactionDate, Quantity);

CREATE NONCLUSTERED INDEX IX_ProductID_NoInclude 
ON dbo.TransactionHistory2 (ProductID);

CREATE NONCLUSTERED INDEX IX_ProductID_NoInclude_2
ON dbo.TransactionHistory2 (ProductID , Quantity);


SELECT *
FROM dbo.TransactionHistory2
WHERE ProductID = 720;

SELECT TransactionDate, Quantity
FROM dbo.TransactionHistory2
WHERE ProductID = 720;

SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM dbo.TransactionHistory2
with(index(IX_ProductID_Include))
GROUP BY ProductID;


SELECT ProductID, sum(Quantity) AS TotalQuantity
FROM dbo.TransactionHistory2
GROUP BY ProductID;

SELECT ProductID, sum(Quantity) AS TotalQuantity
FROM dbo.TransactionHistory2
with(index(IX_ProductID_NoInclude))
GROUP BY ProductID;


