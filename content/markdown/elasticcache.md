# ElasticCache  
**Service category:** Storage > in-memory DB  
**Resiliency scope:**   
**Service scope:**   
**Service access:**   
**Service model:**   
**key words:** read heavy workloads with low latency requirements  

* in-memory cache  
* provides access to Redis or Memcached engines  
  * Memcached -  
    * support simple data structures like int, string etc  
    * no replication, but supports data sharding(segmentation) over multiple nodes  
    * no backups  
    * multi-threaded - works best for multi-core CPUs where all cores can be used for parallel processing  

  * Redis -  
    * support advanced data structures like lists, arrays etc  
    * Multi-AZ data replication for read scaling  
    * supports backup and restore  
    * transactions - multiple operations are part of a transaction, transaction is success if all operations complete else transaction is fail and no changes done to data. Important for write consistency  

* requires application changes to the code to use elastic cache  
* applications -  
  * cost effective scaling for read heavy applications  
  * place to store user sessions data for stateless servers  
  * reduce DB read costs  
  * need sub-milisec access to data   
