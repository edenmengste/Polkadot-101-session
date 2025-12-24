// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdfundingCampaign {
    string public campaignName;
    string public campaignDescription;
    uint256 public fundingGoal;
    address public campaignCreator;
    uint256 public totalFundsRaised;
    uint256 public deadline;
    uint256 public minContribution;
    bool public isActive;

    constructor(
        string memory _name,
        string memory _description,
        uint256 _goal,
        uint256 _durationInDays,
        uint256 _minAmount
    ) {
        campaignName = _name;
        campaignDescription = _description;
        fundingGoal = _goal;
        campaignCreator = msg.sender;
        totalFundsRaised = 0;
    
        deadline = block.timestamp + (_durationInDays * 1 days);
        minContribution = _minAmount;
        isActive = true;
    }


    function getName() public view returns (string memory) {
        return campaignName;
    }

    function getDescription() public view returns (string memory) {
        return campaignDescription;
    }

    function getGoal() public view returns (uint256) {
        return fundingGoal;
    }

    function getCreator() public view returns (address) {
        return campaignCreator;
    }


    function getRemainingFunding() public view returns (uint256) {
        if (totalFundsRaised >= fundingGoal) {
            return 0;
        }
        return fundingGoal - totalFundsRaised;
    }


    function getDaysUntilDeadline() public view returns (uint256) {
        if (block.timestamp >= deadline) {
            return 0;
        }
        return (deadline - block.timestamp) / 1 days;
    }

    function isAcceptingDonations() public view returns (bool) {
        return isActive && (block.timestamp < deadline);
    }
}