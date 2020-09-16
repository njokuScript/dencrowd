// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
import "../interfaces/OpenZepplin/SafeMath.sol";
import "./Project.sol";

contract FundRaising {
    using SafeMath for uint256;
    // Event that will be emitted whenever a new project is started
    event ProjectStarted(
        address contractAddress,
        address projectStarter,
        string projectTitle,
        string projectDescription,
        uint256 _deadline,
        uint256 _goal
    );

    // List of existing projects
    Project[] private projects;
}
