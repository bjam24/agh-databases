use [nortwind3-ms-2019]

;with tmp (CustomerID ,CompanyName,OrderID, OrderDate ,MinOrderId,MaxOrderId)
as(
  select c.CustomerID ,
         c.CompanyName, 
         o.OrderID, 
         o.OrderDate,
	 first_value(o.OrderId)over (PARTITION BY c.CustomerID,YEAR(OrderDate), 
         MONTH(OrderDate) order by sum(od.Quantity * od.UnitPrice) + o.Freight)as MinOrderId,                             
         first_value(o.OrderId) over (PARTITION BY c.CustomerID ,YEAR(OrderDate), MONTH(OrderDate)    
         order by sum(od.Quantity * od.UnitPrice) + o.Freight desc) as MaxOrderId
  from Customers c
  join Orders o on o.CustomerID = c.CustomerID
  join [Order Details] od on od.OrderID = o.OrderID
  group by c.CustomerId ,c.CompanyName , o.OrderID, o.OrderDate, o.Freight
),
order_values(OrderId ,OrderDate, OrderValue)
as(
  select o.OrderID,o.OrderDate, sum(od.Quantity * od.UnitPrice) + o.Freight 
  from Orders o 
  join [Order Details] od on od.OrderID = o.OrderID
  group by o.OrderID, o.OrderDate ,o.Freight 
)
select  x.CompanyName, 
		o.OrderID, 
		o.OrderDate, 
		x.MinOrderId,
		o_min.OrderDate   as MinOrderDate,
		o_min.OrderValue  as MinOrderValue,
		x.MaxOrderId,
		o_max.OrderDate   as MaxOrderDate,
		o_max.OrderValue  as MinOrderValue
from  tmp x 
join order_values o on o.OrderID = x.OrderID 
join order_values o_min on o_min.OrderID = x.MinOrderId 
join order_values o_max on o_max.OrderID = x.MaxOrderId 
order by CompanyName ,orderDate
