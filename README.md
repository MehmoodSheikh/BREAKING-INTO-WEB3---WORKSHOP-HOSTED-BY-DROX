# BREAKING INTO WEB3 - WORKSHOP HOSTED BY DROX
This repository contains Solidity smart contracts, deployment scripts, and test files created as part of the **"Breaking Into Web3 as a Dev"** seminar and workshop. The workshop covered fundamental concepts of Web3 development, Solidity, and smart contract deployment. Participants created this project to learn hands-on about Ethereum blockchain interactions, smart contract functionality, and deployment processes.

## Table of Contents

- [Workshop Overview](#workshop-overview)
- [Project Overview](#project-overview)
- [Agenda](#agenda)
- [Smart Contracts](#contracts)
- [Deployment Scripts](#deployment-scripts)
- [Tests](#tests)

## Workshop Overview

The **"Breaking Into Web3 as a Dev"** workshop introduced participants to the principles of blockchain and decentralized application (dApp) development. The session included both theory and hands-on exercises, providing a comprehensive look at Ethereum and smart contract creation.

### Goals
- Understand blockchain fundamentals and Ethereum’s architecture.
- Develop and deploy basic to advanced smart contracts.
- Use `ethers.js` and `web3.js` libraries for smart contract interaction.
- Conduct unit testing on smart contracts to ensure functionality and reliability.

## Project Overview

As part of the workshop, participants developed a series of smart contracts and deployment scripts. These files illustrate essential concepts in Web3 development:
1. **Basic storage of data in a contract.**
2. **Implementing access control through an ownership mechanism.**
3. **Building a voting system to enable decentralized decision-making.**

Through these practical exercises, participants gained insights into:
- Writing Solidity code and deploying it to a blockchain.
- Implementing ownership and voting logic.
- Testing and verifying contract functions.

## Agenda

The agenda for the workshop was as follows:

1. **Introduction to Blockchain and Ethereum**: Overview of decentralized networks, consensus mechanisms, and Ethereum’s EVM.
2. **Smart Contract Fundamentals**: Basic structure of Solidity contracts, data types, and functions.
3. **Hands-on Coding**:
    - **Session 1**: Writing a simple storage contract (`Storage.sol`).
    - **Session 2**: Implementing ownership features in a contract (`Owner.sol`).
    - **Session 3**: Building a voting system (`Ballot.sol` and `VotingFinal.sol`) to introduce more complex contract interactions.
4. **Deployment and Testing**:
    - Setting up deployment scripts with `ethers.js` and `web3.js`.
    - Writing unit tests using `Mocha` and `Chai`.
5. **Q&A and Project Showcase**: A wrap-up session with questions, solutions to challenges faced, and a presentation of the final project.

## Smart Contracts

1. **Storage.sol**: A basic smart contract that stores an integer and allows for updating and retrieving this stored value.
2. **Owner.sol**: An ownership contract that introduces an `onlyOwner` modifier to restrict function access, demonstrating how to implement access control.
3. **Ballot.sol**: A voting contract that allows users to vote or delegate votes, enabling decentralized decision-making.
4. **VotingFinal.sol**: An advanced or improved version of the `Ballot` contract, adding enhancements like additional validations, winner determination, and delegation options.

## Deployment Scripts

Scripts are provided to deploy smart contracts on Ethereum networks:
- **deploy_with_ethers.ts**: Deploys contracts using the `ethers.js` library.
- **deploy_with_web3.ts**: Deploys contracts using the `web3.js` library.

## Tests

The `tests` folder includes both Solidity and JavaScript tests:
- **Ballot_test.sol**: Solidity unit tests for verifying voting functionality in the `Ballot` contract.
- **storage.test.js**: JavaScript test for the `Storage` contract, using `Mocha` and `Chai` along with `ethers.js` for deployment and interaction.
