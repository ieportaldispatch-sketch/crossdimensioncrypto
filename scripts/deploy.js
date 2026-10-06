const { ethers } = require("hardhat");

async function main() {
  const CrossDimensionCrypto = await ethers.getContractFactory("CrossDimensionCrypto");
  const token = await CrossDimensionCrypto.deploy();

  await token.waitForDeployment();

  console.log("Token deployed to:", await token.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
