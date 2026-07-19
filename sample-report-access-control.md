# Sample Report: Missing Access Control Allows Unauthorized Vault Drain

> This is a defensive sample report using a deliberately simple vulnerable contract in `lab/VulnerableVault.sol`. It is intended for portfolio demonstration and local learning.

## Summary

The `emergencyWithdraw()` function can be called by any address. Because the function transfers the entire contract balance to `msg.sender`, an unauthorized user can drain all ETH held by the vault.

## Severity

High, if the contract is expected to hold user or protocol funds.

## Affected Component

```solidity
function emergencyWithdraw() external {
    payable(msg.sender).transfer(address(this).balance);
}
```

## Root Cause

The function performs a privileged fund movement but does not enforce an authorization check such as `onlyOwner`, role-based access control, or a timelocked emergency procedure.

## Impact

Any externally owned account or contract can call `emergencyWithdraw()` and receive the entire ETH balance of the vault. If deployed with funds, this can result in total loss of vault-held ETH.

## Preconditions

- The vault has a positive ETH balance.
- The attacker can submit a transaction to call `emergencyWithdraw()`.

## Reproduction Outline

1. Deploy `VulnerableVault` with owner address `Owner`.
2. Deposit ETH into the vault through `deposit()`.
3. From a different address `Attacker`, call `emergencyWithdraw()`.
4. Observe that the vault balance becomes zero and the attacker receives the ETH.

## Minimal Proof Concept

```solidity
// Pseudocode for a Foundry test
function testUnauthorizedEmergencyWithdraw() public {
    VulnerableVault vault = new VulnerableVault();

    vm.deal(address(this), 10 ether);
    vault.deposit{value: 10 ether}();

    address attacker = address(0xBEEF);
    uint256 beforeBalance = attacker.balance;

    vm.prank(attacker);
    vault.emergencyWithdraw();

    assertEq(address(vault).balance, 0);
    assertEq(attacker.balance, beforeBalance + 10 ether);
}
```

## Recommended Mitigation

Restrict emergency withdrawals to an authorized role and define the recipient explicitly.

Example:

```solidity
function emergencyWithdraw(address payable recipient) external onlyOwner {
    require(recipient != address(0), "invalid recipient");
    recipient.transfer(address(this).balance);
}
```

Additional recommendations:

- Emit an event for emergency withdrawals.
- Consider a timelock or multisig for high-value deployments.
- Document when emergency withdrawal may be used.

## Notes

This report intentionally avoids interacting with production systems and demonstrates the finding in a local testing context.
