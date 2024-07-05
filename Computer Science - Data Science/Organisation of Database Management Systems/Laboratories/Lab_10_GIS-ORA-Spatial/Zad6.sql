SELECT c.city, c.state_abrv, c.location FROM us_interstates i, us_cities c WHERE i.interstate = 'I4' AND sdo_nn(c.location, i.geom, 'sdo_num_res=5') = 'TRUE';

--a)

SELECT c.city, c.state_abrv, c.location
FROM us_cities c  
WHERE ROWID IN  (
    SELECT c.ROWID 
    FROM us_rivers i, us_cities c 
    WHERE i.name = 'Mississippi' AND sdo_nn(c.location, i.geom, 'sdo_num_res=5') = 'TRUE'
);


--b)

SELECT c.city, c.state_abrv, c.location
FROM us_cities c  
where c.city = 'New York'

SELECT c.city, c.state_abrv, c.location
FROM us_cities c  
WHERE ROWID IN  (
    SELECT c.ROWID 
    FROM us_cities i, us_cities c 
    WHERE i.city = 'New York'  and c.city <> 'New York' AND sdo_nn(c.location, i.location, 'sdo_num_res=4') = 'TRUE'   
);

--c)


SELECT c.county, c.state_abrv, c.geom
FROM us_counties c 
WHERE ROWID IN  (
    SELECT i.ROWID 
    FROM us_counties i, us_cities c 
    WHERE c.city = 'New York'  AND sdo_nn(  i.geom,c.location, 'sdo_num_res=5') = 'TRUE'   
);

--d)

SELECT c.ROWID ,c.city,  c.location ,SDO_GEOM.SDO_DISTANCE (c.location, i.geom, 0.5 , 'unit=mile') as DISTANCE_MILES
FROM us_interstates i, us_cities c  
WHERE i.interstate = 'I170' AND sdo_nn(  c.location,i.geom, 'sdo_num_res=5') = 'TRUE'


--e)

SELECT c.city, c.location 
FROM  us_cities c 
WHERE c.id IN ( 
 SELECT c.id 
 FROM us_interstates i, us_cities c 
 WHERE i.interstate = 'I170' 
 AND c.pop90 > 300000 
 ORDER BY SDO_GEOM.SDO_DISTANCE(c.location, i.geom, 0.5, 'unit=mile')
 FETCH FIRST 5 ROWS ONLY) ;

--f)

--Przyklad 1

SELECT c.ROWID, c.city,  c.location, SDO_GEOM.SDO_DISTANCE(c.location, p.geom, 0.5, 'unit=mile') AS DISTANCE_MILES
FROM us_cities c, us_parks p
WHERE p.name = 'Yellowstone NP'
 AND SDO_NN(c.location, p.geom, 'sdo_num_res=5') = 'TRUE'
order by DISTANCE_MILES desc;

select *
from us_parks
where name  = 'Yellowstone NP'


--Przyklad 2

select *
from us_cities
where city = 'Los Angeles' AND state_abrv = 'CA' 
SELECT r.name, r.geom
FROM us_rivers r
WHERE r.ROWID IN (
  SELECT r.ROWID
  FROM us_rivers r, us_cities c
  WHERE c.city = 'Los Angeles' AND c.state_abrv = 'CA'
  AND SDO_NN(r.geom, c.location, 'sdo_num_res=3') = 'TRUE'
);


