# Foundry Local Testing Workflow

A safe workflow for validating Web3 findings in local or forked environments.

## Goals

- Reproduce findings without touching unauthorized production systems.
- Keep proof-of-concept tests deterministic.
- Capture enough evidence for maintainers to verify quickly.
- Avoid handling private keys, secrets, or user data.

## 1. Prepare Workspace

```bash
mkdir audit-lab
cd audit-lab
forge init --no-commit
```

Recommended structure:

```text
src/        contracts under review or minimized reproduction contracts
test/       Foundry tests proving or disproving a hypothesis
script/     local-only helper scripts
notes/      scope, assumptions, and analysis notes
```

## 2. Record Scope

Create `notes/scope.md`:

```markdown
# Scope

- Program/repository:
- Commit hash:
- Chain/fork:
- Authorized testing environment:
- Out-of-scope actions:
- Relevant docs:
```

## 3. Form a Hypothesis

Use hypothesis-first language:

```markdown
Hypothesis: Function X may allow unauthorized value movement because condition Y is missing.
Evidence present: Function modifies critical state and is externally callable.
Evidence missing: Need test proving attacker can satisfy preconditions.
Next verification step: Write Foundry test from non-privileged address.
```

## 4. Write a Local Test

Example pattern:

```solidity
function testHypothesisName() public {
    // arrange
    // act
    // assert
}
```

Quality gates:

- [ ] Test starts from clean state.
- [ ] Attacker and victim roles are explicit.
- [ ] Assertions prove impact, not just successful execution.
- [ ] Test does not require real private keys.

## 5. Fork Testing, When Allowed

Use public RPC only if the program allows fork simulation:

```bash
forge test --fork-url https://ethereum.publicnode.com -vvv
```

Do not broadcast transactions unless the program explicitly permits it.

## 6. Static Analysis Triage

Run Slither when available:

```bash
slither . --exclude-dependencies
```

Triage output:

| Detector | Status | Reason |
|---|---|---|
| access-control | Needs review | Critical function has no modifier |
| reentrancy | False positive / Confirmed | Explain why |

## 7. Evidence Capture

For each validated issue, save:

- Commit hash or source reference
- Relevant code snippet
- Test file path
- Test command
- Passing test output
- Impact explanation
- Suggested mitigation

## 8. Report

Use `responsible-disclosure-template.md` and keep claims limited to evidence.
