
--Skopiuj tabelê Product do swojej bazy danych:
SELECT * INTO Product FROM [AdventureWorks2017].[Production].Product

--Stwórz indeks z warunkiem przedzia³owym :
CREATE NONCLUSTERED INDEX Product_Range_Idx
    ON Product (ProductSubcategoryID, ListPrice) Include (Name)
WHERE ProductSubcategoryID >= 27 AND ProductSubcategoryID <= 36

--SprawdŸ, czy indeks jest u¿yty w zapytaniu:
SELECT Name, ProductSubcategoryID, ListPrice
FROM Product
WHERE ProductSubcategoryID >= 27 AND ProductSubcategoryID <= 36

--SprawdŸ, czy indeks jest u¿yty w zapytaniu, który jest dope³nieniem zbioru:
SELECT Name, ProductSubcategoryID, ListPrice
FROM Product
WHERE ProductSubcategoryID < 27 OR ProductSubcategoryID > 36

