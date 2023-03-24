// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Raffle.sol";

contract RaffleTest is Test {
    Raffle raffle;

    function setUp() public {
        raffle = new Raffle(
            0x271682DEB8C4E0901D1a1550aD2e64D568E69909,
            1000000000000000000,
            "",
            1,
            20000,
            5
        );
    }

    function test_VerifyConstruction() public {
        assertEq(raffle.getEntraceFee(), 1000000000000000000);
        assertEq(
            raffle.getRecentWinner(),
            0x0000000000000000000000000000000000000000
        );
        assertEq(uint(raffle.getRaffleState()), 0);
        assertEq(raffle.getNumWords(), 1);
        assertEq(raffle.getNumberOfPlayers(), 0);
        assertEq(raffle.getLatestTimeStamp(), 1);
        assertEq(raffle.getConfirmations(), 3);
    }
}
