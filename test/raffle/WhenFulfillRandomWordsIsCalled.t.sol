// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./BaseSetup.t.sol";

contract WhenFulfillRandomWordsIsCalled is BaseSetup {
    function setUp() public override {
        BaseSetup.setUp();
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.warp(1000);
        vm.stopPrank();
    }

    //In Raffle.sol fulfillRandomWords is an internal so cannot be called like this
    //raffle.fulfillRandomWords(0, [0]);
    function test_RevertIf_NotCalledAfterPerformUpkeep() public {
        vm.expectRevert(bytes("nonexistent request"));
        vrfCoordinatorV2.fulfillRandomWords(0, address(raffle));
    }

    //Implmentation of test described in 15:51:50 of tutorial
    function testFuzz_RevertIf_NotCalledAfterPerformUpkeep(
        uint256 requestId
    ) public {
        vm.expectRevert(bytes("nonexistent request"));
        vrfCoordinatorV2.fulfillRandomWords(requestId, address(raffle));
    }

    /**
     * requestId that is emitted in performUpkeep can be retrieved by running verbose test 'forge test -vvvv'
     * To verify requestId programatically using foundry the following code can be used:
     * vm.recordLogs();
     * raffle.performUpkeep("");
     * Vm.Log[] memory entries = vm.getRecordedLogs();
     * assertEq(entries.length, 2);
     * assertEq(entries[1].topics[1], bytes32(uint256(1)));
     *
     * The two events emitted are as follows:
     * emit RandomWordsRequested(
     *  keyHash: 0x0000000000000000000000000000000000000000000000000000000000000000,
     *  requestId: 1,
     *  preSeed: 100,
     *  subId: 1,
     *  minimumRequestConfirmations: 3,
     *  callbackGasLimit: 20000,
     *  numWords: 1,
     *  sender: Raffle: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]
     * )
     * emit RequestedRaffleWinner(requestId: 1)
     *
     * The same method can be used to verify the winner from the winner picked event
     */
    event WinnerPicked(address indexed winner);

    function test_WinnerPickedEvent() public {
        BaseSetup.helperEnterMultipleAddress();
        assertEq(raffle.getNumberOfPlayers(), 4);
        raffle.performUpkeep("");
        vm.expectEmit(true, true, true, true);
        emit WinnerPicked(address(1));
        vrfCoordinatorV2.fulfillRandomWords(/* requestId */ 1, address(raffle));
    }
}
