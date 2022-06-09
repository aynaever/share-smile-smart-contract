const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("ShareSmile", async () => {
	it("Test getTotalSmiles", async () => {
		const ShareLove = await ethers.getContractFactory("ShareLove");
		const shareLove = await ShareLove.deploy();
		await shareLove.deployed();
		expect(await shareLove.getTotalSmiles()).to.equal(0);
	});

	it("Add new smile", async () => {
		const ShareSmile = await ethers.getContractFactory("ShareSmile");
		const shareSmile = await ShareSmile.deploy();
		await shareSmile.deployed();
		await shareSmile.addSmile("Aymane", "Smile is everything");
		expect(await shareSmile.getTotalSmiles()).to.equal(2);
		const smiles = await shareSmile.getSmiles();
		console.log(smiles);
	});

});
