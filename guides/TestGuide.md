Test Your Contract in the Truffle Console
=========================================

Navigate to your SourceTracker directory, and type command `truffle console`

- To make a new contract: let *name your new contract* = await SourceTracker.new(*pass SourceTracker constructor parameters here*)
- To call a function: *contract name*.*function name*
- To call a function that returns a uint: let *some variable name* = await *contract name*.*function name*; *variable name*.toNumber();

```javascript
let Trout = await SourceTracker.new("trout", 20);
Trout.GetProductName();
let itemNumber = await Trout.GetOriginalNumberOfItems();
itemNumber.toNumber();
```

Check out Truffle's documentation for more information on [using the console](https://www.trufflesuite.com/docs/truffle/getting-started/using-truffle-develop-and-the-console) and [using the test framework](https://www.trufflesuite.com/docs/truffle/testing/testing-your-contracts).
