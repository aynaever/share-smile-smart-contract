//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract ShareSmile {

	/* Total Smiles */
	uint256	totalSmiles;

	/* struct that describes what smile is */
	struct Smile {
		address	sender;
		uint256	timestamp;
		string 	name;
		string 	message;
	}

	/* Array where smiles will be stored */
	Smile[] smiles;

	/* Initialize totalSmiles to 0 in the deployment of the contract */
	constructor() {
		totalSmiles = 0;
	}

	/* event to acknowledge front end app of new smile */
	event	NewSmile(address sender, uint256 timestamp, string _name, string _message);

	/* Add smile to array of Smiles and increment totalSmiles by one */
	function addSmile(string memory _name, string memory _message) public {
		smiles.push(Smile(msg.sender, block.timestamp, _name, _message));
		totalSmiles += 1;
		emit	NewSmile(msg.sender, block.timestamp, _name, _message);
	}

	/* Return array of smiles */
	function getSmiles() public view returns (Smile[] memory) {
		return smiles;
	}

	/* Return number of smiles */
	function getTotalSmiles() public view returns (uint256) {
		return totalSmiles;
	}

}
