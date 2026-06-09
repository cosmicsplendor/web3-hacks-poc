# Deploy Attack Contract
> forge create src/AttackerContract.sol:AttackerContract --rpc-url https://ethereum-sepolia-rpc.publicnode.com --broadcast --private-key 0x30f66b88db2a76835f4aca8738cbd5cec8c315d94a55113c29b33c360b14abf1

[⠊] Compiling...
No files changed, compilation skipped
Deployer: 0x52589e1e6309415C5272656565b6AC0758f54EFe
Deployed to: 0xF3F0ad7BA0053Fa439D927E85546d14285644F31
Transaction hash: 0xcbb117e0ce4264a917f096a82ddfdf2cb60b73967ceef8cca9acfa0270cdf33b

# Invoke Script that Executes Attack via Attack Contract
> forge script script/AttackScript.s.sol:AttackScript --rpc-url https://ethereum-sepolia-rpc.publicnode.com --private-key 0x30f66b88db2a76835f4aca8738cbd5cec8c315d94a55113c29b33c360b14abf1 --broadcast --skip-simulation

# One-Off Call that Executes Attack
> cast send 0x9EEBd92f975Fe6e9015F4880039E30998d1446CF "attack()" --rpc-url https://ethereum-sepolia-rpc.publicnode.com --private-key 0x30f66b88db2a76835f4aca8738cbd5cec8c315d94a55113c29b33c360b14abf1

# See Balance
> cast balance 0x46F1fC1a4C79a254537803d8ba984E396408e0b3 --ether --rpc-url https://ethereum-sepolia-rpc.publicnode.com