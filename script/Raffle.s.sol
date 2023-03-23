// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Raffle} from "src/Raffle.sol";

contract RaffleScript is Script {
    function setUp() public {}

    function run() public {
        //vm.broadcast();
        vm.startBroadcast();
        new Raffle(
            0x271682DEB8C4E0901D1a1550aD2e64D568E69909,
            100000000000,
            "",
            1,
            20000,
            5
        );
        vm.stopBroadcast();
    }
}
