// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./BaseSetup.t.sol";

contract WhenPerformUpkeepIsCalled is BaseSetup {
    function setUp() public override {
        BaseSetup.setUp();
    }

    //This test only passes if the overall test fails which is evaluating that
    //performUpkeep reverts when checkUpkeep returns true (which it shouldnt)
    function testFail_RevertWhenCheckUpkeepReturnsTrue() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.stopPrank();
        vm.warp(1000);
        (bool upkeepNeeded, ) = raffle.checkUpkeep("");
        assertTrue(upkeepNeeded);
        vm.expectRevert(
            abi.encodeWithSelector(
                Raffle__UpkeepNotNeeded.selector,
                address(raffle).balance,
                raffle.getNumberOfPlayers(),
                uint256(raffle.getRaffleState())
            )
        );
        raffle.performUpkeep("");
    }

    function test_RevertWhenCheckUpkeepReturnsFalse() public {
        (bool upkeepNeeded, ) = raffle.checkUpkeep("");
        assertFalse(upkeepNeeded);
        vm.expectRevert(
            abi.encodeWithSelector(
                Raffle__UpkeepNotNeeded.selector,
                address(raffle).balance,
                raffle.getNumberOfPlayers(),
                uint256(raffle.getRaffleState())
            )
        );
        raffle.performUpkeep("");
    }

    event RequestedRaffleWinner(uint256 indexed requestId);

    //This event and event test is redundant as Chainlink VRF emits an event with requestId too
    //Refer to test_VRFCoordinatorEmitsEventWithRequestId() to verify that event
    function test_UpdatesRaffleStateAndEmitsEventWithRequestId() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.stopPrank();
        vm.warp(1000);
        vm.expectEmit(false, false, false, false);
        emit RequestedRaffleWinner(1);
        raffle.performUpkeep("");
        assertEq(1, uint256(raffle.getRaffleState()));
    }

    //Event from VRFCoordinatorV2Mock.sol, see BaseSetup for import
    event RandomWordsRequested(
        bytes32 indexed keyHash,
        uint256 requestId,
        uint256 preSeed,
        uint64 indexed subId,
        uint16 minimumRequestConfirmations,
        uint32 callbackGasLimit,
        uint32 numWords,
        address indexed sender
    );

    function test_VRFCoordinatorEmitsEventWhenPerformUpkeepIsCalled() public {
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.stopPrank();
        vm.warp(1000);
        vm.expectEmit(false, false, false, false);
        emit RandomWordsRequested("", 0, 0, 0, 0, 0, 0, address(0));
        raffle.performUpkeep("");
        assertEq(1, uint256(raffle.getRaffleState()));
    }
}
