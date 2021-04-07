# Simple Queue Service (SQS)  
**Service category:** Core service> message queue management  
**Resiliency scope:** Region  
**Service scope:**   
**Service access:** Public  
**Service model:**  
**key words:**  
---
* fully managed highly available queues  
* encryption at rest(KMS) and in-transit supported  
* Access to queues managed ith Identity and/or queue policy (resource policy)  
* used for decoupling of highly connected architectures, asynchronous communication between components and auto-scaling of compute resources based on queue length  
* message size limit - 256KB, for larger object - store object in S3 and put link in the message (**using Extended client library**)  
* each queue has a retention period for the messages entered into it, it is tracked using the **Enqueue timestamp**. messages in the queue not consumed by their retention period are dropped by SQS  
* polling - the recievers poll the queue for any new messages. if message is found, it is extracted by the receiver but it is not deleted from the queue. It is just hidden for a time period called **VisibilityTimeout period**. the receiver has to explicity delete the message from the queue once processing is finished. If not deleted, the message becomes visible again after VisibilityTimeout period expires and can be received by the receiver. This mechanism ensures fault tolerence against loss of messages due to failures in the reciever side. This allows automatic reprocessing of messages by default.  
* VisibilityTimeout period default is 30sec and is configurable with values between 0sec and 12 hours. this can be changed on the queue or on the message  
* billed based on number of polling requests - 1 request=1-10 messages up to 64KB total, more polling=more costly  
* 2 types of polling -  
 1. short polling - queue responds immediately with 0-10 messages per request, costly for near empty queues  
 2. long polling - can specify waitTimeSeconds upto 20 sec, if queue is empty, it will wait for upto 20 secs for new messages. if queue is not empty, 10 messages or 64KB will be returned per request  
* **dead letter queues** -  
 * queue where problematic messages or recurring failures can be moved for special handling   
 * MaxReceiveCount can be defined whereby if the message is consumed by the receiver but not explicitly deleted, the message is moved to deadletter queue after MaxReceiveCount tries  
 * alarms can be setup when any entry happens in this queue  
 * single deadletter queue can be used for multiple source queues  
 * the retension period of deadletter queue should be higher than normal queue, enqueue timestamp of messages is not adjusted/reset when messages are moved in there   
* **delay queue** -  
 * allow to postpone delivery of messages in the queue  
 * configure **Delayseconds** value for which the messages are not visible for polling  
 * default value for Delayseconds is 0, max is 15 minutes  
 * per message delay can be set using message timers, but is it not supported in FIFO queues as it guarantees ordered delivery  

* **fanout architecture** using SNS and SQS - important topic *refer slide*  
* 2 types of queues - standard and FIFO  
 **1. Standard**  
  * guarantees at-least-one delivery(messages can be delivered more than once) but order of messages may or may not be maintained (like a multilane highway where messages can overtake each other)  
  * scales much better  
  * best used for decoupling architectures, batching items for future processing  
 
 **2. FIFO**  
  * guarantees exactly-one delivery and order is maintained (like a single lane road)  
  * 3000 messages/sec with batching, 300 messages/sec without  
  * FIFO queue needs to have ".fifo" suffux  
  * best used for application where input order is very important eg workflow ordering, command ordening, price adjustment etc 
 
