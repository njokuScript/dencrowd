// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
import "../interfaces/OpenZepplin/SafeMath.sol";

contract Project {
    using SafeMath for uint256;

    //state variables
    address public creator;
    uint256 public goal;
    uint256 public deadline;
    uint256 public raisedAmount = 0;
    uint256 public completeAt;
    uint256 public minimumContribution;
    string public title;
    string public description;
    mapping(address => uint256) public contributions;
    uint256 public totalContributors;

    // Event that will be emitted whenever funding will be received
    event FundingReceived(
        address contributor,
        uint256 amount,
        uint256 currentTotal
    );
    // Event that will be emitted whenever the project starter has received the funds
    event CreatorPaid(address recipient);

    // Modifier to check if the function caller is the project creator
    modifier isCreator() {
        require(msg.sender == creator);
        _;
    }
    struct Request {
        string description;
        uint256 value;
        address recipient;
        bool completed;
        uint256 numberOfVoters;
        mapping(address => bool) voters;
    }
    Request[] public requests;

    constructor(
        uint256 _deadline,
        uint256 _goal,
        address payable projectStarter,
        string memory projectTitle,
        string memory projectDescription,
        uint256 _minimumContribution
    ) {
        creator = projectStarter;
        title = projectTitle;
        description = projectDescription;
        goal = _goal;
        minimumContribution = _minimumContribution;
        deadline = block.number + _deadline;
    }

    /** @dev Function to fund a certain project.
     */
    function contribute() external payable {
        require(msg.value > minimumContribution);
        require(block.number < deadline);
        if (contributions[msg.sender] == 0) {
            totalContributors.add(1);
        }
        contributions[msg.sender] += msg.value;
        raisedAmount += msg.value;
        emit FundingReceived(msg.sender, msg.value, raisedAmount);
    }

    /** @dev Function to get balance .
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /** @dev Function to retrieve donated amount when a project expires and when a goal is not met.
     */
    function getRefund() public {
         require(block.number > deadline);
        require(raisedAmount < goal);
        require(contributions[msg.sender] > 0);

        msg.sender.transfer(contributions[msg.sender]);
        contributions[msg.sender] = 0;
    }

    /** @dev Function to get specific information about the project.
     
     */
    function getDetails()
        public
        view
        returns (
            address projectStarter,
            string memory projectTitle,
            string memory projectDescription,
            uint256 projectDeadline,
            uint256 currentAmount,
            uint256 goalAmount
        )
    {
        projectStarter = creator;
        projectTitle = title;
        projectDescription = description;
        projectDeadline = deadline;
        currentAmount = raisedAmount;
        goalAmount = goal;
    }

    /** @dev Function to create a spending request by project creator
     */
    function createSpendingRequest(
        string calldata _description,
        address _recipient,
        uint256 _value
    ) public isCreator {
        Request memory newRequest = Request({
            description: _description,
            value: _value,
            recipient: _recipient,
            numberOfVoters: 0,
            completed: false
        });

        requests.push(newRequest);
    }


}
