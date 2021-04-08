# DyanamoDB  
**Service category:** Storage > Database > NoSQL Key-Value store  
**Resiliency scope:** AZ or globally for extra charge  
**Service scope:** Region  
**Service access:** Public  
**Service model:** DBaaS  
**key words:**  NoSQL, key-value  

* tables are the basic unit. it is a grouping of items that share the **same primary key** where the key is unique for each item. no limit on number of items in a table.  
* primary key can be simple (partition) or composite (partition + sort) key  
* no restriction on content of items. they can have none, all, different or a mixture of attributes. there is no rigid attribute schema restriction like RDS  
* **item can be a max 400KB in size**  
* in dynamodb, capacity=speed. capacity model can be provisioned(predefine capacity per table) or on-demand(pay-as-you-go)  
* billing is based on capacity, storage and features  
* for provisioned model - 
  * **write capacity unit (WCU)** - 1 WCU = 1KB/sec write  
  * **read capacity unit (RCU)** - 1 RCU = 4KB/sec read (strong consistent read)  
  * every operation uses atleast 1 W/RCU  
  * in this model, preset RCU and WCU values per table  
  * every table has a RCU and WCU burst pool (300 sec)  

* for on-demand -
  * used when load is unknown, unpredictable, low admin  
  * capacity managed by AWS  
  * billing - price per million R or W units - it can be 5X costly compared to provisioned  

* Read operations -
  * **query** - have to specify only one partition key value, attributes can be filtered but you are billed for the capacity consumed by the entire item  
  * **scan** - very flexisble on what attribute is to be filtered on, but it scans all items in the table and thus you are billed for all items that are scanned, even if the data returned is filtered - so very expensive operation  

* **replication read consistency** - 
* when can the writes to the table be reliably read from all replicated copies  
* table is replicated over multiple AZs. each replica is called **storage node.** Out of all replicas, one is elected as leader node and is used for all writes. Reads can be from any storage note. If the primary fails, another one is elected in its place.    
  * **eventual consistent read** - 
    * can use any of the replicas for read,  
    * easier to implement,  
    * scales well,  
    * small chance that you might be reading stale data,  
    * half price of strong consistent read  
  * **strongly consistent read** - 
    * always uses leader node to read,  
    * costly to achieve,  
    * does not scale well  
    * data is always up to date  
 
* **Backups**  
  * on demand backups - 
    * manual, full copy of table, retained until removed  
    * data can be restored to same or cross region, with or without indexes, encryption setting can be changed  
  * point-in-time recovery (PITR) - 
    * disabled by default, needs to be enabled per table  
    * when enabled, it keeps a record of all changes to the table over a 35 day rolling window  
    * data can be restored to any point in time with 1 sec granularity  
 
* WCU and RCU capacity calculations
 1. calculate capacity unit per item round(item_size/X) where X=1KB for write operation, X=4KB for read operation  
 2. multiply by average read/write operations **per second**  
 *for RCU, the above calculation assumes trongly consistent reads, eventual consistent read operations require half the RCU calculated in step 2*  

* Database triggers - event based database architecture   
  * Item changes generate stream events -> event contains what changed -> action is taken using lambda  
  * used in reporting and analytics, aggregation, messaging, notifications  
  * **Streams**  
  * time ordered list of item changes in a table - insert, updates and deletes  
  * over a 24 hour rolling window  
  * need to be enabled on a per table basis  
  * streams can be configured with 4 view types, decides what information is recorded in the stream  
   1. KEYS_ONLY - stream will only record primary key of changed items  
   2. NEW_IMAGE - records the entire item as it was after the change  
   3. OLD_IMAGE - records the entire item as it was before the change  
   4. NEW_AND_OLD_IMAGE - records the entire item as it was before and after the change  
  * 
