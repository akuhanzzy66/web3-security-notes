# Web3 Security Notes

Independent notes and sample reports for authorized Web3 vulnerability research, smart contract review, and responsible disclosure.

> Status: portfolio in progress. This repository is intentionally focused on defensive research workflows, reproducible local testing, and remediation-oriented reporting.

## Focus Areas

- Solidity smart contract review
- Protocol logic and accounting analysis
- Access control and privilege boundary review
- Oracle and price manipulation risk analysis
- Reentrancy and external-call safety
- Foundry-based local testing and fork simulation
- Static-analysis triage with tools such as Slither
- Responsible disclosure report writing

## Operating Principles

1. Work only on authorized scopes: public bug bounty programs, open-source repositories, local labs, testnets, or explicit client authorization.
2. Prefer local reproduction, unit tests, and forked-chain simulations over production interaction.
3. Do not request, store, or expose private keys, seed phrases, passwords, credentials, or user data.
4. Treat AI assistance as an analyst aid, not autonomous exploitation.
5. Produce reports that emphasize root cause, impact, reproducibility, and mitigation.

## Repository Contents

| File | Purpose |
|---|---|
| [`solidity-vulnerability-checklist.md`](./solidity-vulnerability-checklist.md) | Review checklist for common Solidity and DeFi vulnerability classes. |
| [`sample-report-access-control.md`](./sample-report-access-control.md) | Example vulnerability report using a deliberately simple access-control issue. |
| [`foundry-local-testing-workflow.md`](./foundry-local-testing-workflow.md) | Safe local/forked-chain testing workflow for validating findings. |
| [`responsible-disclosure-template.md`](./responsible-disclosure-template.md) | Reusable template for bug bounty or maintainer reports. |
| [`lab/VulnerableVault.sol`](./lab/VulnerableVault.sol) | Minimal intentionally vulnerable contract for local review practice. |

## Intended Use

This repository is meant to demonstrate a defensive workflow for security programs and maintainers. It is not a collection of production exploits, malware, phishing material, or unauthorized access techniques.

## Contact

Researcher: Hanji Wong  
Status: Independent Web3 security researcher building public portfolio
