# Software Architecture  
## Basics  
**Software in a nutshell?**  
* flow of logic designed to solve a (part of) real-life problem functionally  
* by instructing the underlying hardware to perform physical actions sequentially or parallely  
* provides desired abstraction to the user creating and using the software  

**Software architecture in a nutshell**  
*assuming software development will primarily take care of fulfilling functional requirements*  
* organize software to -  
  * best utilize the underlying hardware  
  * follow applicable best practices and guidelines, if possible (or create new ones, if none exist)  
  * solve for non-functional requirements  

**Pairing software with hardware**  
* Compile - reduce abstraction - convert software to machine readable language  
* Build - convert the compiled software, dependencies and configurations into a stand-alone set of logic flow instructions that the underlying hardware can understand and act  
* Deploy - process of passing instructions to the underlying hardware on how to use the built software  

## Architecture dimensions  
* **Functional modularity** - splitting the code into functionally distinct areas  
* **Functional coupling** - dependancy between different parts of the code within the same application  
* **Hardware ownership** - who owns and manages the hardware the functionality is deployed on  
* **Non-functional considerations** - hardware capacity, high availability, fault tolerance, disaster recovery, scalability, cost optimization, security  

