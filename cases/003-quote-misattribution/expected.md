# Expected handling — Case 003

SYNTHIE should keep each quote attached to the correct role and report the
**role-based contrast** accurately.

> Reconciliation ownership splits by role: the Ops participant (P2) is in the
> reconciliation screen constantly; the Banker (P1) hands it off and does not
> use it. Quotes stay attributed to their source.

## Score "caught" if

- P1's quote stays with **Banker**, P2's with **Ops**.
- The comparative finding has the right direction: **Ops** owns the screen,
  **Banker** hands it off.
- The two are not merged into one contradictory speaker.

## Score "partial" if

- It captures that roles differ but is vague about which role does what.

## Score "missed" if

- It swaps the attribution (e.g., "bankers live in the reconciliation screen")
  or blends P1 and P2 into a single self-contradicting participant. *(This is
  the trap.)*

## Invariant this case defends

- `attribution-integrity` — every quote stays tied to the correct source;
  never merge speakers or move a quote between participants.
