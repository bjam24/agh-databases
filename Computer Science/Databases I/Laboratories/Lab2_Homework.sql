USE Northwind

/* Exercise 1 */
/* 1. Write a command that calculates the sales value for each orders and returns the result sorted in descending order (according to sales value).*/
SELECT OrderID, CONVERT(MONEY, SUM(UnitPrice * Quantity * (1 - Discount))) AS 'Total price' FROM [Order Details] GROUP BY OrderID ORDER BY 'Total price' DESC
/* 2. Modify the query from step 1 to return the first 10 rows SQL – aggregation operations – final exercise */
SELECT TOP 10 OrderID, CONVERT(MONEY, SUM(UnitPrice * Quantity * (1 - Discount))) AS 'Total price' FROM [Order Details] GROUP BY OrderID ORDER BY 'Total price' DESC
/* 3. Modify the query from point 2 so that it returns the first 10 products including equivalent ones. Compare the results. */
SELECT TOP 10 WITH TIES OrderID, CONVERT(MONEY, SUM(UnitPrice * Quantity * (1 - Discount))) AS 'Total price' FROM [Order Details] GROUP BY OrderID ORDER BY 'Total price' DESC

/* Exercise 2 */
/* 1. Enter the number of product units ordered for products o identifier < 3 */
SELECT ProductID, SUM(Quantity) FROM [Order Details] WHERE ProductID < 3 GROUP BY ProductID
/* 2. Modify the query from point 1 to specify a number ordered product units for all products */
SELECT ProductID, SUM(Quantity) FROM [Order Details] GROUP BY ProductID
/* 3. Enter the order value for each order for which the total number of product units ordered is > 250 */
SELECT OrderID, CONVERT(MONEY, SUM(UnitPrice * Quantity * (1 - Discount))) FROM [Order Details] GROUP BY OrderID HAVING SUM(Quantity) > 250

/* Exercise 3 */
/* 1. Write a command that calculates the total quantity ordered goods and arranges them according to productid and orderid and executes them rollup calculations.  */
SELECT ProductID, OrderID, SUM(Quantity) AS 'Total quantity' FROM [Order Details] GROUP BY ProductID, OrderID WITH ROLLUP
/* 2. Modify the query from step 1 to limit the result to only product number 50. */
SELECT OrderID, SUM(Quantity) AS 'Total quantity' FROM [Order Details] GROUP BY ProductID, OrderID WITH ROLLUP HAVING ProductID = 50
/* 3. What is the meaning of null values in the productid and orderid columns? SQL – aggregation operations – final exercise */
/*- means that it is the sum of the numbers (total number) of all products
     with the same ID that then appears in the left column (i.e. number
     products with a given ProductID and any OrderID),
     - if there is NULL in the ProductID column, then also in the column
     OrderID must be NULL. We then obtain the result for
     case where ProductID and OrderID have any value (otherwise:
     in other words, we then get the total number of all products) */
/* 4. Modify the command from step 1 by using the cube operator instead rollup. Also use the GROUPING function on the productid and columns orderid to distinguish between summary and detail
poems in the collection */
SELECT ProductID, OrderID, GROUPING(ProductID), GROUPING(OrderID), SUM(Quantity) AS 'Total quantity' FROM [Order Details] GROUP BY ProductID, OrderID WITH CUBE
/* 5. Which lines are summaries? Which ones summarize by product and which ones by order? */
/*The totals are all rows that contain a NULL value in place
ProductID or OrderID.

By product:
     - Summarizes those rows that have a NULL value in the OrderID column
     (then for a product with a given ProductID, different from NULL, it is counted
     total number of orders),

By order:
     - Summarizes those rows that have a NULL value in the ProductID column
     (then for an order with a given OrderID, different from NULL, it is counted
     total number of products),

By product and order:
     - Both columns (both ProductID and OrderID) are NULL
     (then the number of all products in orders is counted
     with any OrderID value, consisting of products with any ID)
     (The result is the total number of all products sold)
     (proof below)*/