// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Voting {
    // Struct for each voting option with a description and vote count
    struct Option {
        string description;
        uint voteCount;
    }

    // Struct to define each voting round
    struct VotingRound {
        bool active;
        uint endTime;
        Option[] options; // Array of options in this round
        mapping(address => bool) hasVoted; // Tracks if an address has voted in this round
    }

    // Mapping from round ID to VotingRound details
    mapping(uint => VotingRound) public votingRounds;
    uint public currentRoundId;
    
    // Address of the contract owner (admin)
    address public owner;


    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to create a new voting round with descriptions for each option
    function createVotingRound(string[] calldata optionDescriptions, uint _durationInMinutes) external {
        require(msg.sender == owner, "Not the contract owner");
        require(optionDescriptions.length > 1, "Need at least 2 options");

        VotingRound storage newRound = votingRounds[currentRoundId];
        newRound.active = true;
        newRound.endTime = block.timestamp + (_durationInMinutes * 1 minutes);

        // Add options to the round with descriptions
        for (uint i = 0; i < optionDescriptions.length; i++) {
            newRound.options.push(Option({
                description: optionDescriptions[i],
                voteCount: 0
            }));
        }

        currentRoundId++; // Move to the next round ID for future rounds
    }

    // Function to cast a vote in a specific round
    function vote(uint roundId, uint optionIndex) external {
        VotingRound storage round = votingRounds[roundId];
        
        require(round.active, "Voting has ended for this round");
        require(block.timestamp < round.endTime, "Voting time expired");
        require(optionIndex < round.options.length, "Invalid option");
        require(!round.hasVoted[msg.sender], "Already voted in this round");

        // Record the vote
        round.options[optionIndex].voteCount++;
        round.hasVoted[msg.sender] = true;

    }
    
    // Function to end voting for a specific round
    function endVoting(uint roundId) external {
        require(msg.sender == owner, "Not the contract owner");
        VotingRound storage round = votingRounds[roundId];
        
        require(round.active, "Voting already ended for this round");
        round.active = false;

    }
    
    // Function to get details of an option in a specific round
    function getOptionDetails(uint roundId, uint optionIndex) external view returns (string memory description, uint voteCount) {
        VotingRound storage round = votingRounds[roundId];
        require(optionIndex < round.options.length, "Invalid option");

        Option storage option = round.options[optionIndex];
        return (option.description, option.voteCount);
    }

    // Function to fetch all vote counts for a specific round for AI sentiment analysis
    function getAllVotes(uint roundId) external view returns (uint[] memory) {
        VotingRound storage round = votingRounds[roundId];
        uint[] memory votes = new uint[](round.options.length);
        
        for (uint i = 0; i < round.options.length; i++) {
            votes[i] = round.options[i].voteCount;
        }
        
        return votes;
    }
}