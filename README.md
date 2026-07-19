# Web3 Security Notes

Independent notes and sample materials for **authorized** Web3 vulnerability research, smart contract review, and responsible disclosure.

> Status: public portfolio in progress. This repository focuses on defensive research workflows, reproducible local testing, and remediation-oriented reporting. It is not a claim of paid bounty wins, client audits, or CVE authorship.

**GitHub:** [akuhanzzy66/web3-security-notes](https://github.com/akuhanzzy66/web3-security-notes)

## Focus Areas

- Solidity smart contract review
- Protocol logic and accounting analysis
- Access control and privilege boundary review
- Oracle and price manipulation risk analysis
- Reentrancy and external-call safety
- Foundry-based local testing and fork simulation
- Static-analysis triage (e.g. Slither)
- Responsible disclosure report writing

## Operating Principles

1. Work only on authorized scopes: public bug bounty programs, open-source repositories, local labs, testnets, or explicit client authorization.
2. Prefer local reproduction, unit tests, and forked-chain simulations over production interaction.
3. Do not request, store, or expose private keys, seed phrases, passwords, credentials, or user data.
4. Treat AI assistance as an analyst aid, not autonomous exploitation.
5. Produce reports that emphasize root cause, impact, reproducibility, and mitigation.

## Repository Contents

| Path | Purpose |
|---|---|
| [`solidity-vulnerability-checklist.md`](./solidity-vulnerability-checklist.md) | Review checklist for common Solidity / DeFi vulnerability classes |
| [`sample-report-access-control.md`](./sample-report-access-control.md) | Sample vulnerability report (lab contract, educational) |
| [`foundry-local-testing-workflow.md`](./foundry-local-testing-workflow.md) | Safe local / forked-chain testing workflow |
| [`responsible-disclosure-template.md`](./responsible-disclosure-template.md) | Reusable report template for bounties / maintainers |
| [`lab/VulnerableVault.sol`](./lab/VulnerableVault.sol) | Intentionally vulnerable contract (do not deploy with funds) |
| [`lab/src/VulnerableVault.sol`](./lab/src/VulnerableVault.sol) | Foundry `src/` copy used by tests |
| [`lab/test/VulnerableVault.t.sol`](./lab/test/VulnerableVault.t.sol) | Runnable Foundry PoC for missing access control |
| [`docs/immunefi-profile-bio.md`](./docs/immunefi-profile-bio.md) | Bug bounty profile bio draft |
| [`docs/openai-trusted-access-application.md`](./docs/openai-trusted-access-application.md) | Trusted Access for Cyber application draft |

## Quick Lab Test (Foundry)

```bash
cd lab
# forge-std is gitignored; install once:
git clone --depth 1 https://github.com/foundry-rs/forge-std lib/forge-std
forge test -vv
```

Expected: `testUnauthorizedEmergencyWithdrawDrainsVault` **PASS**.

## Intended Use

This repository demonstrates a defensive workflow for security programs and maintainers. It is **not**:

- a collection of production exploits
- malware / phishing material
- guidance for unauthorized access
- a fabricated track-record of paid findings

Sample contracts and reports are **educational / lab-only**.

## Researcher

| Field | Value |
|---|---|
| Name | Hanji Wong |
| GitHub | [@akuhanzzy66](https://github.com/akuhanzzy66) |
| Email | muhammad.farhanhants@gmail.com |
| Role | Independent Web3 security researcher (portfolio building) |
| Channels | Public bug bounty programs (e.g. Immunefi), open-source review, local labs |

## Disclaimer

All research described here is intended for authorized scopes only. Validate findings in local, testnet, or forked environments whenever possible. Do not interact with production systems or real user funds outside program rules.
