use [nortwind3-ms-2019]

/* Napisz polecenie, kt�re zwraca: id pozycji, id produktu, nazw� produktu, cen� produktu, �redni� cen� produkt�w w kategorii do kt�rej
nale�y dany produkt. Wy�wietl tylko pozycje (produkty) kt�rych cena jest wi�ksza ni� �rednia cena. */
-- podzapytanie
;with tmp ( ProductID , ProductName,UnitPrice, AvgPrice)
as
(
	select distinct
		p1.ProductID,
		p1.ProductName,
		p1.UnitPrice,
		(select  avg(UnitPrice) as avg_price from product_history p2 where p2.CategoryID = p1.CategoryID group by CategoryID) 
	from product_history as p1
	
)
select *
from tmp 
where  AvgPrice < UnitPrice

--join
;Select distinct
	p1.ProductID,
	p1.ProductName,
	p1.UnitPrice,
	avg(p2.UnitPrice) as avgprice
from product_history as p1
join product_history as p2 on p1.CategoryID = p2.CategoryID
group by p1.ProductID,
	p1.ProductName,
	p1.UnitPrice
having p1.UnitPrice > avg(p2.UnitPrice)

-- funkcja okna
;with tmp ( ProductID , ProductName,UnitPrice, AvgPrice)
as(
select distinct
	p1.ProductID,
	p1.ProductName,
	p1.UnitPrice,
	avg(UnitPrice) over(partition by CategoryID) as AvgPrice 
from product_history as p1

)
select *
from tmp 
where  AvgPrice < UnitPrice 

