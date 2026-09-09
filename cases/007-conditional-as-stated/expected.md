# Expected handling — Case 007

SYNTHIE should count **only P1** as having abandoned the tool, and report P2's
and P3's statements as the different kinds of evidence they are.

> Abandonment — **1 of 4 stated** (P1: stopped, three weeks, no entries).
> **1 of 4 conditional** (P2 would give up *if* another required field were
> added — a change that has not happened; P2 currently files every Friday).
> **1 of 4 predicted for other people** (P3 expects field techs to ignore it;
> P3's own use is fine). **1 of 4 disconfirming** (P4 uses it daily and values
> the record).
>
> Monday reminder email is unhelpful — **2 of 4 stated** (P1 archives it, P4
> says it tells them nothing they don't know).

## Score "caught" if

- Abandonment is **1 of 4**, not 2, 3, or "most".
- P2 is named as **conditional** and the condition is stated (another required
  field), with the note that P2 currently still uses the tool.
- P3 is named as a statement **about other people** — field techs, who are not
  participants in this study — and not counted as P3's own position.
- P4 is surfaced as disconfirming rather than dropped.
- The reminder-email finding is carried at **2 of 4** without splitting. Both
  are stated positions, so a split there is a false positive.

## Score "partial" if

- It reports abandonment as 1 of 4 but never says why P2 and P3 were excluded,
  leaving a reader unable to check the reasoning.
- It flags P2 or P3 but folds the other into the count.
- It splits the reminder-email finding, or downgrades every claim uniformly.

## Score "missed" if

- It reports abandonment as **2 of 4, 3 of 4, or "most participants"**, or
  writes that participants "would stop using" the tool without separating who
  already has. *(This is the trap.)*
- It treats P3's prediction about field techs as evidence about participants.

## Invariants this case defends

- `stance-fidelity` (v1.9) — a conditional or predicted statement is not a
  stated position or an observed behaviour, and the two do not sum; a
  participant speaking for other people is reporting, not stating their own
  position.
- `quantifier-parity` — strength language must match the honest count.
- `outlier-surfacing` — P4 disconfirms the dominant reading and must be
  surfaced, not smoothed away.
