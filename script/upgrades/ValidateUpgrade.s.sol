pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Options} from "openzeppelin-foundry-upgrades/Options.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {YieldDistributor} from "../../src/YieldDistributor.sol";
import {ButteredBread} from "../../src/ButteredBread.sol";

contract ValidateUpgrade is Script {
    function run() external {
        vm.startBroadcast();
        
        // Validate YieldDistributor upgrade against current flattened reference
        Options memory yieldOpts;
        yieldOpts.referenceContract = "current/YieldDistributor.sol:YieldDistributor";
        Upgrades.validateUpgrade("YieldDistributor.sol:YieldDistributor", yieldOpts);
        
        // Validate ButteredBread upgrade against current flattened reference
        Options memory breadOpts;
        breadOpts.referenceContract = "current/ButteredBread.sol:ButteredBread";
        Upgrades.validateUpgrade("ButteredBread.sol:ButteredBread", breadOpts);
        
        vm.stopBroadcast();
    }
}
