// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Raffle.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/mocks/VRFCoordinatorV2Mock.sol";

contract BaseSetup is Test {
    Raffle raffle;
    VRFCoordinatorV2Mock vrfCoordinatorV2;

    function setUp() public virtual {
        vrfCoordinatorV2 = new VRFCoordinatorV2Mock(0, 0);
        uint64 subId = vrfCoordinatorV2.createSubscription();
        raffle = new Raffle(
            address(vrfCoordinatorV2),
            1000000000000000000,
            "",
            subId,
            20000,
            5
        );
        vrfCoordinatorV2.addConsumer(subId, address(raffle));
        vm.startPrank(address(0));
        deal(address(0), 9000000000000000000);
    }

    //TODO: Move to a helper contract
    function helperEnterMultipleAddress() public {
        vm.prank(address(1));
        deal(address(1), 9000000000000000000);
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.prank(address(2));
        deal(address(2), 9000000000000000000);
        raffle.enterRaffle{value: 1100000000000000000}();
        vm.prank(address(3));
        deal(address(3), 9000000000000000000);
        raffle.enterRaffle{value: 1100000000000000000}();
    }
}
