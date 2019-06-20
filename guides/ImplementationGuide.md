Functions to Implement in SourceTracker.sol
===========================================

### 1. Constructor
Use this function to initialize the state variables (make sure to utilize the parameters).

### 2. GetProductName()
This is a simple get function for the product name state variable.

### 3. GetOriginalNumberOfItems()
This is a simple get function for the original number of items state variable.

### 4. GetNumberOfNodes()
This is a simple get function for the number of nodes state variable.

### 5. AddNode()
This function needs to push a new Node struct to the end of the supply chain array (make sure to utilize the parameters). It will also update the mapping, emit a new node event, emit a product damage event if necessary, and increase the number of nodes state variable.

### 6. FindDamage()
This function needs to search through the supply chain array to find the first business reporting that not all items were in perfect condition. If none of the businesses reported this, it should return an empty string.

### 7. DateBusinessReceivedShipment()
This function needs to use the mapping and supply chain array to find the date that the shipment arrived at the business. If the business does not exist in the supply chain, it should return an empty string. *NOTE: With Solidity mappings, if you pass a key that hasn't been mapped to a value yet, it will return the defult of the value (ie. for uint=>uint, the value 0 will be returned for every key that hasn't been "set" yet).*
