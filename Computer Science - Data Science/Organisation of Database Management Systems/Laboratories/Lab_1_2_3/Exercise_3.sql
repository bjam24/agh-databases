use [nortwind3-ms-2019]

/* Polecenie z wykorzystaniem podzapytania */
select 
    ProductID, 
    ProductName, 
    UnitPrice, 
    (select avg(UnitPrice) as avg_price from Products) as avgprice
from Products

/* Polecenie z wykorzystaniem join'a */
select
    p1.ProductID,
    p1.ProductName,
    p1.UnitPrice,
    avg(p2.UnitPrice) as avgprice
from Products as p1
inner join Products as p2 on 1=1
group by p1.ProductID,
        p1.ProductName,
        p1.UnitPrice
/* Polecenie z wykorzystaniem funkcji okna. */
select 
    ProductID, 
    ProductName, 
    UnitPrice, 
    avg(unitprice) over() as avgprice
 from Products