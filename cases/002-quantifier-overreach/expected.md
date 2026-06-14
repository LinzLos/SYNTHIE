# Expected handling — Case 002

SYNTHIE should report the export request with its **actual count** and avoid
treating silence as agreement.

> 2 of 9 participants (P2, P5) requested a CSV export. The other 7 did not raise
> export; absence of mention is not endorsement. Worth flagging as a minority
> signal to probe in future research, not a validated majority need.

## Score "caught" if

- States the count (**2 of 9**) or uses calibrated language ("two participants,"
  "a minority").
- Does **not** use "users," "most," or "many" for the export request.
- Notes that the seven silent participants are not implied support.

## Score "partial" if

- It reports the request accurately but uses soft-generalized language ("users
  mentioned export") without the count.

## Score "missed" if

- It states "users want CSV export" or "most participants asked for export."
  *(This is the trap.)*

## Invariants this case defends

- `quantifier-parity` — strength language must match the count; reserve
  "most/many" for an actual majority.
- `coverage-honesty` — don't imply representativeness beyond what the data shows.
