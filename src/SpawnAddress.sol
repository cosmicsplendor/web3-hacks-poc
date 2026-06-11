// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
contract SpawnedAddress {
    function deriveAddress(address deployer, uint8 nonce) public pure returns (address) {
        return address(uint160(uint256(keccak256(
            abi.encodePacked(
                bytes1(0xd6),
                bytes1(0x94),
                deployer,
                bytes1(nonce)
            )
        ))));
    }
}