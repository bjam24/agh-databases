SELECT * INTO BillOfMaterials
FROM [AdventureWorks2017].[Production].BillOfMaterials

--Sprawdzenie iloœci wyst¹pieñ dla poszczególnych componentId
select ComponentId , count(*)
from BillOfMaterials
group by ComponentID
order by COUNT(*)

SELECT ProductAssemblyID, ComponentID, StartDate
FROM BillOfMaterials
WHERE EndDate IS NOT NULL
    AND ComponentID = 490
    AND StartDate >= '2010-08-05'


CREATE NONCLUSTERED INDEX BillOfMaterials_Cond_Idx
ON BillOfMaterials (ComponentID, StartDate)
WHERE EndDate IS NOT NULL


SELECT ProductAssemblyID, ComponentID, StartDate
FROM BillOfMaterials
WITH(INDEX(BillOfMaterials_Cond_Idx)) 
WHERE EndDate IS NOT NULL
    AND ComponentID = 327
    AND StartDate >= '2010-08-05'



SELECT ProductAssemblyID, ComponentID, StartDate
FROM BillOfMaterials
WHERE EndDate IS NOT NULL and ComponentID = 5
AND StartDate >= '2010-08-05'

SELECT ProductAssemblyID, ComponentID, StartDate
FROM BillOfMaterials
--WITH(INDEX(BillOfMaterials_Cond_Idx)) 
WHERE EndDate IS NOT NULL and ComponentID = 327
AND StartDate >= '2010-08-05'

