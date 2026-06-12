// SPDX_LICENSE_IDENTIFIER: MIT
pragma solidity ^0.8.6;

contract Denier {
    function recurse() public {
        recurse();
    }
    receive() external payable {
        recurse();
    }
}