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

/* 2. Modify the query from point 1 to specify a number ordered product units for all products */

/* 3. Enter the order value for each order for which the total number of product units ordered is > 250 */


/* Exercise 3 */
/* 1. Write a command that calculates the total quantity ordered goods and arranges them according to productid and orderid and executes them rollup calculations.  */

/* 2. Modify the query from step 1 to limit the result to only product number 50. */

/* 3. What is the meaning of null values in the productid and orderid columns? SQL – aggregation operations – final exercise */

/* 4. Modify the command from step 1 by using the cube operator instead rollup. Also use the GROUPING function on the productid and columns orderid to distinguish between summary and detail
poems in the collection */

/* 5. Which lines are summaries? Which ones summarize by product and which ones by order? */
