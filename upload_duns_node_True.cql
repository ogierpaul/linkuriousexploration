
    USING PERIODIC COMMIT 10000
    LOAD CSV WITH HEADERS FROM 'file:///DunsID_normalized.csv' AS csvLine
    MERGE (n:DunsID{ duns: csvLine.duns })
    SET
    n.dunsid = csvLine.dunsid,
	n.name = csvLine.name,
	n.businessname = csvLine.businessname,
	n.street = csvLine.street,
	n.city = csvLine.city,
	n.zip = csvLine.zip,
	n.state = csvLine.state,
	n.country_code = csvLine.country_code,
	n.commregno = csvLine.commregno,
	n.rank_2016 = csvLine.rank_2016,
	n.source_relation = csvLine.source_relation,
	n.dnb_dp_duns = csvLine.dnb_dp_duns,
	n.dnb_dp_name = csvLine.dnb_dp_name,
	n.dnb_dp_city = csvLine.dnb_dp_city,
	n.dnb_dp_countrycode = csvLine.dnb_dp_countrycode,
	n.dnb_du_duns = csvLine.dnb_du_duns,
	n.dnb_du_name = csvLine.dnb_du_name,
	n.dnb_du_city = csvLine.dnb_du_city,
	n.dnb_du_countrycode = csvLine.dnb_du_countrycode,
	n.dnb_gu_duns = csvLine.dnb_gu_duns,
	n.dnb_gu_name = csvLine.dnb_gu_name,
	n.dnb_gu_city = csvLine.dnb_gu_city,
	n.dnb_gu_countrycode = csvLine.dnb_gu_countrycode,
	n.dnb_out_of_bus = csvLine.dnb_out_of_bus,
	n.data_status = csvLine.data_status;
