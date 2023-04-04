// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Raffle.sol";
import "./BaseSetup.t.sol";

contract WhenEnteringRaffle is BaseSetup {
    function setUp() public override {
        BaseSetup.setUp();
    }

    function test_RevertIf_NotEnoughEthEntered() public {
        vm.expectRevert(Raffle__NotEnoughEthEntered.selector);
        raffle.enterRaffle{value: 1000000000000000}();
    }

    function test_EnterRaffle() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        assertFalse(2000000000000000000 == address(0).balance);
        assertEq(address(raffle).balance, 1100000000000000000);
        vm.stopPrank();
    }

    function test_PlayerEnteredRaffle() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        assertEq(raffle.getNumberOfPlayers(), 1);
        assertEq(raffle.getPlayer(0), address(0));
        vm.stopPrank();
    }

    event RaffleEnter(address indexed player);

    function test_RaffleEnterEvent() public {
        vm.expectEmit(false, false, false, false);
        emit RaffleEnter(address(0));
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.stopPrank();
    }

    function test_RevertIf_RaffleNotOpen() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.warp(1000);
        vm.stopPrank();
        raffle.performUpkeep("");
        vm.expectRevert(Raffle__NotOpen.selector);
        raffle.enterRaffle{value: 1100000000000000000}();
    }
}
