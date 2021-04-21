# FSx for windows file server  
**Service category:** Storage > Network File system > Windows file server  
**Resiliency scope:** single/multi-AZ    
**Service scope:**   
**Service access:** Private  
**Service model:** FSaaS  
**key words:**  Windows OS, Active Directory, VSS, SMB, distributed file system (DFS)  

* Fully managed native windows file server/shares  
* integrates with active directory service or self-managed AD (on-premise)  
* can be implemented as a single or multi-AZ within a VPC  
* on-demand and scheduled backups  
* file shares are accessible using VPC, Peering, VPN, Direct Connect  
* supports deduplication, KMS at-rest encryption and enforced encryption in transit  
* access via SMB protocol which is standard for windows  
* VSS - user-driven restores  
* windows permission model  
* FSx for lustre -  
  * managed Lustre - designed for high performance computing Linus clients (POSIX)  
  * applications - big data, ML, financial modelling  
  * 2 types of deployment types - scratch and persistent  
    * scratch - short term, no HA, no replication  
    * persistent - long term, HA in one AZ, self-healing for hardware failures  
