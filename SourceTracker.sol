
pragma solidity ^0.5.0;

// @title a simple tracker for a supply chain product from source to consumer 
// @author Blockchain at Michigan

contract SourceTracker 
{
	string internal ProductName;
	uint internal NumItemsOriginal;  // how many total items should be in the shipment
	uint internal NumNodes;  // number of nodes in the supply chain
	
	struct Node
	{
		string BusinessName;  // name of the business representing this node
		string DateReceived;  // date that shipment was received, in form mm/dd/yyyy
		uint NumItemsReceived;  // how many total items were received
		uint NodeIndex; // index of this node in chain array
		bool PerfectCondition;  // true if all items received are in perfect condition
	}

	Node[] internal SupplyChain;
	mapping (string => uint) internal BusinessNameLookup;  // maps name of business to the index its node in the chain array

	// when a new node is added to the supply chain
	event NewNode
	(
		string BusinessName,
		uint NumItemsReceived
	);

	// when a new node is added to the supply chain and reports imperfect items
	event ProductDamage
	(
		string BusinessName,
		uint NodeIndex
	);

	// @param the name of the product
	// @param the total number of items that are expected in the shipment
	constructor (string memory productName, uint memory numItemsOriginal) 
	external
	{
		ProductName = productName;
		NumItemsOriginal = numItemsOriginal;
		NumNodes = 0;
	}

	// adds a new node to the end of the supply chain
	// @param the name of the business representing this node
	// @param the date that this node received the shipment
	// @param the total number of items received in this shipment at this node
	// @param whether every item in the shipment was in perfect condition
	function AddNode
	(
		string memory businessName,
		string memory dateReceived,
		uint memory numItemsReceived,
		bool memory perfectCondition
	) 
	external
	{
		// push new struct into array
		SupplyChain.push(Node(businessName, dateReceived, numItemsReceived, NumNodes, perfectCondition));
		
		// update BusinessNameLookup mapping
		BusinessNameLookup[businessName] = NumNodes;

		// emit NewNode event
		emit NewNode(businessName, numItemsReceived);

		// check if ProductDamage event should be emitted
		if (!perfectCondition)
		{
			emit ProductDamage(businessName, NumNodes);
		}

		// increase numNodes
		++NumNodes;
	}

	// @returns the name of the product for which this smart contract is the supply chain
	function GetProductName()
	external
	view
	returns (string)
	{
		return ProductName;
	}

	// @returns the total number of items that should be in the shipment
	function GetOriginalNumberOfItems()
	external
	view
	returns (uint)
	{
		return NumItemsOriginal;
	}

	// @returns the number of nodes in the supply chain
	function GetNumberOfNodes()
	external
	view
	returns (uint)
	{
		return NumNodes;
	}

	// finds the first node to report damage
	// @returns the name of a business in the supply chain 
	// or an empty string if no damage has been reported
	function FindDamage()
	external
	view
	returns (string)
	{
		// return name of business reporting first damage
	}
}