USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///DunsRelations_normalized.csv' AS csvLine
MATCH (a:DunsID{duns:csvLine.source_id}),(b:DunsID{ duns: csvLine.target_id})
MERGE (a)-[r:isChildOf]->(b)
SET
    r.source_id = csvLine.source_id,
	r.edge_label = csvLine.edge_label,
	r.target_id = csvLine.target_id,
	r.levelofsource = csvLine.levelofsource,
	r.source_relation = csvLine.source_relation,
	r.changed_by = csvLine.changed_by,
	r.changed_at = csvLine.changed_at;
