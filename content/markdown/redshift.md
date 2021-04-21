**Service category:** Storage > Datawarehouse  
**Resiliency scope:** AZ (because of automatic S3 backups)  
**Service scope:** AZ  
**Service access:** private (VPC service)  
**Service model:** DWaaS (datawarehouse as a service)  
**key words:** OLAP DB (column based), petabyte scale Datawarehouse, not for adhoc queries  

* pay as you use service  
* Redshift spectrum - directly query S3 data  
* federated query - query other DBs  
* integrates with AWS tooling like quicksight  
* provides SQL like interface JDBC/ODBC connections  
* provisioned service on a cluster, server based  
* cluster has leader node that handles query input, resource planning, creating execution plan and result aggregation  
* comput nodese execute queries assigned to them by leader node and returns data back to leader node  
* redshift is a VPC service - VPC security, IAm permissions, KMS at rest encryption, CW monitoring  
* enhanced VPC routing - for customized networking requirements  
* Resiliancy - 
  * data is replicated to 1 additional node  
  * automatic incremental snapshots to S3 every 8 hours/5GB with 1 day retention by default (can be set to 35 days max), can be configured for manual backups  
* getting data into redshift -  from S3, DMS(data migration service), firehose can stream data into redshift  
