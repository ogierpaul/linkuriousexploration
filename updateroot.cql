MATCH (n:DunsID)
SET
n.isgu = FALSE,
n.nfathers = 0;

MATCH (n:DunsID)
OPTIONAL MATCH (n)-[r:isChildOf]->(c)
WITH n, count(c) AS nfathers
SET n.nfathers = nfathers;

MATCH (n:DunsID)
WITH n, (CASE n.nfathers WHEN 0 THEN True ELSE False END) as root
SET n.isgu = root;


MATCH (n:DunsID)-[:isChildOf*0..]->(p:DunsID)
WHERE p.isgu=TRUE
WITH n,p
SET n.gu_duns_calculated=p.duns,
n.gu_name_calculated=p.name;






