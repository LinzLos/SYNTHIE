# SYNTHIE Regression Cases

Each folder is one **known failure mode of AI qualitative synthesis** — a way a
tool can present a confident insight the data doesn't support. Re-run these
against any new version of the script to measure what it catches and to make
sure fixes don't backslide.

> Unlike FLOWIE's case 001 (a real captured miss), these are **designed traps** —
> small transcripts engineered to bait a specific synthesis error. They test
> whether SYNTHIE's invariants fire, not a real-world incident.

## Folder format

```
NNN-short-slug/
  input.md      A short transcript or note set containing a planted trap.
  expected.md   What SYNTHIE SHOULD do — and the wrong move it must avoid.
```

## How to run a case

1. Feed `input.md` to SYNTHIE (the current version in `manifest.json`).
2. Compare its synthesis against `expected.md`.
3. Score: **caught** (avoided the trap and named why), **partial** (hedged but
   still leaned wrong), or **missed** (walked into the trap).

## Scoring log

| Case | v1.3 | v1.4 |
|------|------|------|
| 001-outlier-as-theme | missed | caught |
| 002-quantifier-overreach | missed | caught |
| 003-quote-misattribution | missed | caught |

> Caveats: (1) these traps were authored alongside the v1.4 invariants they
> exercise, so a "caught" confirms the invariant *fires when the structure is
> present* — not an independent audit. (2) v1.3 is scored "missed" on structural
> grounds (no evidence ledger, none of these invariants, relevant feedback
> optional/off), not a separate run. A real-world miss would be a stronger
> fixture than a designed trap.

## Adding a case

Every real-world miss becomes the next case. Number it sequentially, write a
tight `expected.md` that names the *specific* error to avoid, and add a row to
the scoring log.
