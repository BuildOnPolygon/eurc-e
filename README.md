# EURC

EURC contracts from [Circle](https://www.circle.com/en/eurc).

## Deploy and Init

setup .env

### Fork
start anvil
```shell
# fork zkevm mainnet
anvil --fork-url https://zkevm-rpc.com/ --chain-id 1101 --port 7000

# fork zkevm cardona testnet
# anvil --fork-url https://rpc.cardona.zkevm-rpc.com --chain-id 2442 --port 7000
```

deploy
```shell
forge script script/DeployInitEURC.s.sol:DeployInitEURC --legacy --fork-url http://localhost:7000 -vvvvv --broadcast
```

### Cardona Testnet
```shell
forge script script/DeployInitEURC.s.sol:DeployInitEURC --legacy --fork-url https://rpc.cardona.zkevm-rpc.com -vvvvv --broadcast
```


### ZkEVM Mainnet
```shell
forge script script/DeployInitEURC.s.sol:DeployInitEURC --legacy --fork-url https://zkevm-rpc.com/ -vvvvv --broadcast
```
