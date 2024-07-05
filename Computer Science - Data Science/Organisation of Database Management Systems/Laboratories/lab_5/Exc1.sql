CREATE DATABASE XYZ
GO
USE XYZ
GO

SELECT * INTO [Customer] FROM [AdventureWorks2017].[Sales].[Customer]

SELECT * FROM Customer WHERE StoreID = 594
SELECT * FROM Customer WHERE StoreID BETWEEN 594 AND 610

-- Dodaj indeks:
CREATE INDEX Customer_Store_Idx ON Customer(StoreID)

-- Recommendations
CREATE CLUSTERED INDEX [_dta_index_Customer_c_7_1205579333__K3] ON [dbo].[Customer]
(
	[StoreID] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

-- Dodaj indeks klastrowany:
CREATE CLUSTERED INDEX Customer_Store_Cls_Idx ON Customer(StoreID)
