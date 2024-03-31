use [nortwind3-ms-2019]

;with tmp(id , ProductID, Date, Value)
as
(
	select ph.id, ph.ProductID,
	  ph.Date,
	    sum(Value) OVER (PARTITION BY ph.ProductID, ph.date  ) 
		from product_history ph
	
	group by ph.ProductID, ph.date , ph.value,ph.id
)
select 
		t.id, 
		t.ProductID,
		t.Date,
		t.Value as Value,
		sum(t.Value)  OVER(PARTITION BY ProductId, MONTH(t.Date)
       ORDER BY ProductId ,Date   ROWS UNBOUNDED PRECEDING)  AS CumulativeValueMonth

from tmp t
group by t.ProductID,
		t.Date,
		t.Value, 
		Id
order by   id , ProductId ,Date 




;with tmp(id , ProductID, Date, Value)
as
(
	select ph.id, ph.ProductID,
	  ph.Date,
	    sum(Value) OVER (PARTITION BY ph.ProductID, ph.date  ) 
		from product_history ph
	group by ph.ProductID, ph.date , ph.value,ph.id
)
select  t1.id,
		t1.ProductId,
		t1.Date,
		t1.Value,
		sum(isnull(t2.Value, t1.Value)) as CumulativeValueMonth
from tmp t1
left join tmp t2 on t1.ProductId = t2.ProductId 
				and Month(t2.Date) = Month(t1.Date) 
				and Year(t2.Date)  = Year(t1.Date) 
				and t2.Date<=t1.Date
Group by t1.Date , t1.Value, t1.ProductId, t1.id 
order by t1.id , t1.ProductId , t1.Date
