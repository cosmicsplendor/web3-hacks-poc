// SPDX_LICENSE-Identifier: MIT
pragma solidity ^0.8.6;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";
import {GasContract, GatekeeperOne} from "../src/GasContract.sol";

contract GasTest is Script {
    bytes8 key = bytes8(uint64(0x100004EFE));
    function run() public {
        address gateKeeper = 0x2232A159Dcee0a7739661408B60bd3b0C4304cdF;
        address gasContract = 0xdFC9BcC5Ab27e8C9692864744F5473026E377bC5;
        vm.startBroadcast();
        for (uint256 gas=100000; gas < 120000; gas++) {
            console.log("Trying with gas: ", gas);
            (bool success,) = address(gasContract).call{gas: gas}(
                    abi.encodeWithSignature("test(address,bytes8)",gateKeeper, key)
            );
            if (success) {
                console.log("Success! Gas used: ", gas);
                break;
            }
        }
        vm.stopBroadcast();
    }
}
