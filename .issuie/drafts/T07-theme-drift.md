## Description
Add theme-drift detection to the operator: when the sweep runs the same study
target again, diff the new evidence contract against the previous dated report
and flag any claim whose strength dropped, whose quote ids no longer resolve, or
which vanished entirely — e.g. "theme X was 4 of 9 (q3, q7, q12, q20) on
2026-09-06; now 3 of 10 and q12 no longer exists in the input." This is the
README's "flagging when a claimed theme loses its evidence," made mechanical.

## Why
The operator (T06) reports each sweep in isolation. The failure the README names
is temporal: a theme that held at session 6 quietly stops holding at session 10
as transcripts land, and nobody re-reads the old contract. A diff between
contracts is a checkable invariant in its own right (`evidence-persistence`: a
claim carried forward must still trace to quotes that exist at the current
count), and belongs in the script as a named invariant once the mechanism exists.

## Recommended prerequisite
T06 (the operator) — needs dated reports with a stable evidence-contract format
to diff, and the sweep loop to run in.

## Scope
- Stable, parseable contract line format (claim id · count · quote ids · fidelity), fixed in the script so two runs are comparable. May need a version bump.
- `scripts/synthie-drift.sh` (or a step in the sweep): given two dated reports for one target, emit dropped / weakened / unresolved-quote claims; nonzero exit on any.
- New invariant `evidence-persistence` in the script's `<invariants>`; the traceability check cites the previous contract when one exists.
- Regression case 007-theme-drift: two input snapshots of one study (session 6 vs session 10) where a theme's support falls below its stated strength.

## Touches
- `scripts/versions/v1.8/*` (new invariant + contract format — shared script file)
- `scripts/synthie-sweep.sh`, `scripts/synthie-drift.sh`
- `cases/007-theme-drift/`, `cases/README.md`
- `README.md`

## Source
README "Where it's going"; split out of T06 on 2026-09-06 so the operator can ship without it.

## Owner
Lindsay.

## Acceptance criteria
- [ ] Two sweeps of the same target produce contracts the drift step can diff without hand-editing
- [ ] A theme whose count drops, or whose quote id disappears, is flagged by name with both values (before → after)
- [ ] `evidence-persistence` exists as a named invariant in the script and a regression case defends it
- [ ] No drift logic outside the script + the diff step; the operator still contains no analysis
