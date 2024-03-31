use [nortwind3-ms-2019]

/* Napisz polecenie, które zwraca: id produktu, nazwê produktu, cenê produktu, œredni¹ cenê produktów w kategorii, do której nale¿y dany produkt.
Wyœwietl tylko pozycje (produkty) których cena jest wiêksza ni¿ œrednia cena. */
--podzapytanie 
;with tmp ( ProductID , ProductName,UnitPrice, AvgPrice)
as
(
    select
        p1.ProductID,
        p1.ProductName,
        p1.UnitPrice,
        (select  avg(UnitPrice) as avg_price from Products p2 where p2.CategoryID = p1.CategoryID group by CategoryID) 
    from Products as p1
)
select *
from tmp 
where  AvgPrice < UnitPrice

/* join */
select
    p1.ProductID,
    p1.ProductName,
    p1.UnitPrice,
    avg(p2.UnitPrice) as avgprice
from Products as p1
join Products as p2 on p1.CategoryID = p2.CategoryID
group by p1.ProductID,
    p1.ProductName,
    p1.UnitPrice
having p1.UnitPrice > avg(p2.UnitPrice)

/* funkcja okna */
;with tmp ( ProductID , ProductName,UnitPrice, AvgPrice)
as(
select
    p1.ProductID,
    p1.ProductName,
    p1.UnitPrice,
    avg(UnitPrice) over(partition by CategoryID) as AvgPrice 
from Products as p1
)
select *
from tmp 
where  AvgPrice <UnitPrice
