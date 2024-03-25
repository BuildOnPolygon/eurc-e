pragma solidity 0.6.12;

import "forge-std/Script.sol";

import "../src/impl/v2/FiatTokenV2_2.sol";

contract SetMinters is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("DEPLOYER_PRIVATE_KEY"));

        FiatTokenV2_2 eurc = FiatTokenV2_2(vm.envAddress("ADDRESS_L2_EURC"));
        uint256 minterAllowedAmount = 250_000_000 * 10 ** 6;

        eurc.configureMinter(vm.envAddress("ADDRESS_MINTER_BURNER"), minterAllowedAmount);
        eurc.configureMinter(vm.envAddress("ADDRESS_NATIVE_CONVERTER"), minterAllowedAmount);

        vm.stopBroadcast();
    }
}
