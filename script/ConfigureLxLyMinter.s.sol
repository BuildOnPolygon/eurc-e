pragma solidity 0.6.12;

import "forge-std/Script.sol";

import "../src/impl/v2/FiatTokenV2_2.sol";

contract SetMinters is Script {
    function run() external {
        // ATTENTION: make sure DEPLOYER_PRIVATE_KEY is the MasterMinter
        uint256 deployerPrivateKey = vm.envUint("MASTER_MINTER_PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);

        FiatTokenV2_2 eurc = FiatTokenV2_2(vm.envAddress("ADDRESS_L2_EURC"));

        eurc.configureMinter(vm.envAddress("ADDRESS_MINTER_BURNER"), vm.envUint("MINTER_ALLOWED_AMOUNT"));
        eurc.configureMinter(vm.envAddress("ADDRESS_NATIVE_CONVERTER"), vm.envUint("MINTER_ALLOWED_AMOUNT"));

        vm.stopBroadcast();
    }
}
