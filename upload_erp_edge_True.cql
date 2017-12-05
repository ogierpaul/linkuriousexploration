USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///ErpRelations_normalized.csv' AS csvLine
MATCH (a:ErpID{erpid:csvLine.erpid}),(b:DunsID{ duns: csvLine.target_dunsid})
MERGE (a)-[r:hasDuns]->(b)
    SET
    r.erpid=csvLine.erpid,
	r.edge_label = csvLine.edge_label,
	r.source_relation = csvLine.source_relation,
	r.changed_by = csvLine.changed_by,
	r.changed_at = csvLine.changed_at,
	r.target_dunsid = csvLine.target_dunsid;