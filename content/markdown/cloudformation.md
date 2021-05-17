# CloudFormation  
**Service category:** Infrastructure as code  
**Resiliency scope:**   
**Service scope:**   
**Service access:**   
**Service model:**   
**key words:**   

* Template - Json/yml document describing the infrastructure requirements described as logical resources. It is reusable, portable over multiple regions and can be stored in a code repository for version control.  

* CFN converts the logical resources from the template to a stack of corresponding physical resources. Stack is strongly coupled with the template. Any changes in template result in creation/updation or deletion of the physical resources in the stack. All resources within a stack share a lifecycle  

* Physical resources are created in parallel except when there is implicit dependancy that AWS knows about or explicit dependancy mentioned in the template using DependsOn tag  

* **Template structure** - template has some mandatory and optional fields  
  * AWSTemplateFormatVersion - *optional* Version of the template  
  * Description - *optional* template description, if used - it should always follow version  
  * Resources - *mandatory* describe the logical resources that should be created using this template  
  * Metadata - *optional* template metadata  
  * Parameters - *optional* user inputs needed from CLI/console/API when stack is created  
    * Pseudo parametes - AWS makes them available by default - for eg. AWS::Region, AWS::Stackid, AWS::StackName, AWS::Accountid  
  * Mappings - *optional* key-value pairs that can be used as lookup by the template for any conditional logic used  
  * Conditions - *optional* conditional logic for resource creation  
  * Transforms - *optional*  
  * Outputs - *optional* user defined read-only output fields that will be generated on successful creation of physical resources  
  
* Intrinsic functions - to get access to dynamic data/parameters during stack runtime  
  * Ref & Fn::GetAtt - reference a logical resource within the template and get access to the values of its attributes  
  * Fn::Join & Fn::Split - string functions, used to dynamically create urls for public access to resources  
  * Fn::GetAZs & Fn::Select - get list of AZs in the region and select one of them using a given numeric index  
  * logical conditions - Fn::IF, AND, Equals, Not, Or  
  * Fn::Base64 & Fn::Sub - to convert user data/scripts to resources that are passed to resources from plain english to Base64 encoding, Sub is used to substitute values during runtime  
  * Fn::Cidr - dynamically assigns cidr blocks for subnets  

* For complex requirements like bootstrapping a EC2 or creating ASG with launch config -  
  * When physical resources are created by the stack, the resource sends a signal to the stack indicating that it is created. The stack monitors this signal and changes the status to complete in CFN. After this, the stack does not have any access to the health status of that resource.  
  For advanced requirements where the resource needs time and initial processing(configuration changes) to become active, the CFN status is misleading and there is a chance that the resource might not be active due to some failure during the initial processing.  
  As CFN stack cannot monitor the health of resources after they are created, CFN bootstrapping utility provides cfn-signal function that runs on the resource and can send a success/failure response after the resource is created and initial response sent to stack. This can be done using 2 methods -  
  * WaitCondition - not recommended, but might be required for integration to outside dependancies  
    * should be listed as a resource in the template  
    * specifies the time-out period for which CFn waits for a success signal from the resource, if recieved - CFN marks the resource as complete else fail  
    * max waittime is 12 hours  
  * CreationPolicy - AWS preferred  
    * defined as a condition for the resource  
    * waits for the specified number of success signals before marking the resource as complete  
    
* Multi-Stack architectures -  
  * limitations of simple stack -  
    * limit of 500 resources per stack  
    * cant easily reuse resources between stacks  
  * Nested stack -  
    * Root stack is the first stack that is created manually/by a process  
    * CFN stack is mentioned as a logical resource within the template of a stack - it will created the stack as its child  
    * root stack orchestrates the passing of outputs between its children stacks  
    * entire nested stack is lifecycle linked - all stacks in the nested stack are created and deleted together  
  
  * Cross stack reference -  
    * enables resource sharing between stacks  
    * Ref function cannot be used to refer outputs/attributes from other stacks  
    * outputs can be exported - export name has to be unique within a region and account, this export is visible to other stacks in that region  
    * other stack can use Fn::ImportValue function to get the exported values  
  
  * Nested stack vs cross stack - 
    * Nested stack - whole templates can be resued in other stacks, new stack is created each time template is used  
    * Cross stack - resources are reused  
    * Nested stack - used to overcome resource limits of single stack  
    * Nested stack - modular templates - each module can be reused seperately  
    * Nested stack - entire nested stack is lifecycle linked  
    * Cross stack - individual stacks need to be created/updated/deleted seperately - resources has different lifecycles  

* Stack sets -  
  * deploy CFN stacks across many accounts and regions  
  * Stacksets are containers in an admin accounts that contain stack instances which reference stacks. Stack instances and stacks are created within target accounts    
  * if a stack fails to create, the stack instance remains and will hold information on that failure  
  * security and access - self managed IAM roles or service managed using CFN + Organizations  
  * template used to create stackset is a normal CFN template  
  * Concurrent accounts - how many target accounts can the stackset deploy to in parallel  
  * Failure tolerance - how many stacks can fail before the stackset is considered as failed  
  * Retain stacks - when stack instances are deleted, the stack is also deleted. This setting allows stacks to be retained even if stack instances are deleted  

* Deletion policy - 
  * default behaviour of CFN is to delete physical resources when stack is deleted. This can cause data loss for storage devices. With deletion policy is defined on each resource which tells CFN what to do when resource is deleted. 
  * 3 actions - Delete (default), retain or Snapshot (EBS volume, ElasticCache, Neptune, RDS, redshift). snapshot will incur storage cost and will need to be manually deleted  
  * only applies to Delete operation, not to replace operation  

* Stack roles - by default, CFN uses permissions of the logged in identity - user should have access to resources as well as CFN. But this does not allow role separation. Instead, an IAM role that has create/modify/delete access to resources can be passed when creating the stack which will ensure that the identity creating the stack can only be given limited access to create and maintain stacks and not actual resources.  

* cfn-init - provide config information to EC2 (alternative to bootstrapping)  
  * Only run once when the resource is first created. any updates to stack or metadata are not executed by init  
  * config directives stored in template in the AWS::CloudFormation::Init part of the metadata for EC2 logical resource  
  * directives describe desired state (user data/bootstrapping is procedural) so all directives should be idempotent (result in same resulting state if rerun multiple times)  
  * cfn-hup - helper tool that has to be manually installed on the EC2 instance that monitors any resource metadata changes and runs cfn-init when it detects any  

* ChangeSets - review updates to templates before executing them. Allows multiple changes to be stored independantly of each other and user can review each of them before applying updates  

* 
