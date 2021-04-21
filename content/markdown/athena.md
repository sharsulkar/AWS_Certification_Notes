# Amazon Athena  
**Service category:** Storage > Database >   
**Resiliency scope:**   
**Service scope:**   
**Service access:**   
**Service model:**   
**key words:** schema-on-read, adhoc sql queries on S3 data  

* Serverless interactive querying service  
* adhoc queries on data stored on S3, supports structured, semi and unstructired data  
* schema-on-read - Athena translates the S3 data into a table like schema on the go, without changing the original S3 data it is reading  
* pay only for data that is consumed and S3 storage costs  
* output can be sent to other services, athena can be used in serverless architecture  
* it is like redbms views - the logic/recipie is defined in athena that translates the S3 data into the user defined schema structure and presents it to the user as a table that can then be queried using SQL. for each user query, athena then translates the S3 data using the predefined logic without making any changes to the underlying data and presents the outcome to the user  
