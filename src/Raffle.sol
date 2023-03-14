//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

error Raffle__NotEnoughEthEntered();

contract Raffle {
    /* State Variables */
    uint256 private immutable i_entranceFee;
    address private immutable i_owner;
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
        i_owner = msg.sender;
    }

    //Enter the lottery
    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughEthEntered();
        }
        s_players.push(payable(msg.sender));
        // Emite an event when we update a dynamic array or mapping
    }

    //Pick a random windder (verifiably random)
    function pickRandomWinner() private view returns (address) {
        return i_owner;
    }

    //Winner to be select every x minutes -> completely automate
    //Chainlink Oracle -> Rnaomdness, autoamted exeuction using chainlink keepers

    function getEntraceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
