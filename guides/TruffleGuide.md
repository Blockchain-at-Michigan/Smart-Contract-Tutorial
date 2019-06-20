Setting Up a New Truffle Project
================================

#### 1. Make a new directory for your Truffle project
`mkdir SourceTracker`

`cd SourceTracker`

#### 2. Create a bare project
`truffle init`

#### 3. Edit your truffle-config.js file
Open truffle-config.js or truffle.js (located in the SourceTracker directory). Paste the following code under networks to tell Truffle to connect to Ganache:
```javascript
development: {
  host: "localhost",
  port: 7545,    
	network_id: "*",
},
```
And the following code under compilers to tell Truffle what compiler version you want to use:
```javascript
solc: {
  version: "0.5.0",
  settings: {     
    optimizer: {
      enabled: true,
      runs: 200
    },
  }
}
```

#### 4. Move your smart contract code to the contracts folder
Drag and drop SourceTracker.sol into SourceTracker/contracts

#### 5. Compile
`truffle compile`

#### 6. Make a new migrations file
`touch migrations/2_salmon_migration.js`

In 2_salmon_migration.js, paste the following code:
```javascript
var Salmon = artifacts.require("SourceTracker");

module.exports = function(deployer)
{
  deployer.deploy(Salmon, "salmon", 1000);
}
```
This specifies what contract you'd like to deploy and what its constructor parameters are.

#### 7. Start Ganache
Open the Ganache app.

#### 8. Migrate
`truffle migrate`
