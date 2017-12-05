MATCH (n:DunsID)<-[:hasDuns]-(erps:ErpID)
SET
n.2016_nodeordervolume = sum(erps.2016_ordervolume),
n.2017_nodeordervolume = sum(erps.2017_ordervolume),
n.2016_nodeturnover = sum(erps.2016_turnover),
n.2017_nodeturnover = sum(erps.2017_turnover);

MATCH (n:DunsID)<-[:isChildOf*0..]-(childs:DunsID)<-[:hasDuns]-(erps:ErpID)
WITH n,DISTINCT(erps) as derps
SET
n.2016_aggregatedordervolume = sum(derps.2016_ordervolume),
n.2017_aggregatedordervolume = sum(derps.2017_ordervolume),
n.2016_aggregatedturnover = sum(derps.2016_turnover),
n.2017_aggregatedturnover = sum(derps.2017_turnover);