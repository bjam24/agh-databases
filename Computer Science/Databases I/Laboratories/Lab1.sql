USE Northwind

/* Exercise 1 */
/* 1. Select names and addresses of all customers */
SELECT CompanyName, Address FROM Customers
/* 2. Select employee names and phone numbers */
SELECT FirstName, LastName, HomePhone FROM Employees
/* 3. Select product names and prices SQL – basic commands */
SELECT ProductName, UnitPrice FROM Products
/* 4. Show names and descriptions of all product categories */
SELECT CategoryName, Description FROM Categories
/* 5. Show names and website addresses of suppliers */
SELECT CompanyName, HomePage FROM Suppliers

/* Exercise 2 */
/* 1. Select names and addresses of all customers based in London */
SELECT CompanyName, Address FROM Customers WHERE City = 'London'
/* 2. Select names and addresses of all customers based in France or in Spain */
SELECT CompanyName, Address FROM Customers WHERE Country = 'France' OR Country = 'Spain'
/* 3. Select product names and prices with a unit price between 20 and 30 SQL – basic commands */
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice >= 20 AND UnitPrice <= 30
/* 4. Select names and prices of products from the 'meat' category */
SELECT ProductName, UnitPrice FROM Products WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName LIKE '%meat%')
/* 5. Select product names and information about the stock of products supplied by 'Tokyo Traders' */
SELECT ProductName, UnitsInStock FROM Products WHERE ProductID = (SELECT ProductID FROM Suppliers WHERE CompanyName = 'Tokyo Traders')
/* 6. Select names of products that are out of stock */
SELECT ProductName FROM Products WHERE UnitsInStock = 0

/* Exercise 3 */
/* 1. We are looking for information about products sold in bottles ('bottle')*/
SELECT * FROM Products WHERE QuantityPerUnit LIKE '%bottle%'
/* 2. Search for job information about the employees you want surnames start with a letter from B to L */
SELECT Title FROM Employees WHERE LastName LIKE '[B-L]%'
/* 3. Search for job information about the employees whom SQL – basic commands surnames start with the letter B or L */
SELECT Title FROM Employees WHERE LastName LIKE '[BL]%'
/* 4. Find category names that contain a comma in their description */
SELECT CategoryName FROM Categories WHERE Description LIKE '%,%'
/* 5. Find customers who have some in their name place of the word 'Store' */
SELECT * FROM Customers WHERE CompanyName LIKE '$Store%'

/* Exercise 4 */
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice >= 10 AND UnitPrice <= 20

/* Exercise 5 */
/* 1. We are looking for information about products with prices less than 10 or greater than 20 */
SELECT * FROM Products WHERE UnitPrice < 10 OR UnitPrice > 20

/* 2. Select the names and prices of the unit priced products between 20.00 and 30.00 */
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 20.00 AND 30.00

/* Exercise 6 */
/* 1. Select the names and countries of all customers you have based in Japan (Japan) or Italy (Italy) */
SELECT CompanyName, Country FROM Customers WHERE Country = 'Japan' OR Country = 'Italy'

/* Exercise 7 */
/* Write a select statement to select the order number, order date, customer number for all unfulfilled orders for which country the recipient is Argentina */
SELECT OrderID, OrderDate, CustomerID FROM Orders WHERE (ShippedDate IS NULL OR ShippedDate > GETDATE()) AND ShipCountry = 'Argentina'

/* Exercise 8 */
/* 1. Select the names and countries of all customers, sort the results by country, sort company names within a given country alphabetically SQL – basic commands */
SELECT CompanyName, Country FROM Customers ORDER BY Country, CompanyName ASC

/* 2. Select product information (group, name, price), Sort products by groups and in groups descending by price */
SELECT CategoryName, ProductName, UnitPrice FROM Categories, Products ORDER BY CategoryName, UnitPrice DESC

/* 3. Select the names and countries of all customers you have based in Great Britain (UK) or Italy (Italy), sort the results as in point 1 */
SELECT CompanyName, Country FROM Customers WHERE Country = 'UK' OR Country = 'Italy' ORDER BY Country, CompanyName ASC

