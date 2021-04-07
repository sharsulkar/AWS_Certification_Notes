# Eventbridge  
**Service category:** Core service> event management  
**Resiliency scope:**   
**Service scope:**   
**Service access:**   
**Service model:**  
**key words:**   
---
* replacing cloudwatch events, is superset of cloudwatch events features  
* plus it can handle events from third parties and custom applications  
* event bus - stream of events that occur from any supported service in the AWS account  
* cloudwatch events and eventbridge both have a default event bus for the account, but in eventbridge additional buses can be created  
* producer service - creates event when some change of state happens  
* rules used to pattern match events on the bus or time based (cron formated expressions) rules to route the event to one or more targets that perform some predefined action  
* events are json format, the data inside the event can be used by target  
