use [nortwind3-ms-2019]

/* Napisz polecenie, które zwraca: id pozycji, id produktu, nazwê produktu, cenê produktu oraz
-	œredni¹ cenê produktów w kategorii do której nale¿y dany produkt. 
-	³¹czn¹ wartoœæ sprzeda¿y produktów danej kategorii (suma dla pola value)
-	œredni¹ cenê danego produktu w roku którego dotyczy dana pozycja
-	³¹czn¹ wartoœæ sprzeda¿y produktów danej kategorii (suma dla pola value) */
-- z podzapytaniem
;select
	p1.id,
	p1.productid,
	p1.productname,
	p1.unitprice,
	(select avg(unitprice)  from product_history where categoryid = p1.categoryid group by categoryid) as avgprice,
	(select avg(value)  from product_history where categoryid = p1.categoryid group by categoryid)  as sumprice,
	(select  avg(unitprice) as avg_price_year from product_history where year(p1.date) = year(date) and p1.productid = productid group by year(date), productid) as avgpriceyearly
from product_history as p1

-- join
;with tmp ( categoryId , avgprice, sumprice )
as(
select 
	categoryid,
	avg(unitprice) as avgprice,
	sum(value) as sumprice
	from product_history 
	group by categoryid
),
tmp2 (productid , year_date ,avgpriceyearly ) 
as(
select 
	productid,
	year(date),
	avg(unitprice) as avgpriceyearly
	from product_history as p1
	group by productid ,year(date)
)
select 	p1.id,
	p1.productid,
	p1.productname,
	t.avgprice,
	t.sumprice
from product_history as p1
join tmp t on p1.categoryid = t.categoryId 
join tmp2 t2 on p1.productid = t2.productid and year(p1.date) = t2.year_date

-- z funkcj¹ okna
;select distinct
	p1.id,
	p1.productid,
	p1.productname,
	p1.unitprice,
	avg(UnitPrice) over(partition by CategoryId) as avgprice,
	sum(p1.value)  over(partition by CategoryId) as sumprice,
	avg(p1.unitprice)  over(partition by ProductId , year(date))  as avgpriceyearly
from product_history as p1
