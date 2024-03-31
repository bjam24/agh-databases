use [nortwind3-ms-2019]

select  c.CompanyName, 
		o.OrderID, 
		o.OrderDate, 
		sum(od.Quantity * od.UnitPrice) + o.Freight as OrderValue, 
		lag(o.OrderID) over (partition by o.CustomerId order by o.OrderId ) as PrevOrderID,
		lag(o.OrderDate) over (partition by o.CustomerId order by  o.OrderID  ) as PrevOrderDate,
		lag(sum(od.Quantity * od.UnitPrice) + o.Freight)  over (partition by o.CustomerId order by o.OrderId )  as PrevOrderValue
from Customers c
join Orders o on o.CustomerID = c.CustomerID
join [Order Details] od on od.OrderID = o.OrderID
group by c.CompanyName, 
		o.OrderID, 
		o.OrderDate,
		o.Freight,
		o.CustomerID
