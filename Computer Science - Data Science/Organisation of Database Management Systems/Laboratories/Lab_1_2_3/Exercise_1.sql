USE [nortwind3-ms-2019]

select avg(unitprice) avgprice
from products p;

select avg(unitprice) over () as avgprice
from products p;


select categoryid, avg(unitprice) avgprice
from products p
group by categoryid

select avg(unitprice) over (partition by categoryid) as avgprice
from products p;





