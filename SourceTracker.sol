
pragma solidity ^0.5.0;

// @title a simple tracker for a supply chain product from source to consumer 
// @author Blockchain at Michigan

contract SourceTracker 
{
	string internal ProductName;
	uint internal NumItemsOriginal;  // how many total items were sent out from source
	uint internal NumNodes;  // number of nodes in the supply chain
	
	struct Node
	{
		string BusinessName;  // name of the business representing this node
		string DateReceived;  // date that shipment was received, in form mm/dd/yyyy
		uint NumItemsReceived;  // how many total items were received
		uint NodeIndex; // index of this node in chain array
		bool PerfectCondition;  // true if all items received are in perfect condition
	}

	Node[] internal Chain;
	mapping (string => uint) internal BusinessNameLookup;  // maps name of business to the index its node in the chain array

	event NewNode
	(
		string BusinessName,
		uint NumItemsReceived
	);

	event ProductDamage
	(
		string BusinessName,
		uint NodeIndex
	);

	constructor (string memory productName, uint memory numItemsOriginal) 
	external
	{
		ProductName = productName;
		NumItemsOriginal = numItemsOriginal;
		NumNodes = 0;
	}

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
		Chain.push(Node(businessName, dateReceived, numItemsReceived, NumNodes, perfectCondition));
		
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

	function GetProductName()
	external
	view
	returns (string)
	{
		return ProductName;
	}

	function GetOriginalNumberOfItems()
	external
	view
	returns (uint)
	{
		return NumItemsOriginal;
	}

	function GetNumberOfNodes()
	external
	view
	returns (uint)
	{
		return NumNodes;
	}

	function FindDamage()
	external
	view
	returns (string)
	{
		// return name of business reporting first damage
	}
}