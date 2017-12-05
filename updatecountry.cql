MATCH (n:DunsID)
SET
n.isdu = FALSE,
n.tier = 0;

//firsttry
MATCH (n:DunsID)-[:isChildOf*0]->(parents:DunsID)
WITH n,count(distinct(parents))-1 as n_parents
SET n.tier = n_parents;

MATCH (n:DunsID)
OPTIONAL MATCH (n)-[r:isChildOf*1..]->(c)
WHERE c.country_code = n.country_code
WITH n, count(c) AS n_countryfathers
SET n.n_countryfathers = n_countryfathers;

//GLOBAL UPDATE
MATCH (n:DunsID)
WITH n, (CASE n.n_countryfathers WHEN 0 THEN True ELSE False END) as countryroot
SET n.isdu = countryroot;

MATCH (n:DunsID)-[:isChildOf*0..]->(p:DunsID)
WHERE p.isdu=TRUE
WITH n,p
SET n.du_duns_calculated=p.duns,
n.du_name_calculated=p.name;
