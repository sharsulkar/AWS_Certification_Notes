# Key Management Service (KMS) 
**Service category:** Core Service > Encryption  
**Resiliency scope:** Region  
**Service scope:** Global  
**Service access:** Private  
**Service model:** NA  
**key words:**  

## Basics of encryption  
### Encryption at rest  
* used for protection against physical tampering  
* usually used when one party is involved  

### Encryption in transit  
* used during data transfer  
* used when multiple parties are involved  

## Encryption concepts  
* plaintext = unencrypted data  
* algorithm = converts plaintext to/from ciphertext. common algorithms - Blowfish, AES, RC4, DES, RC5, RC6.  
* key = password  
* Ciphertext = encrypted data  
* Symmetric encryption - same key used to encrypt and decrypt, good for encryption at rest, not good for encryption in transit.  
* Asymmetric encryption - public key and private key. Public key can only be used for encryption, private key can only be used for decryption. Public key can be shared freely so everyone with access to it can encrypt. Private key needs to be guarded as only it can be used to decrypt.    
