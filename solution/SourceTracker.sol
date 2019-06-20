
pragma solidity ^0.5.0;

// @title a simple tracker for a supply chain product from source to consumer 
// @author Blockchain at Michigan

contract SourceTracker 
{
	string internal ProductName;
	uint internal NumItemsOriginal;  // how many total items should be in shipment
	uint internal NumNodes;  // number of nodes in supply chain
	
	struct Node
	{
		string BusinessName;  // name of the business representing this node
		string DateReceived;  // date that shipment was received, in form mm/dd/yyyy
		uint NumItemsReceived;  // how many total items were received
		uint NodeIndex; // index of this node in chain array
		bool PerfectCondition;  // true if all items received are in perfect condition
	}

	Node[] internal SupplyChain;
	mapping (string => uint) internal BusinessNameLookup;  // maps name of business to index of its node in supply chain

	// when a new node is added to supply chain
	event NewNode
	(
		string BusinessName,
		uint NumItemsReceived
	);

	// when a new node is added to supply chain and reports imperfect items
	event ProductDamage
	(
		string BusinessName,
		uint NodeIndex
	);

	// @param name of the product
	// @param total number of items that are expected in shipment
	constructor (string memory productName, uint memory numItemsOriginal) 
	external
	{
		ProductName = productName;
		NumItemsOriginal = numItemsOriginal;
		NumNodes = 0;
	}

	// @returns name of product this supply chain tracks
	function GetProductName()
	external
	view
	returns (string)
	{
		return ProductName;
	}

	// @returns total number of items that should be in each shipment
	function GetOriginalNumberOfItems()
	external
	view
	returns (uint)
	{
		return NumItemsOriginal;
	}

	// @returns number of nodes in supply chain
	function GetNumberOfNodes()
	external
	view
	returns (uint)
	{
		return NumNodes;
	}

	// adds a new node to the end of the supply chain
	// @param name of business representing this node
	// @param date that this node received shipment
	// @param total number of items received in this shipment at this node
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

	// finds the first node to report damage
	// @returns name of a business in the supply chain or empty string
	function FindDamage()
	external
	view
	returns (string)
	{
		// look for business that reported damage
		for (int i = 0; i < NumNodes; ++i)
		{
			if !(SupplyChain[i].PerfectCondition)
			{
				return SupplyChain[i].BusinessName;
			}
		}
		// or return an empty string
		return "";
	}

	// determines what date the company received their shipment
	// @param name of a business
	// @returns date or empty string
	function DateBusinessReceivedShipment(string memory businessName)
	external
	view
	returns (string)
	{
		// get index of business
		uint memory idx = BusinessNameLookup[businessName];

		// make sure returned index wasn't just a default value
		if (idx == 0) && !compareStrings(SupplyChain[idx].BusinessName, businessName)
		{
			return "";
		} else
		{
			return SupplyChain[idx].DateReceived;
		}
	}

	// helper function that compares strings
	// @param 2 strings
	// @returns true if the strings match
	function compareStrings(string memory a, string memory b) 
	public 
	view 
	returns (bool) 
	{
  	return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );
	}

}