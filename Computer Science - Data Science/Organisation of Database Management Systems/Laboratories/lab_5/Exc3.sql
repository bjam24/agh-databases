--Skopiuj tabel� PurchaseOrderDetail do swojej bazy danych:
SELECT * INTO [PurchaseOrderDetail] FROM [AdventureWorks2017].[Purchasing].[PurchaseOrderDetail]

-- Wykonaj analiz� zapytania:
SELECT RejectedQty, ((RejectedQty/OrderQty)*100) AS RejectionRate,
ProductID, DueDate
FROM PurchaseOrderDetail
ORDER BY RejectedQty DESC, ProductID ASC

-- Do optymalizacji kosztu zapytania mo�na zastosowa� Nonclustered Index.
-- Polecenie tworz�ce index
use [XYZ]
go
CREATE NONCLUSTERED INDEX [_dta_index_PurchaseOrderDetail_7_949578421__K9D_K5_3_4] ON [dbo].[PurchaseOrderDetail]
(
[RejectedQty] DESC,
[ProductID] ASC
)
INCLUDE([DueDate],[OrderQty]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLI-NE = OFF) ON [PRIMARY]
go

