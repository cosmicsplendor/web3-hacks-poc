pragma solidity ^0.8.6;

import "forge-std/Test.sol";

contract GasTest is Test {
    bytes8 key = bytes8(uint64(0x100004EFE));
    function testKeyOnly() public {
        address gateKeeper = 0x2232A159Dcee0a7739661408B60bd3b0C4304cdF;
        address gasContract = 0xe3779a0957693f97655c5db5846969fba04F5BA3;

        vm.startPrank(
            0x52589e1e6309415C5272656565b6AC0758f54EFe,
            0x52589e1e6309415C5272656565b6AC0758f54EFe
        );

        (bool success, bytes memory reason) = address(gateKeeper).call{
            gas: 8191 * 100
        }(abi.encodeWithSignature("enter(bytes8)", key));
        console.log("success:", success);
        console.logBytes(reason);
        vm.stopPrank();
    }
    function testFindGas() public {
        address gateKeeper = 0x2232A159Dcee0a7739661408B60bd3b0C4304cdF;
        address gasContract = 0xe3779a0957693f97655c5db5846969fba04F5BA3;
        vm.startPrank(
            0x52589e1e6309415C5272656565b6AC0758f54EFe,
            0x52589e1e6309415C5272656565b6AC0758f54EFe
        );
        for (uint256 gas = 100000; gas < 101000; gas++) {
            (bool success, ) = address(gasContract).call{gas: gas}(
                abi.encodeWithSignature("test(address,bytes8)", gateKeeper, key)
            );
            if (success) {
                console.log("Success at gas: ", gas);
                break;
            }
        }
        vm.stopPrank();
    }
}
