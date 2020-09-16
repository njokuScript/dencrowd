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
        uint256 amountToRaise,
        uint256 minimumContribution
    );

    // List of existing projects
    Project[] private projects;

    //create function to start project

    /** @dev Function to start a new project.
     * @param title Title of the project to be created
     * @param description Brief description about the project
     * @param durationInDays Project deadline in days
     * @param amountToRaise Project goal in hydro
     * @param minimumContribution minimum amount a contibutor can give
     */

    function startNewProject(
        string calldata title,
        string calldata description,
        uint256 durationInDays,
        uint256 amountToRaise,
        uint256 minimumContribution
    ) external {
        uint256 deadline = block.timestamp.add(durationInDays.mul(1 days));
        Project newProject = new Project(
            deadline,
            amountToRaise,
            msg.sender,
            title,
            description,
            minimumContribution
        );
        projects.push(newProject);
        emit ProjectStarted(
            address(newProject),
            msg.sender,
            title,
            description,
            minimumContribution,
            deadline,
            amountToRaise
        );
    }

    /** @dev Function to get all projects' contract addresses.
     * @return A list of all projects' contract addreses
     */
    function returnAllProjects() external view returns (Project[] memory) {
        return projects;
    }
}
