--U¿ycie funkcji SDO_INSIDE

SELECT p.name, p.geom
FROM us_parks p, us_states s
WHERE s.state = 'Wyoming'
AND SDO_INSIDE (p.geom, s.geom ) = 'TRUE';

-- podzapytanie

SELECT pp.name, pp.geom FROM us_parks pp
WHERE id IN
(
SELECT p.id
FROM us_parks p, us_states s
WHERE s.state = 'Wyoming'
and SDO_INSIDE (p.geom, s.geom ) = 'TRUE');

--Porównaj wynik z:

SELECT p.name, p.geom
FROM us_parks p, us_states s
WHERE s.state = 'Wyoming'
AND SDO_ANYINTERACT (p.geom, s.geom ) = 'TRUE';

-- W celu wizualizacji u¿yj podzapytania

SELECT pp.name, pp.geom
FROM us_parks pp
WHERE SDO_ANYINTERACT(pp.geom,
(SELECT ss.geom
FROM us_states ss
WHERE ss.state = 'Wyoming')) = 'TRUE';
