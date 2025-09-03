const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
require("dotenv").config();

module.exports = buildModule("PersonalLockerModule", (m) => {
  const fullName = process.env.FULL_NAME || "Default Name";
  const password = process.env.PASSWORD || "defaultPass";
  const locker = m.contract("PersonalLocker", [fullName, password]);
  return { locker };
});
