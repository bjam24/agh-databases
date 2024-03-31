USE Northwind

/* Exercise 1 */
/* 1. Select product names and prices (northwind database) with unit price between 20.00 and 30.00, provide the supplier's address details for each product */
SELECT ProductName, UnitPrice, Address FROM Products AS p INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID WHERE UnitPrice BETWEEN 20.00 AND 30.00
/* 2. Select product names and info. about the stock of products supplied by 'Tokyo Traders' */
SELECT ProductName, UnitsInStock FROM Products AS p INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID WHERE CompanyName = 'Tokyo Traders'
/* 3. Are there any customers who did not place any order in 1997, if so then show their address details */
SELECT c.CustomerID, Address, OrderDate FROM Customers AS c LEFT OUTER JOIN Orders AS o ON c.CustomerID = o.CustomerID AND YEAR(OrderDate) = 1997 WHERE OrderID IS NULL
/* 4. Select the names and telephone numbers of the suppliers delivering the products, which are currently out of stock */
SELECT CompanyName, Phone FROM Suppliers AS s INNER JOIN Products as p ON s.SupplierID = p.SupplierID WHERE ISNULL(UnitsInStock, 0) = 0

/* Exercise 2 */
/* 1. Select product names and prices (northwind database) with unit price between 8:00 p.m. and 30:00 p.m., provide the supplier's address details for each product,
we are only interested in products from the 'Meat/Poultry' category */

/* 2. Select the product names and prices from the 'Confections' category for each product enter the name of the supplier. */

/* 3. Select the names and telephone numbers of customers who received shipments in 1997 delivered by 'United Package' */

/* 4. Select the names and phone numbers of customers who purchased products from the category 'Confections' */

/* Exercise 4 */
/* 1. Write a command that lists the children who are members of the library (base libraries). We are interested in the child's name, surname, date of birth and address
child's residence. */

/* 2. Write a command that displays a list of children who are members of the library (base libraries). We are interested in the child's name, surname, date of birth and address
the child's place of residence and the name and surname of the parent. */

/* Exercise 5 */
/* 1. Write a command that displays employees and their subordinates (base northwind) */

/* 2. Write a command that displays employees who have no subordinates (northwind base) */

/* 3. Write a command that displays the addresses of library members who have children born before January 1, 1996 */

/* 4. Write a command that displays the addresses of library members who have children born before January 1, 1996. We are only interested in the addresses of such members
libraries who currently do not keep books. */

/* Exercise 6 */
/* 1. Write a command that returns the name and surname (as a single column – name), and address information: street, city, state code (as a single
column – address) for all adult library members */

/* 2. Write a command that returns: isbn, copy_no, on_loan, title, translation, cover, for books with ISBN 1, 500 and 1000. Sort the result by ISBN */

/* 3. Write a command that returns library users 250, 342, and 1675 (for each user: number, name and surname of the library member), and information
about reserved books (isbn, date) */

/* 4. Provide a list of library members living in Arizona (AZ) have more than two children enrolled in the library */

/* Exercise 7 */
/* 1. Provide a list of library members living in Arizona (AZ) who have more than two children enrolled in the library and those who live in California
(CA) and have more than three children enrolled in the library */
