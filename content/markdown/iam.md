# Identity and Access Management  
## AWS Account  
* AWS Account is a container for identities and resources. It isolates resources and identities between different accounts and thus can localize impact of issues and security threats to a single account.  
* Creating an account requires a unique email address and a credit card. Email address is used to create a root user and credit card is used a payment method for resources used. AWS is a pay-as-you-use service.  
* When AWS account is created, the root user is also created. The root user has unrestricted access to all resources within the account. This access cannot be controlled later using IAM.  
* By default, all IAM identities and all external identities cannot access resources within an AWS account. Access has to be explicitly given.  

## Identity and Access Management (IAM)  
* Used to create and manage identities that can access AWS resources within the same or different accounts.  
* Identities can be users, groups, roles.  
* Identity policy is a type of policy that gets attached to identities.  

### Authentication and Authorization  
* IAM handles both of them  
* The entity trying to access AWS resources is called a "principal".  
* The principal has to prove to IAM that it is the identity it is claiming it to be by providing identity specific authentication details. It can be either a username and password for human identities or Access keys for CLI and non-human identities.  
* Once the principal authenticates successfully, it becomes a authenticated identity.  
* AWS has a record of all the policies associated with this authenticated identity which it uses for authorizing access to the resources the identity is trying to access.  

### Access Management  
#### Identity Policy  
* Policy document is a set of security statements to AWS that can GRANT or DENY access to resources to any identity that uses the policy.  
* AWS resources use this document to authorize access requests from identities.  
* written in JSON  
* It is a set of "statement blocks", each statement lists the resource and access needed.  
* Identities and policies can have a many-many relationship  
* What makes up a statement -  
    1. sid - Statement id - optional, identifies what the statement does to user   
    2. Action - format is service:operation  
    3. Resource - list of resources, use Amazon Resource Name (ARN) format to give specific resources  
    4. Effect - Allow or Deny  
* AWS matches the action and resource part of the statement and uses the effect part to authorize. 

##### How to handle overlap in statements  
Follow the priority list below -  
1. Explicity Deny  
2. Explicity Allow  
3. Implicit Deny (Default)  
If an identity has one or more policies attached to it or it is part of a group with an attached policy or its trying to access a resource that has a resource policy, AWS will go through all these applicable policies and apply the above given priority to authorize access.  

##### Type of policies  
1. Inline policy - separate policy instance attached to each identity  
2. Managed policy - single policy instance attached to multiple identites. Low management overhead, Reusable and can scale to large number of identities.  
    a. Customer managed  
    b. AWS managed  

### Identity Management  
#### IAM Users 
* Identity used for anything requiring long term access to AWS resources. eg humans, applications and service accounts.  
* 
