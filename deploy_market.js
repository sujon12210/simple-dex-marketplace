const hre = require("hardhat");

async function main() {
  const Marketplace = await hre.ethers.getContractFactory("Marketplace");
  const market = await Marketplace.deploy();

  await market.waitForDeployment();

  console.log("Marketplace deployed to:", await market.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
