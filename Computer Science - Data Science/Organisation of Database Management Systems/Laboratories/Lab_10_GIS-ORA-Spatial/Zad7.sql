
SELECT SDO_GEOM.SDO_LENGTH (geom, 0.5,'unit=kilometer') length FROM us_interstates WHERE interstate = 'I4';

--a)

SELECT SDO_GEOM.SDO_LENGTH (geom, 0.5,'unit=kilometer') length  
FROM us_rivers 
WHERE name = 'Mississippi';

--b)

SELECT interstate, SDO_GEOM.SDO_LENGTH(geom, 0.5,'unit=kilometer') AS length
FROM us_interstates
ORDER BY length DESC
FETCH FIRST 1 ROWS ONLY;


SELECT interstate, SDO_GEOM.SDO_LENGTH(geom, 0.5,'unit=kilometer') AS length
FROM us_interstates
ORDER BY length
FETCH FIRST 1 ROWS ONLY;


--c)


SELECT name, SDO_GEOM.SDO_LENGTH(geom, 0.5,'unit=kilometer') AS length
FROM us_rivers
ORDER BY length DESC
FETCH FIRST 1 ROWS ONLY;

SELECT name, SDO_GEOM.SDO_LENGTH(geom, 0.5,'unit=kilometer') AS length
FROM us_rivers
ORDER BY length
FETCH FIRST 1 ROWS ONLY;


--d)

SELECT state_abrv, SDO_GEOM.SDO_LENGTH(geom, 0.005) AS boundary_length
FROM us_states
ORDER BY boundary_length DESC
FETCH FIRST 5 ROWS ONLY

--e) 

--Przyklad 1

SELECT *
FROM US_PARKS c
WHERE c.ROWID IN  (
SELECT p.ROWID
FROM US_PARKS p, US_STATES s
WHERE s.state = 'California'
AND SDO_CONTAINS(s.geom, p.geom) = 'TRUE');


--Przyklad 2

SELECT DISTINCT r.name
FROM US_RIVERS r, US_STATES s
WHERE (s.state = 'Texas' OR s.state = 'Louisiana')
AND SDO_RELATE(r.geom, s.geom, 'mask=ANYINTERACT') = 'TRUE';
Zapytanie: 
SELECT DISTINCTsr.ROWID
FROM  US_STATES s
WHERE (s.state = 'Texas' OR s.state = 'Louisiana')

SELECT c.ROWID, c.NAME, c.GEOM
FROM US_RIVERS c
WHERE c.ROWID IN  (
SELECT DISTINCT r.ROWID
FROM US_RIVERS r, US_STATES s
WHERE (s.state = 'Texas' OR s.state = 'Louisiana')
AND SDO_RELATE(r.geom, s.geom, 'mask=ANYINTERACT') = 'TRUE');
