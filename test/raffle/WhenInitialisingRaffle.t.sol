// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Raffle.sol";
import "./BaseSetup.t.sol";

contract WhenInitialisingRaffle is BaseSetup {
    function setUp() public override {
        BaseSetup.setUp();
    }

    // function test_VerifyInitialisation() public {
    //     //Unsure how this would work when deploying to any network
    //     //assertEq(raffle.getLatestTimeStamp(), 1);
    // }

    function test_EntranceFeeSetCorrectlyOnInitialisation() public {
        assertEq(raffle.getEntraceFee(), 1000000000000000000);
    }

    function test_RevertWhen_NoPlayersEnteredOnInitialisation() public {
        vm.expectRevert(stdError.indexOOBError);
        raffle.getPlayer(0);
    }

    function test_NoRecentWinnerOnInitialisation() public {
        assertEq(raffle.getRecentWinner(), 0x0000000000000000000000000000000000000000);
    }

    function test_RaffleStateIsOpenOnInitialisation() public {
        assertEq(uint256(raffle.getRaffleState()), 0);
    }

    function test_NumWordsSetCorrectlyOnInitialisation() public {
        assertEq(raffle.getNumWords(), 1);
    }

    function test_NumberOfPlayersIsZeroOnInitialisation() public {
        assertEq(raffle.getNumberOfPlayers(), 0);
    }

    function test_ConfirmationsSetCorrectlyOnInitialisation() public {
        assertEq(raffle.getConfirmations(), 3);
    }

    function test_IntervalSetCorrectlyOnInitialisation() public {
        assertEq(raffle.getInterval(), 5);
    }
}
