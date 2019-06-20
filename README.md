Smart Contract Tutorial
=======================
a beginner's tutorial for creating and deploying a simple smart contract using the truffle suite



### 1.   Install Node.js
Node.js is a JavaScript run-time environment required for using Truffle.
- If you don't have homebrew, [download the installer](https://nodejs.org/en/download/) and make sure it's on your `$PATH`
(if you run into problems with multiple versions, [download nvm](https://github.com/nvm-sh/nvm#installation-and-update))
- Or [use homebrew](https://changelog.com/posts/install-node-js-with-homebrew-on-os-x)


### 2.   Install Truffle
The Truffle Suite is a development environment for blockchains using the Ethereum Virtual Machine.
- Use `npm install -g truffle` to install the Truffle package globally, or remove the tag to install locally
- *[Check out the repo](https://github.com/trufflesuite/truffle)*


### 3.   Download and Install Ganache
Ganache is a personal blockchain for Ethereum development that allows you to test locally and much faster than major testnets like Ropsten and Rinkeby.
- [Download](https://www.trufflesuite.com/ganache)
- *[Check out the repo](https://github.com/trufflesuite/ganache)*


### 4.   Download the [starter code](./starter/SourceTracker.sol) and fill out the functions
The Source Tracker smart contract represents a simplified supply chain for a given product shipment. Each time the shipment arrives at a new node in the supply chain, the contract adds another "node" to its supply chain array. On a larger scale, this example shows how blockchain can be used along with IoTs to make supply chains more safe and transparent.
- Here's a [list of functions](./guides/ImplementationGuide.md) that need to be implemented
- *If you like to develop in Visual Studio Code, you can download [this extension](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity) for Solidity support*
- *If you like to develop in Atom, you can download [this extension](https://github.com/0mkara/etheratom) for Solidity support*


### 5.   Debug your code using Remix
[Remix](https://remix.ethereum.org) is a web-based compiler/IDE that is one of the best options for testing your smart contracts with the compiler of your choice
- *[Check out the documentation](https://remix.readthedocs.io/en/latest/#)*


### 6.   Test your smart contract using Truffle and Ganache
- [Deploy your contracts](./guides/DeployGuide.md)
- [Test your smart contract with Truffle](./guides/TestGuide.md)
- *Check out Truffle's [documentation](https://www.trufflesuite.com/docs/truffle/overview) for a more comprehensive description of its capabilities*


### 7.   Check your code with the [solution code](./solution/SourceTracker.sol)


### 8.   For more practice, check out [Truffle's Pet Shop Tutorial](https://www.trufflesuite.com/tutorials/pet-shop)
