// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Raffle.sol";
import "./Raffle.BaseSetup.t.sol";

contract CheckUpkeep is BaseSetup {
    function setUp() public override {
        BaseSetup.setUp();
    }

    function test_ReturnsFalseWhenThereIsNoEth() public {
        vm.warp(1000);
        (bool upkeepNeeded, ) = raffle.checkUpkeep("");
        assertTrue(!upkeepNeeded, "upkeep is false");
        assertTrue(address(raffle).balance == 0, "raffle balance is 0");
    }

    function test_ReturnsFalseWhenRaffleIsNotOpen() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.warp(1000);
        vm.stopPrank();
        raffle.performUpkeep("");
        (bool upkeepNeeded, ) = raffle.checkUpkeep("");
        assertTrue(!upkeepNeeded, "upkeep is false");
        assertEq(
            uint256(raffle.getRaffleState()),
            1,
            "RaffleState is calculating"
        );
    }

    function test_ReturnsFalseWhenEnoughTimeHasNotPassed() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.stopPrank();
        (bool upkeepNeeded, ) = raffle.checkUpkeep("");
        assertTrue(!upkeepNeeded, "upkeep is false");
        assertTrue(
            raffle.getLatestTimeStamp() < raffle.getInterval(),
            "latest timestamp is less than interval"
        );
    }

    function test_ReturnsTrueWhenTimeHasPassedAndThereIsEthAndPlayers() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.stopPrank();
        vm.warp(1000);
        (bool upkeepNeeded, ) = raffle.checkUpkeep("");
        assertTrue(upkeepNeeded, "upkeep is true");
    }

    /**
     * Verifies hasPlayers boolean but it should not be possible to send ether
     * outside of enterRaffle() as there is no receive or fallback function in
     * the contract. If a transaction is sent with eth to the contract,
     * it would revert. We can bypass this using the deal function of StdCheats
     */
    function test_ReturnsFalseWhenThereAreNoPlayers() public {
        vm.warp(1000);
        deal(address(raffle), 9000000000000000000);
        (bool upkeepNeeded, ) = raffle.checkUpkeep("");
        assertTrue(!upkeepNeeded, "upkeep is false");
        assertTrue(raffle.getNumberOfPlayers() == 0, "no players in raffle");
    }
}
