use [nortwind3-ms-2019]

select productid, 
       productname, 
       unitprice, 
       categoryid,
       first_value(productname) over (partition by categoryid 
                                      order by unitprice desc) first,
       last_value(productname)over (
                     partition by categoryid 
                     order by unitprice desc 
                     RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) last
from products
order by categoryid, unitprice  desc 




select p.productid, 
       p.productname, 
       p.unitprice, 
       p.categoryid, 
       p_min.ProductName as MinProductName ,
       p_max.ProductName as MaxProductName 
from products p
join (
	select CategoryId, min(UnitPrice) as minPrice, max(UnitPrice) as maxPrice
	from products
	group by CategoryID
	) as x on 1 = 1
join products p_min on p_min.UnitPrice = x.minPrice 
                       and p_min.CategoryID = x.CategoryID 
                       and p.CategoryID = p_min.CategoryID
join products p_max on p_max.UnitPrice = x.maxPrice 
                       and p_max.CategoryID = x.CategoryID 
                       and p.CategoryID = p_max.CategoryID
order by  p.categoryid , p.unitprice desc;

