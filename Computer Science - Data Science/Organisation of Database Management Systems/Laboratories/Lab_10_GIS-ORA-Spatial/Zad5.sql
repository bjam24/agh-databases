
SELECT * FROM us_interstates 
WHERE interstate = 'I4' ;
SELECT * FROM us_states 
WHERE state_abrv = 'FL'; 

SELECT c.city, c.state_abrv, c.location  
FROM us_cities c 
WHERE ROWID IN  
(  
SELECT c.rowid 
FROM us_interstates i, us_cities c  
WHERE i.interstate = 'I4' 
AND sdo_within_distance (c.location, i.geom,'distance=50 unit=mile') 
= 'TRUE'  
);

--a)
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c  
WHERE ROWID IN  
(  
SELECT c.ROWID
FROM us_interstates i, us_counties c
WHERE i.interstate = 'I4' 
AND  SDO_RELATE (c.geom, i.geom, 'mask=ANYINTERACT') = 'TRUE'
);

--b)

SELECT c.county, c.state_abrv, c.geom
FROM us_counties c 
WHERE ROWID IN  
(  
SELECT c.rowid 
FROM us_interstates i, us_counties c  
WHERE i.interstate = 'I4' 
AND sdo_within_distance (c.geom, i.geom,'distance=10 unit=mile') 
= 'TRUE'  
);

--c)

SELECT r.name, r.geom 
FROM us_rivers r 
WHERE ROWID IN  
(  
SELECT r.ROWID
FROM us_interstates i, us_rivers r
WHERE i.interstate = 'I4' 
AND  SDO_RELATE (r.geom, i.geom, 'mask=ANYINTERACT') = 'TRUE'
);

--d)

SELECT geom FROM us_rivers WHERE name = 'Mississippi'
SELECT * FROM us_states ;
SELECT DISTINCT i.id, i.interstate , i.geom
FROM us_interstates i
WHERE SDO_RELATE(i.geom, (SELECT geom FROM us_rivers WHERE name = 'Mississippi'), 'mask=ANYINTERACT') = 'TRUE';

--e)

SELECT c.city, c.state_abrv, c.location  
FROM us_cities c 
WHERE ROWID   IN  
(  
SELECT c.rowid 
FROM us_interstates i, us_cities c  
WHERE i.interstate = 'I275' 
AND 
 SDO_GEOM.SDO_DISTANCE (c.location, i.geom, 0.0001 , 'unit=mile') between 15 and  30);


--f)

--Przyklad 1

select c.name, c.geom
FROM us_parks c  
WHERE ROWID IN  
(  
SELECT distinct c.rowid 
FROM us_cities i, us_parks c  
WHERE i.city = 'New York' 
AND sdo_within_distance (c.geom, i.location,'distance=5 unit=mile') 
= 'TRUE'  );


--Przyklad 2

SELECT DISTINCT i.id, i.state  , i.geom
FROM us_states i
WHERE SDO_RELATE(i.geom, (SELECT geom FROM us_rivers WHERE name = 'Mississippi'), 'mask=ANYINTERACT') = 'TRUE'




