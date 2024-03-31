use [nortwind3-ms-2019]

select productid, productname, unitprice, categoryid,
    row_number() over(partition by categoryid order by unitprice desc) 
                                                   as rowno,
    rank() over(partition by categoryid order by unitprice desc) 
                                                   as rankprice,
    dense_rank() over(partition by categoryid order by unitprice desc) 
                                                   as denserankprice
from products;

/* Spróbuj uzyskaæ ten sam wynik bez u¿ycia funkcji okna */
SELECT 
    p.productid,
    p.productname,
    p.unitprice,
    p.categoryid,
	(SELECT COUNT(*)
     FROM products p4
     WHERE p4.categoryid = p.categoryid AND p4.unitprice >= p.unitprice) as rowno,
    (SELECT COUNT(*) + 1
     FROM products p2
     WHERE p2.categoryid = p.categoryid AND p2.unitprice > p.unitprice) as rankprice,
    (SELECT COUNT(DISTINCT p3.unitprice)
     FROM products p3
     WHERE p3.categoryid = p.categoryid AND p3.unitprice >= p.unitprice) as denserankprice
FROM 
    products p
ORDER BY 
    p.categoryid, p.unitprice DESC;
