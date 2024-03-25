pragma solidity 0.6.12;

import "forge-std/Script.sol";

import "../src/impl/v2/FiatTokenV2_2.sol";

contract RelinquishPower is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("DEPLOYER_PRIVATE_KEY"));

        address polygonSafe = vm.envAddress("POLYGON_MULTISIG");

        FiatTokenV2_2 eurc = FiatTokenV2_2(vm.envAddress("ADDRESS_L2_EURC"));
        eurc.updateMasterMinter(polygonSafe);
        eurc.updatePauser(polygonSafe);
        eurc.updateBlacklister(polygonSafe);
        eurc.transferOwnership(polygonSafe);

        vm.stopBroadcast();
    }
}
