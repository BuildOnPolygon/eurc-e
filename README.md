# EURC-e

EURC-e contracts, from the original EURC codebase from [Circle](https://www.circle.com/en/eurc).

Just formatted and added deploy scripts.

## Deploy and Init

1. setup .env

2. start anvil if forking

```shell
anvil --fork-url https://zkevm-rpc.com/ --chain-id 1101 --port 7000 # fork zkevm mainnet
# or
anvil --fork-url https://rpc.cardona.zkevm-rpc.com --chain-id 2442 --port 7000 # fork zkevm cardona testnet
```

3. run the scripts

```shell
export RPC=http://localhost:7000
# or
export RPC=https://rpc.cardona.zkevm-rpc.com
# or
export RPC=https://zkevm-rpc.com/

# deploy and initialize
forge script script/DeployInitEURCe.s.sol:DeployInitEURCe --legacy --fork-url $RPC -vvvvv --verify --etherscan-api-key <> --broadcast

# do this after deploying eurc-lxly
forge script script/ConfigureLxLyMinter.s.sol:SetMinters --legacy --fork-url $RPC -vvvvv --broadcast

# transfer power
forge script script/RelinquishPower.s.sol:RelinquishPower --legacy --fork-url $RPC -vvvvv --broadcast
```
