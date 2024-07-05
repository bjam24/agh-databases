SELECT * INTO [Address] FROM  [AdventureWorks2017].[Person].[Address]

SELECT AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Address
WHERE PostalCode BETWEEN N'98000' and N'99999'

CREATE INDEX Address_PostalCode_1
ON Address (PostalCode)
INCLUDE (AddressLine1, AddressLine2, City, StateProvinceID);
GO

CREATE INDEX Address_PostalCode_2
ON Address (PostalCode, AddressLine1, AddressLine2, City, StateProvinceID);
GO


SELECT AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Address
--WITH(INDEX(Address_PostalCode_1)) 
WHERE PostalCode BETWEEN N'98000' and N'99999'
 

SELECT  AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Address 
WHERE PostalCode BETWEEN N'98000' and N'99999' and City like '%a%'


SELECT SpatialLocation , AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
FROM Address 
WITH(INDEX(Address_PostalCode_2)) 
WHERE PostalCode BETWEEN N'98000' and N'99999'


SELECT i.[name] AS IndexName, SUM(s.[used_page_count]) * 8 AS IndexSizeKB
FROM sys.dm_db_partition_stats AS s
INNER JOIN sys.indexes AS i ON s.[object_id] = i.[object_id] AND s.[index_id] = i.[index_id]
WHERE i.[name] = 'Address_PostalCode_1' OR i.[name] = 'Address_PostalCode_2'
GROUP BY i.[name]
GO
