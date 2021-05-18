# CloudWatch  
**Service category:** Monitoring  
**Resiliency scope:**   
**Service scope:** -   
**Service access:** - Public  
**Service model:**   
**key words:** Metrics, Alarms  

* Ingestion, storage and management of metrics  
* Namespace = container for metrics per service  
* Datapoint - timestamp, value and unit of measure  
* Metric - time ordered set of data points  
* Dimension - name-value pair within a metric  
* Resolution - standard = 60s, high = 1s  
* data retention - as data ages, its aggregated and stored for longer with less resolution  
  * <60s -> 3 hours, 60s -> 15 days, 300s -> 63 days, 3600s -> 455 days  
* Alarms - monitors a metric over a time period to check against a predefined criteria and perform some action  
* Logs - Public service to store, monitor and access to logging data. Regional service  
  * CWAgent - system or custom application logging  
  * Ingestion -  
  * Subscription - 
