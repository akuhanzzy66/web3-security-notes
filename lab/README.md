# Lab: VulnerableVault

Intentionally vulnerable Solidity contract for **local** security review practice.

## Warning

- Do **not** deploy with real funds.
- Educational / portfolio use only.
- Vulnerability: `emergencyWithdraw()` lacks access control.

## Layout

```text
lab/
  VulnerableVault.sol      # canonical sample (also linked from main README)
  src/VulnerableVault.sol  # Foundry source
  test/VulnerableVault.t.sol
  foundry.toml
```

## Run PoC

```bash
cd lab
git clone --depth 1 https://github.com/foundry-rs/forge-std lib/forge-std
forge test -vv
```

## Mapping to sample report

See [`../sample-report-access-control.md`](../sample-report-access-control.md).
