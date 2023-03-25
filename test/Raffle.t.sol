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

    function test_VerifyInitialisation() public {
        assertEq(raffle.getEntraceFee(), 1000000000000000000);
        assertEq(
            raffle.getRecentWinner(),
            0x0000000000000000000000000000000000000000
        );
        assertEq(uint(raffle.getRaffleState()), 0);
        assertEq(raffle.getNumWords(), 1);
        assertEq(raffle.getNumberOfPlayers(), 0);
        //Unsure how this would work when deploying to any network
        //assertEq(raffle.getLatestTimeStamp(), 1);
        assertEq(raffle.getConfirmations(), 3);
        assertEq(raffle.getInterval(), 5);
    }

    function test_RevertWhen_NoPlayersEnteredOnInitialisation() public {
        vm.expectRevert(stdError.indexOOBError);
        raffle.getPlayer(0);
    }

    function test_RevertIf_NotEnoughEthEntered() public {
        vm.startPrank(address(0));
        vm.expectRevert(Raffle__NotEnoughEthEntered.selector);
        deal(address(0), 200000000000000000);
        //uint256 balanceOfPrank = address(0).balance;
        //console.log(balanceOfPrank);
        raffle.enterRaffle{value: 1000000000000000}();
        //balanceOfPrank = address(0).balance;
        //console.log(balanceOfPrank);
    }

    function test_EnterRaffle() public {
        vm.startPrank(address(0));
        deal(address(0), 2000000000000000000);
        //uint256 balanceOfPrank = address(0).balance;
        raffle.enterRaffle{value: 1000000000000000100}();
        //TODO: Update foundry for this assert
        //assertNotEq(balanceOfPrank,address(0).balance);
    }
}
