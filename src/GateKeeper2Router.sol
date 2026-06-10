// SPDX_LISENSE-Identifier: MIT
pragma solidity ^0.8.6;

interface GateKeeperOne {
    function enter(bytes8 key) external returns (bool);
}
contract GateKeeperTwoRouter {
    address public immutable gatekeeper = 0xDDE600849c78FC5d4E8a70Bed884682A5499e47F;
    constructor() {
        GateKeeperOne(gatekeeper).enter(
            ~bytes8(keccak256(abi.encodePacked(address(this))))
        );
    }
}