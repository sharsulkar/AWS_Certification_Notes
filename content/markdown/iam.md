# Identity and Access Management  
**Service category:** Core Service > Access control  
**Resiliency scope:** Region  
**Service scope:** Global  
**Service access:** Public  
**Service model:** NA 
**key words:**   

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
* The principal has to prove to IAM that it is the identity it is claiming it to be by providing identity specific authentication credentials. It can be either a username and password for human identities or Access keys for CLI and non-human identities.  
* Once the principal authenticates successfully, it becomes a authenticated identity.  
* AWS has a record of all the policies associated with this authenticated identity which it uses for authorizing access to the resources the identity is trying to access.  

### Access Management  
#### Identity Policy  (Permissions policy)
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

#### Permission Boundary  
* Used for role delegation. 
* The boundary limits what actions a particular role is authorized to do and it overrides any permission policy assigned to that role.  

### Identity Management  
#### IAM Users 
* Identity used for anything requiring long term access to AWS resources. eg humans, applications and service accounts.  
* **Can only have 5k IAM users per account** so cannot be used for internet-scale application with millions of users.  

#### IAM Groups  
* Containers for IAM users  
* You cant login to IAM groups and they dont have separate credentials of their own  
* They are used solely to organize IAM users for easy management  
* Users can be part of multiple groups  
* groups can have policies attached to them  
* **1 IAM user can be a member of 10 groups.**   
* **There is no limit on how many users are part of one group (so max users is 5k per account)**  
* **300 groups per account soft limit but can be increased using a support ticket**  
* **No group nesting - groups cannot be within groups, only users can be added in groups**  
* **Resource policy CANNOT grant access to a group using ARN because group is not a true identity**  

#### IAM Roles  
* best suited for multiple "principals" or unidentified "principals" or external identity 
* short term access  
* Roles have 2 types of policies attached - Trust policy, Permission policy  
* The **trust policy** specifies what identities can assume the role. These identities can be users from the same or different AWS account, services or anonymous identities.  
* **Permissions policy** is same as identity policy discussed above and it authorizes access permissions to AWS resources listed in the policy.  
* When an identity assumes a role, temporary credentials are generated by AWS STS (Secure token service) and attached to the identity using sts:AssumeRole operation. These credentials are valid for a limited amount of time after which they expire. If the identity needs to assume the role for longer, new set of temporary credentials are generated.  
* Use cases to use roles instead of users - 
    1. Identity federation - When migrating to AWS service where existing identity management system is already in place, for eg Windows Active Directory. The existing identity management system can be used for authentication which can be trusted by the AWS role using the trust policy. The AWS role can then be used to access required AWS services using the permission policy.  
    2. Multi-account access to AWS services, for eg in case of common storage or logging consolidation. The account where the service resides owns the service, all identities that need access can be authenticated through a role in the local account.  
    3. Web identity federation - for internet scale apps where the end users dont have AWS accounts. A role can be setup that trusts thrid party authenticated logins like google, facebook etc and has required permissions for accessing AWS services. This also ensures that no AWS creds are stored on the app.  
    4. Emergency-only access - For support teams that need ready only access for their day to day functioning by might require admin access in case of emergencies.  
    
