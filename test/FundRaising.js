const FundRaising = artifacts.require("./contracts/FundRaising.sol");
const Project = artifacts.require("./contracts/Project.sol");

const ProjectDetails = [
  "NjokuApp",
  "building the next billion software",
  30,
  10000,
];
contract("FundRaising", (accounts) => {
  const owner = {
    public: accounts[0],
  };
  it("should be a able to start a project", async () => {
    const contractInstance = await FundRaising.new();
    const result = await contractInstance.startNewProject(
      ProjectDetails[0],
      ProjectDetails[1],
      ProjectDetails[2],
      ProjectDetails[3],
      { from: owner.public }
    );
    assert.equal(result.receipt.status, true);
    assert.equal(result.logs[0].args.title, ProjectDetails[0]);
    assert.equal(result.logs[1].args.description, ProjectDetails[1]);
    assert.equal(result.logs[2].args.deadline, ProjectDetails[2]);
    assert.equal(result.logs[3].args.goal, ProjectDetails[3]);
  });
});
