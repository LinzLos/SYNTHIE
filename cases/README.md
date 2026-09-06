# SYNTHIE Regression Cases

Each folder is one **known failure mode of AI qualitative synthesis** — a way a
tool can present a confident insight the data doesn't support. Re-run these
against any new version of the script to measure what it catches and to make
sure fixes don't backslide.

> Cases 001–005 are **designed traps** — small transcripts engineered to bait a
> specific synthesis error. They test whether SYNTHIE's invariants fire, not a
> real-world incident. Case 006 is the first **real-world** fixture: excerpts of
> an actual research report, anonymized, with the misreadings the design team
> actually made.

## Folder format

```
NNN-short-slug/
  input.md      A short transcript or note set containing a planted trap —
                or, for derived-input cases (006+), an existing synthesis to audit.
  expected.md   What SYNTHIE SHOULD do — and the wrong move it must avoid.
```

## How to run a case

1. Feed `input.md` to SYNTHIE (the current version in `manifest.json`).
2. Compare its synthesis against `expected.md`.
3. Score: **caught** (avoided the trap and named why), **partial** (hedged but
   still leaned wrong), or **missed** (walked into the trap).

## Scoring log

| Case | v1.3 | v1.4 | v1.5 | v1.6 |
|------|------|------|------|------|
| 001-outlier-as-theme | missed | caught | — | — |
| 002-quantifier-overreach | missed | caught | — | — |
| 003-quote-misattribution | missed | caught | — | — |
| 004-fabricated-claim | missed | caught | — | — |
| 005-coverage-overreach | missed | caught | — | — |
| 006-second-order-audit | — | — | caught | — |

> v1.7 has no column: it was a licensing-only release with no behavioral change
> from v1.6, so v1.6's scores carry.
>
> v1.6 changes only the derived-input clauses (evidence ladder, persona-mismatch
> note), so 001–005 carry from v1.4 and 006 stays "—" until a blind v1.6 run.
>
> v1.5 on 001–005 is "—": its changes are packaging (#1), a derived-input mode
> (#2) whose clauses are all conditional on `source-fidelity: derived`, and copy
> (#3), so the raw-transcript path is unchanged and v1.4's scores carry.
>
> Note on 006: **real-world, derived input** (issue #5). The input is an
> anonymized excerpt of a real Round-4 usability report and the design team's
> own downstream tracking doc, which carried a P0 finding resting on one
> participant forward as an established need. It is the first fixture for the
> v1.5 `source-fidelity: derived` path and for the derived clauses of
> `attribution-integrity`, `coverage-honesty`, and `evidence-traceability`. v1.3
> and v1.4 have no derived mode.
>
> **v1.5 scored caught on a blind run (2026-09-06)** — the first non-structural
> score in this log. Protocol: a fresh agent given only the script and
> `input.md` pasted into its prompt, no tools, no file access, never
> `expected.md`. Verbatim output in `006-second-order-audit/runs/`. It inferred
> derived mode unprompted, marked every attribution "trusts upstream
> synthesis", reported document and study coverage separately, named Finding
> 8's P0-on-one-participant against the report's own open question, flagged
> the roadmap's "as requested by P2" and the shipped nudge as n=1 promotions,
> replaced "widespread" with a count, and caught the unattributed quote and
> the "both implied" inference. Beyond the rubric it corrected the Surface B
> denominator (P3 never tested the admin surface, so "3 of 6" is really 3 of
> 5) and noticed the source's own numbering gap (8 → 10). Caveats: (1) it
> cited open question 2 but not the goal table's INCONCLUSIVE verdict, and did
> not name P3 as a founder standing in for an employee; (2) it labels every
> paraphrased-but-participant-named finding "unsupported-in-source", the same
> tag it gives findings with no participant at all — Findings 3/4/5 were kept
> as the strongest tier, so not a false positive, but the label is doing
> double duty (script follow-up); (3) one wrong inference, reading the
> tracking doc's "p17 #5" as open question 5 — a fixture ambiguity, since
> `input.md` did not say the notation means page/bullet; fixed in the input.

> Caveats: (1) these traps were authored alongside the v1.4 invariants they
> exercise, so a "caught" confirms the invariant *fires when the structure is
> present* — not an independent audit. (2) v1.3 is scored "missed" on structural
> grounds (no evidence ledger, none of these invariants, relevant feedback
> optional/off), not a separate run. A real-world miss would be a stronger
> fixture than a designed trap. (3) 004 (`evidence-traceability`) and 005
> (`coverage-honesty`) were added 2026-06-14 to close the two v1.4 invariants
> that previously had no regression trap; their v1.4 "caught" is a structural
> score (the invariant is present and on-point), pending an independent run.

## Adding a case

Every real-world miss becomes the next case. Number it sequentially, write a
tight `expected.md` that names the *specific* error to avoid, and add a row to
the scoring log. Real material must be anonymized before it lands here (the
repo is public): strip participant names, employers, and researcher contact
details; keep ids, roles, counts, wording, and structure.
