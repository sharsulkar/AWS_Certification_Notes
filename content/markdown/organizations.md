# AWS Organizations  
## Description  
* AWS organization is a container for AWS accounts. It helps big enterprises and companies with hundreds of AWS accounts manage them 
and reduce admin overhead of maintaining IAM identities in each account separately.  
* When AWS organization is to be created one of the account will be tagged as a Master/Payer/Management account and other accounts that will be part of the organization 
are called member accounts.  
* When existing accounts are added to the organization as member accounts, the management account will send a request which needs to be approved by the members.  
* New member accounts can be created directly from the organization, in which case, member approval for adding to the org is not required.  
* Management account is a special account and there can only be one of that in an organization. It is also called Payer account because all charges incurred by member accounts will be consolidated and payed through the 
management account. This consolidation is helpful for claiming resourse reservations and volume discounts.  
* The accounts in an organization can be arranged in a hierarchy with Organizational Root (OR) at the head and Organizational Units (OU) arranged as a tree. 
This is used for creating a logical hierarchy suitable for the business. OUs can be nested - OUs can be part of other OUs. The OR and OU can have management as well as member accounts.  
* When using AWS organization architecture, it is best practice to use a single account to exclusively handle IAM users and use roles in other member accounts 
to access resources. This reduces admin overhead of managing identities in multiple accounts.  

## Service Control Policy (SCP)  
* They are only applicable in the context of an AWS organization. SCPs are account permission boundaries. Unlike permission policies, they do not grant resource permissions. 
They limit what an account (including the account root user) in an organization can do.  
* SCPs do not apply to the management account. They only apply to member accounts, OUs and member accounts within nested OUs.  
* SCPs are json documents with similar structure as other policies.  
* SCP can be architected in 2 ways - Allow list and Deny list.  
* When an org is created, the default SCP applied is a FullAWSAccess so all services within all member accounts can be accessed by identites authorized by the permission 
policy in the respective accounts. Services that need to be restricted need to be Denied explicitly. This is the Deny list SCP architecture. This is recommended approach
as admin overhead is minimum as AWS adds new services.  
* For Allow list architecture to be implemented, the default FullAWSAccess SCP need to be removed and a SCP with services that are allowed need to be created.  
* 
