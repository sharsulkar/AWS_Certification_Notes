# Key Management Service (KMS) 
**Service category:** Core Service > Encryption  
**Resiliency scope:** AZ  
**Service scope:** Regional  
**Service access:** Public  
**Service model:** NA  
**key words:**  

## Basics of encryption  
### Encryption at rest  
* used for protection against physical tampering  
* usually used when one party is involved  

### Encryption in transit  
* used during data transfer  
* used when multiple parties are involved  

### Encryption concepts  
* plaintext = unencrypted data  
* algorithm = converts plaintext to/from ciphertext. common algorithms - Blowfish, AES, RC4, DES, RC5, RC6.  
* key = password  
* Ciphertext = encrypted data  
* Symmetric encryption - same key used to encrypt and decrypt, good for encryption at rest, not good for encryption in transit or when encrpytion and decryption is performed by different parties.  
* Asymmetric encryption - public key and private key. Public key can only be used for encryption, private key can only be used for decryption. Public key can be shared freely so everyone with access to it can encrypt. Private key needs to be guarded as only it can be used to decrypt.  
* Signing - to prove identity using Asymmetric encryption. public key is used to verify whether a document was signed using its corresponding private key. private key is not required to be present when verifying signature.  


## KMS  
* Create store and manage cryptographic keys and perform cryptographic operations  
* can perform symmetric and asymmetirc encryption
* Keys never leave KMS and the region where they are generated. Keys are also never stored in persistent memory without encryption  
* **provides FIPS 140-2(L2) compliant service**  
* KMS manages Customer Master Keys (CMK). CMK is a logical container of physical key material  
* CMK is made up of ID, date, policy, desc and state which is backed by physical key material  
* physical key material can be generated or imported  
* CMKs can be used for upto **4KB of data**  
* Data Encryption keys (DEK) - generated using CMK and GenerateDataKey to encrypt data >4KB  
* How to use DEK -  
  1. User/service requests KMS generate DEK using CMK using GenerateDataKey action.  
  2. Once DEK is generated, KMS provides 2 versions of DEK - plaintext version and ciphertext version encrypted using CMK. KMS does not store DEK, it only generates it.  
  3. User/service uses plaintext DEK to encrypt the data and then discard the plaintext version of DEK.  
  4. User/service stores the encrypted data and the ciphertext version of DEK together.  
  5. For decryption, user/service asks KMS to decrypt and provides the ciphertext version of DEK.  
  6. KMS decrypts the DEK using CMK and provides it back to user/service which can then use it to decrypt the data.  
  7. Thus the user/service has to manage the encryption, decryption of data and storage of DEKs. KMS will only encrypt and decrypt the DEKs for you.  
 
* two types of CMK - AWS managed and customer managed. 
* AWS managed are generated automatically using services.  
* Customer managed keys are more configurable.  
* CMKs support key rotation. It cannot be disabled in AWS managed keys - the keys are automatically rotated once in 3 years.   
* key rotation is optional in customer managed keys, if enabled, they are rotated once a year.  
* CMKs support aliases  
* every CMK has a key policy which is a resource policy. Customer managed CMKs can be modified.  
* Unlike other AWS resources, **Key policy has to be explicitly told that keys trust the AWS account they are in.**  This way, the chain of trust is built - KMS is told to trust the account, the account trusts IAM so IAM roles and identities can be setup to use KMS to perform cryptographic operations.  

* Role separation with KMS - KMS allows IAM and key policy to manage access to each cryptographic operation separately. thus role based access can be granted where the role/identity may have access to generate keys and encrypt but not to decrypt. 
