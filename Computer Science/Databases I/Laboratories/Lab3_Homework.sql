USE Northwind

/* Exercise 1 */
/* 1. Write a command that calculates the sales value for each order i returns the result sorted in descending order (by sales value). */
SELECT OrderID, CAST(CEILING(SUM(UnitPrice * Quantity * (1 - Discount)) * 100) / 100 AS DECIMAL(10, 2)) AS 'Total value' FROM [Order Details] GROUP BY OrderID ORDER BY 'Total value' DESC
/* 2. Modify the query from the previous point so that it returns the first ones 10 lines */
SELECT TOP 10 OrderID, CAST(CEILING(SUM(UnitPrice * Quantity * (1 - Discount)) * 100) / 100 AS DECIMAL(10, 2)) AS 'Total value' FROM [Order Details] GROUP BY OrderID ORDER BY 'Total value' DESC

/* Exercise 2 */
/* 1. Enter the number of product units ordered for the products for which productid < 3 */
SELECT ProductID, SUM(Quantity) AS 'Total quantity' FROM [Order Details] GROUP BY ProductID HAVING ProductID < 3
/* 2. Modify the query from the previous step to return a number ordered product units for all products */
SELECT ProductID, SUM(Quantity) AS 'Total quantity' FROM [Order Details] GROUP BY ProductID
/* 3. Enter the order number and order value for the orders for which the total number of product units ordered is > 250 */
SELECT OrderID, CAST(CEILING(SUM(UnitPrice * Quantity * (1 - Discount)) * 100) / 100 AS DECIMAL(10, 2)) AS 'Total value' FROM [Order Details] GROUP BY OrderID HAVING SUM(Quantity) > 250

/* Exercise 3 */
/* 1. For each employee, enter the number of orders they handle */
SELECT EmployeeID, COUNT(OrderID) AS 'Handled orders' FROM Orders GROUP BY EmployeeID
/* 2. For each forwarder/carrier, enter the "shipping fee" value orders transported by him */
SELECT ShipVia, SUM(Freight) AS 'Shipping fee' FROM Orders GROUP BY ShipVia ORDER BY ShipVia
/* 3. For each forwarder/carrier, enter the "shipping fee" value orders transported by him in the years 1996 to 1997 */
SELECT ShipVia, SUM(Freight) AS 'Shipping fee in 1996 - 1997' FROM Orders WHERE YEAR(ShippedDate) IN (1996, 1997) GROUP BY ShipVia ORDER BY ShipVia

/* Exercise 4 */
/* 1. For each employee, enter the number of orders he/she handles divided into years and months */
SELECT EmployeeID, YEAR(OrderDate) AS 'Year', MONTH(OrderDate) AS 'Month', COUNT(*) AS 'Handled orders' FROM Orders GROUP BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate) ORDER BY 1, 2, 3
/* 2. For each category, enter the maximum and minimum prices for the product in that category */
SELECT CategoryID, MIN(UnitPrice) AS 'Min unit price', MAX(UnitPrice) AS 'Max unit price' FROM Products GROUP BY CategoryID