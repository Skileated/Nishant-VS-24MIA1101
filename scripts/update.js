const hre = require("hardhat");
require("dotenv").config();

async function main() {
  const moduleDeployment = await hre.ignition.deployments.get("PersonalLockerModule");
  const locker = await hre.ethers.getContractAt("PersonalLocker", moduleDeployment.addresses.PersonalLocker);

  const tx = await locker.updateMessage("Assignment Completed", process.env.PASSWORD);
  console.log("Update tx:", tx.hash);
  await tx.wait();

  const msg = await locker.readMessage();
  console.log("Current message:", msg);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
