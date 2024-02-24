USE Northwind;

/* Exercise 1 */
/* View all employees who are at least 25 years old */
SELECT * FROM Employees WHERE DATEDIFF(year, BirthDate, GETDATE()) >= 25

/* Exercise 2 */
/* For each employee, display the number of orders they handled and the date of the oldest order they handled */
SELECT EmployeeID, COUNT(OrderID) AS 'Served orders' , MIN(OrderDate) AS 'Oldest served order' FROM Orders GROUP BY EmployeeID ORDER BY 2 DESC

/* Exercise 3 */
/* For each customer whose order was not fulfilled within the allotted time, please provide the total amount they paid for shipping costs */
SELECT CustomerID, SUM(Freight) FROM Orders WHERE ShippedDate > RequiredDate GROUP BY CustomerID

/* Exercise 4 */
/* View all orders where no discount was applied to any of the products purchased */
SELECT OrderID FROM [Order Details] GROUP BY OrderID HAVING SUM(Discount) = 0