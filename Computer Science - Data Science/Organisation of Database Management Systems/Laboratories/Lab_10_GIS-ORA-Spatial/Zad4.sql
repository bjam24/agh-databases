--Zapytanie 1
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c, us_states s
WHERE s.state = 'New Hampshire'
AND SDO_RELATE ( c.geom,s.geom, 'mask=INSIDE+COVEREDBY') = 'TRUE';

--Podzapytanie 1
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c
WHERE SDO_RELATE(c.geom,
(SELECT s.geom
FROM us_states s
WHERE s.state = 'New Hampshire'),
'mask=INSIDE+COVEREDBY') = 'TRUE';

--Zapytanie 2
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c, us_states s
WHERE s.state = 'New Hampshire'
AND SDO_RELATE ( c.geom,s.geom, 'mask=INSIDE') = 'TRUE';

--Podzapytanie 2
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c
WHERE SDO_RELATE(c.geom,
(SELECT s.geom
FROM us_states s
WHERE s.state = 'New Hampshire'),
'mask=INSIDE') = 'TRUE';

--Zapytanie 3
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c, us_states s
WHERE s.state = 'New Hampshire'
AND SDO_RELATE ( c.geom,s.geom, 'mask=COVEREDBY') = 'TRUE';

--Podzapytanie 3
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c
WHERE SDO_RELATE(c.geom,
(SELECT s.geom
FROM us_states s
WHERE s.state = 'New Hampshire'),
'mask=COVEREDBY') = 'TRUE';




