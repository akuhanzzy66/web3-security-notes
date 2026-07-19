// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @notice Intentionally vulnerable contract for local security review practice.
/// @dev Do not deploy with real funds.
contract VulnerableVault {
    address public owner;

    event Deposit(address indexed sender, uint256 amount);
    event EmergencyWithdraw(address indexed caller, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        require(msg.value > 0, "zero deposit");
        emit Deposit(msg.sender, msg.value);
    }

    // VULNERABILITY: Missing access control. Any address can drain the vault.
    function emergencyWithdraw() external {
        uint256 amount = address(this).balance;
        payable(msg.sender).transfer(amount);
        emit EmergencyWithdraw(msg.sender, amount);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }
}
