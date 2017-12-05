
    USING PERIODIC COMMIT 10000
    LOAD CSV WITH HEADERS FROM 'file:///ErpID_normalized.csv' AS csvLine
    MERGE (n:ErpID{ erpid: csvLine.erpid })
    SET
    n.erp_system_id = csvLine.erp_system_id,
	n.erp_location_id = csvLine.erp_location_id,
	n.erp_supplier_id = csvLine.erp_supplier_id,
	n.erp_name = csvLine.erp_name,
	n.erp_street = csvLine.erp_street,
	n.erp_zip = csvLine.erp_zip,
	n.erp_city = csvLine.erp_city,
	n.erp_country_name = csvLine.erp_country_name,
	n.erp_tax_no = csvLine.erp_tax_no,
	n.erp_commregno = csvLine.erp_commregno,
	n.2016_turnover = csvLine.2016_turnover,
	n.2016_ordervolume = csvLine.2016_ordervolume,
	n.2017_turnover = csvLine.2017_turnover,
	n.2017_ordervolume = csvLine.2017_ordervolume,
	n.data_status = csvLine.data_status,
	n.erpid = csvLine.erpid;
