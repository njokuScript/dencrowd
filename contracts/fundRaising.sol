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
        uint256 durationInDays,
        uint256 amountToRaise
    );

    // List of existing projects
    Project[] private projects;

    //create function to start project

    /** @dev Function to start a new project.
     * @param title Title of the project to be created
     * @param description Brief description about the project
     * @param durationInDays Project deadline in days
     * @param amountToRaise Project goal in wei
     */
}
