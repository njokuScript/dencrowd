// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
import "../interfaces/OpenZepplin/SafeMath.sol";

contract Project {
    using SafeMath for uint256;

    // Data structures
    enum State {Fundraising, Expired, Successful}
    //state variables
    address public creator;
    uint256 public goal;
    uint256 public deadline;
    uint256 public raisedAmount = 0;
    uint256 public minimumContribution;
    State public state = State.Fundraising; // initialize on create
    string public title;
    string public description;
    mapping(address => uint256) public contributions;
    uint256 public totalContributors;

    // Modifier to check current state
    modifier inState(State _state) {
        require(state == _state);
        _;
    }
    // Modifier to check if the function caller is the project creator
    modifier isCreator() {
        require(msg.sender == creator);
        _;
    }

    constructor(
        uint256 _deadline,
        uint256 _goal,
        address payable projectStarter,
        string memory projectTitle,
        string memory projectDescription,
        uint256 _minimumContribution
    ) public {
        creator = projectStarter;
        title = projectTitle;
        description = projectDescription;
        goal = _goal;
        minimumContribution = _minimumContribution;
        deadline = block.number + _deadline;
    }
}
