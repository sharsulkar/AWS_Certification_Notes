# When to use Identity policy vs resource policy for access authorization  
## Use Identity policy when  
1. Access to multiple resources within an AWS account, not every service supports resource policies  
2. Managing access control at one place - IAM  
3. For permissions within the same account  

## Use Resource policy when  
1. Managing single service that supports resource policy  
2. Anonymous or cross-account access is expected  
3. provide access to resource that is expected to be accessed by large number of principals  
