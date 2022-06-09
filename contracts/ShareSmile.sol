//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract ShareSmile {

	/* Total Smiles */
	uint256	totalSmiles;

	/* struct that describes what smile is */
	struct Smile {
		string name;
		string message;
	}

	/* Array where smiles will be stored */
	Smile[] smiles;

	/* Initialize totalSmiles to 0 in the deployment of the contract */
	constructor() {
		totalSmiles = 0;
	}

	/* Add smile to array of Smiles and increment totalSmiles by one */
	function addSmile(string memory _name, string memory _message) public {
		smiles.push(Smile(_name, _message));
		totalSmiles += 1;
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
