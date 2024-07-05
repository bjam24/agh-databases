
--Skopiuj tabel� Product do swojej bazy danych:
SELECT * INTO Product FROM [AdventureWorks2017].[Production].Product

--Stw�rz indeks z warunkiem przedzia�owym :
CREATE NONCLUSTERED INDEX Product_Range_Idx
    ON Product (ProductSubcategoryID, ListPrice) Include (Name)
WHERE ProductSubcategoryID >= 27 AND ProductSubcategoryID <= 36

--Sprawd�, czy indeks jest u�yty w zapytaniu:
SELECT Name, ProductSubcategoryID, ListPrice
FROM Product
WHERE ProductSubcategoryID >= 27 AND ProductSubcategoryID <= 36

--Sprawd�, czy indeks jest u�yty w zapytaniu, kt�ry jest dope�nieniem zbioru:
SELECT Name, ProductSubcategoryID, ListPrice
FROM Product
WHERE ProductSubcategoryID < 27 OR ProductSubcategoryID > 36

