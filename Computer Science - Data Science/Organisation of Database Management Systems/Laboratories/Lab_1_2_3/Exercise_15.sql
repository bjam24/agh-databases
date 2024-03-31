use [nortwind3-ms-2019]
---PERCENT_RANK() 
;with order_values(YearOrderDate, MonthOrderDate, OrderValue)
as(
	select YEAR(o.OrderDate), MONTH(o.OrderDate), sum(od.Quantity * od.UnitPrice) + sum(o.Freight) 
	from Orders o 
	join [Order Details] od on od.OrderID = o.OrderID
	group by  YEAR(OrderDate) , MONTH(o.OrderDate)
)
select * , CUME_DIST() over (order by OrderValue) as percentOfLessOrEq
from order_values

----CUME_DIST() 
;with order_values(YearOrderDate, MonthOrderDate, OrderValue)
as(
	select YEAR(o.OrderDate), MONTH(o.OrderDate), sum(od.Quantity * od.UnitPrice) + sum(o.Freight) 
	from Orders o 
	join [Order Details] od on od.OrderID = o.OrderID
	group by  YEAR(OrderDate) , MONTH(o.OrderDate)
)
select * , CUME_DIST() over (order by OrderValue) as percentOfLessOrEq
from order_values

---Funkcja NTILE()
;select EmployeeId, 
       LastName, 
       FirstName, 
       Title
       NTILE(4) over (ORDER BY Title) as GroupID
from Employees
