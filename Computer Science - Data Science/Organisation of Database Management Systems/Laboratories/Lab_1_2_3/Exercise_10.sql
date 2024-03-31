use [nortwind3-ms-2019]

/* polecenie 1 */
select productid, productname, categoryid, date, unitprice,
       lag(unitprice) over (partition by productid order by date) 
            as previousprodprice,
       lead(unitprice) over (partition by productid order by date) 
            as nextprodprice
from product_history
where productid = 1 and year(date) = 2022
order by date;

/* polecenie 1 bez funkcji okna */
select 
	p1.productid, 
	p1.productname, 
	p1.categoryid, 
	p1.date, 
	p1.unitprice,
	p2.unitprice as previousprodprice,
	p3.unitprice as extprodprice
from product_history as p1
inner join product_history as p2 
on p1.productid = p2.productid and p2.date = (
                            select max(date) 
                            from product_history 
                            where productid = p1.productid and date < p1.date)
inner join product_history as p3 
on p2.productid = p3.productid and p3.date = (
                            select min(date) 
                            from product_history 
                            where productid = p1.productid and date > p1.date)
where p1.productid = 1 and year(p1.date) = 2022
order by p1.productid, p1.date;

/* polecenie 2 */
with t as (select productid, productname, categoryid, date, unitprice,
                  lag(unitprice) over (partition by productid 
                      order by date) as previousprodprice,
                  lead(unitprice) over (partition by productid 
                      order by date) as nextprodprice
           from product_history
           )
select * from t
where productid = 1 and year(date) = 2022
order by date;

/* polecenie 2 bez funkcji okna */
with t as (
	select 
	p1.productid, 
	p1.productname, 
	p1.categoryid, 
	p1.date, 
	p1.unitprice,
	p2.unitprice as previousprodprice,
	p3.unitprice as extprodprice
	from product_history as p1
	inner join product_history as p2 
	on p1.productid = p2.productid and p2.date = (
                            select max(date) 
                            from product_history 
                            where productid = p1.productid and date < p1.date)
	inner join product_history as p3 
	on p2.productid = p3.productid and p3.date = (
                            select min(date) 
                            from product_history 
                            where productid = p1.productid and date > p1.date)
    )
select * from t
where productid = 1 and year(date) = 2022
order by date;






