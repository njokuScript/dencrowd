// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
import "../interfaces/OpenZepplin/SafeMath.sol";

contract Project {
    using SafeMath for uint256;

    // Data structures
    enum State {Fundraising, Expired, Successful}
    //state variables
    address payable public creator;
    uint256 public goal;
    uint256 public deadline;
    uint256 public raisedAmount = 0;
    uint256 public minimumContribution;
    State public state = State.Fundraising; // initialize on create
    string public title;
    string public description;
    mapping(address => uint256) public contributions;
    uint256 public totalContributors;
}
