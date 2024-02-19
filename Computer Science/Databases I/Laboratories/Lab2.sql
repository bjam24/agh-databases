USE Northwind

/* Exercise 1 */
/*1. Enter the number of products with prices less than $10 or greater than $20 */
SELECT COUNT(ProductID) FROM Products WHERE UnitPrice < 10 AND UnitPrice > 20
/* 2. Enter the maximum product price for priced products under $20 */
SELECT MAX(UnitPrice) AS 'Max unit price' FROM Products WHERE UnitPrice > 20
/* 3. Enter the maximum, minimum and average price of the product for SQL – aggregation operations products sold in bottles */
SELECT MAX(UnitPrice) AS 'Max unit price', MIN(UnitPrice) AS 'Min unit price', AVG(UnitPrice) AS 'Average unit price' FROM Products WHERE QuantityPerUnit LIKE '%bottle%'
/* 4. List price information for all products above average */
SELECT * FROM Products WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
/* 5. Enter the value of order number 10250 */
SELECT SUM(UnitPrice * Quantity) AS 'Total value' FROM [Order Details] WHERE OrderID = 10250

/* Exercise 2 */
/* 1. Enter the maximum price of the ordered product for every order. Sort orders by: maximum product price */
SELECT OrderID, MAX(UnitPrice) AS 'Max unit price' FROM [Order Details] GROUP BY OrderID ORDER BY 'Max unit price'
/* 2. Enter the maximum and minimum price of the order product for each order SQL – aggregation operations */
SELECT OrderID, MAX(UnitPrice) AS 'Max unit price', MIN(UnitPrice) AS 'Min unit price' FROM [Order Details] GROUP BY OrderID
/* 3. Enter the number of orders shipped by individual forwarders */
SELECT ShipVia, COUNT(*) AS ShippedCount FROM Orders GROUP BY ShipVia
/* 4. Which shipper was the most active in 1997? */
SELECT TOP 1 ShipVia, COUNT(*) AS ShippedCount FROM Orders WHERE ShippedDate LIKE '%1997%' GROUP BY ShipVia ORDER BY ShippedCount DESC

/* Exercise 3 */
/* 1. View orders for which number of items order is greater than 5 */
SELECT OrderID, COUNT(*) AS 'Number of unique products' FROM [Order Details] GROUP BY OrderID HAVING COUNT(*) > 5
/* 2. View clients for whom the transaction was completed in 1998 more than 8 orders (sort the results descending by total amount for delivering orders for each of SQL – aggregation operations
customers) */
SELECT CustomerID, COUNT(*) AS 'Number of orders in 1998', SUM(Freight) AS 'Total delivery cost' FROM Orders 
WHERE YEAR(ShippedDate) = 1998 
GROUP BY CustomerID 
HAVING COUNT(OrderID) > 8 
ORDER BY SUM(Freight) DESC;