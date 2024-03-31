USE [nortwind3-ms-2019]

/* Polecenie równowa¿ne 1) z wykorzystaniem funkcji okna. */
select *
from (  select
    productid, 
    ProductName, 
    unitprice, 
    avg(unitprice) over() as avgprice
    from products
) as tmp 
where productId < 10

/* Polecenie równowa¿ne 2) z wykorzystaniem podzapytania. */
select 
    p1.productid,
    p1.ProductName,
    p1.unitprice,
    avgprice.avg_price as avgprice
from products as p1
join (select avg(unitprice) as avg_price from products where ProductID < 10 ) as avgprice on 1=1
where productid < 10
