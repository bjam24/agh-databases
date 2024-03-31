use [nortwind3-ms-2019]

/*Dla ka¿dego produktu, podaj 4 najwy¿sze ceny tego produktu w danym roku. Zbiór wynikowy powinien zawieraæ:
rok
id produktu
nazwê produktu
cenê
datê (datê uzyskania przez produkt takiej ceny) 
pozycjê w rankingu 
Uporz¹dkuj wynik wg roku, nr produktu, pozycji w rankingu */
;with r as (
    select 
        year(date) as year_date,
        productid,
        productname,
        unitprice,
        date,
        row_number() over(partition by productid, year(date) order by unitprice desc) as pricerank
    from product_history
)
select year_date, productid, productname, unitprice, date, pricerank from r
where pricerank <= 4
order by year_date, productid, pricerank;


/* Spróbuj uzyskaæ ten sam wynik bez u¿ycia funkcji okna, porównaj wyniki, czasy i plany zapytañ. */
;with r as (
    select 
		year(p1.date) as year_date,
		p1.productid,
		p1.productname,
		p1.unitprice,
		p1.date,
		count(distinct p2.unitprice) as pricerank
	from
		product_history as p1
	inner join 
		product_history as p2 on year(p1.date) = year(p2.date)
                and p1.productid = p2.productid 
                and p2.unitprice >= p1.unitprice
	group by 
		year(p1.date), p1.productid, p1.productname, p1.unitprice, p1.date
)
select year_date, productid, productname, unitprice, date, pricerank from r
where pricerank <= 4 
order by year_date, productid, pricerank

