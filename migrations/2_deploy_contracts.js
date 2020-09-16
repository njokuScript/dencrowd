const FundRaising = artifacts.require("./contracts/FundRaising.sol");
const Project = artifacts.require("./contracts/Project.sol");
const SafeMath = artifacts.require("./interfaces/OpenZepplin/SafeMath.sol");
module.exports = async function (deployer) {
  await deployer.deploy(FundRaising);
  deployer.link(FundRaising, Project);

  await deployer.deploy(SafeMath);
  deployer.link(SafeMath, Project);
};
