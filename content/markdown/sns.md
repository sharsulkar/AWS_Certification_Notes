# Simple Notification Service (SNS)  
**Service category:** Core service> notification management  
**Resiliency scope:** Region  
**Service scope:**   
**Service access:** Public  
**Service model:**  
**key words:**   
---
* coordinates sending and delivery of messages which are <=256KB  
* SNS topic - base entity of SNS - permissions and config are controlled at the topic level  
* publisher - sends message to a topic eg public api, aws services etc  
* subscribers - recieves messages - can be one or more eg. HTTP, email, SQS, Mobile push, SMS, Lambda  
* subscribers will receive all messages published to the topic but a filter can be applied to limit what messages get delivered  
* SNS offers delivery status, delivery retries (reliable delivery)  
* SNS is capable of Server side encryption  
* can be used cross-account using topic policy (resource policy)  
