# Deploy Attack Contract
> forge create src/AttackerContract.sol:AttackerContract --rpc-url https://ethereum-sepolia-rpc.publicnode.com --broadcast --private-key $PRIVATE_KEY

[⠊] Compiling...
No files changed, compilation skipped
Deployer: 0x52589e1e6309415C5272656565b6AC0758f54EFe
Deployed to: 0xF3F0ad7BA0053Fa439D927E85546d14285644F31
Transaction hash: 0xcbb117e0ce4264a917f096a82ddfdf2cb60b73967ceef8cca9acfa0270cdf33b

# Invoke Script that Executes Attack via Attack Contract
> forge script script/AttackScript.s.sol:AttackScript --rpc-url https://ethereum-sepolia-rpc.publicnode.com --private-key $PRIVATE_KEY --broadcast --skip-simulation

# One-Off Call that Executes Attack
> cast send 0x9EEBd92f975Fe6e9015F4880039E30998d1446CF "attack()" --rpc-url https://ethereum-sepolia-rpc.publicnode.com --private-key $PRIVATE_KEY

# One-Off Call with Params
> cast send 0xd13c691bD72D43cCE77e9A3a0618b0F7171B1792 "unlock(bytes32)" 0x412076657279207374726f6e67207365637265742070617373776f7264203a29 --rpc-url $RPC_URL --private-key $PRIVATE_KEY

# Payable Call that Executes Attack
> cast send 0x33ab033195Cb0454562d964997F041e74cE6fD73 "attack()" --value 0.01ether --rpc-url $RPC_URL --private-key $PRIVATE_KEY

# See Balance
> cast balance 0x46F1fC1a4C79a254537803d8ba984E396408e0b3 --ether --rpc-url https://ethereum-sepolia-rpc.publicnode.com

# See a Contract Storage Slot (Private/Public)
> cast storage 0xd13c691bD72D43cCE77e9A3a0618b0F7171B1792 1 --rpc-url $RPC_URL

# Fork RPC
> anvil --fork-url $RPC_URL