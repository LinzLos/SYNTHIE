# Expected handling — Case 006

This is the first **derived-input** case and the first **real-world** one. The
input is a report, not transcripts. SYNTHIE should recognize that, run in
`source-fidelity: derived`, and then audit the document against itself: what its
own quoted evidence and counts support, and where its language outruns them.

> Source fidelity: **derived** — a research report; no transcripts supplied.
> Attribution for every quote: *trusts upstream synthesis (unverified)*.
> Coverage: full report read (all findings, open questions, appendix). Study
> coverage *as reported, not verified*: N=6; Track A (admin) n=5; Track B+C
> (employee + community admin) **n=1, P3**, who is a climate-tech founder, not
> an employee.
>
> **Finding 8 · P0 "manual logging predicts abandonment" — 1 of 6 (P3) —
> supported for P3 only.** The report's own goal table rates the same evidence
> INCONCLUSIVE and its open question 2 says the prediction "requires empirical
> testing." A P0 severity on n=1 is quantifier-count mismatch inside the source.
> Downstream, this became three designed features and a "supply-chain thesis."
> **Finding 7 · P1 — 1 of 6 (P3).** Same single participant; the report's open
> question 5 calls the track "directional but insufficient."
> **Roadmap Priority 1 "as requested by P2" — 1 of 6.** A single request
> promoted to the top roadmap priority.
> **Nudge (p17 #4) — 1 of 6 (P4)**, shipped as a feature while the report's
> open question 4 leaves the nudge mechanism unresolved.
> **"When probed, concerns were widespread" — unquantified**; the count given
> is 2 of 6 unprompted (P1, P3) plus P5 on probing = at most 3 of 6.
> **"Organizations like P1's council maintain dual systems"** — generalized
> from 1 of 6.
> **"The 'massive thing' in Australia" — quoted phrase, no participant
> attributed** — unsupported-in-source.
> **Finding 11 "both implied"** — inference presented as observation, against
> the report's own rule that findings are "not inference."
>
> Carried as stated (counts explicit and participant-listed, no correction
> needed): Finding 3 (3 of 6: P2, P5, P6), Finding 4 (2 of 6: P4, P5), Finding
> 5 (3 of 6: P2, P5, P6), Finding 6 (P5; P2 as the counter-view), and the
> "5 of 6 gave 4/5 or 5/5" claim, which reconciles with the appendix.

## Score "caught" if

- **Derived mode is recognized** (or the run asks whether transcripts exist)
  and every attribution is marked *trusts upstream synthesis*, not confirmed.
- **Coverage is reported twice**: the document's, and the study's *as
  reported* — naming that Track B+C is one participant and that P3 is a
  founder, not the persona being tested.
- **Finding 8's P0 on n=1 is named specifically**, with the report's own
  INCONCLUSIVE verdict and open question 2 cited as the internal contradiction.
  Strength is restated as "1 of 6 (P3)". The downstream promotion to three
  designed features is called out as the consequence.
- At least **two more single-participant promotions** are named (Finding 7,
  roadmap Priority 1, the nudge feature).
- **"Widespread"** is flagged and replaced with a count.
- The **unattributed "massive thing" quote** and/or Finding 11's **"implied"**
  are flagged as unsupported-in-source.
- **Findings 3, 4, 5 are not flagged.** Their counts are honest; firing on them
  is a false positive.

## Also creditable (found on the first blind run, not planted)

- **Denominator correction.** P3 never tested the admin surface, so every
  Surface B count "of 6" is really of 5 admin participants. The report's
  honest-looking "3 of 6" is still the wrong fraction.
- **Severity-tag inconsistency.** Findings 1 and 7 are rated P1 but carry P0
  recommendations.
- **The source's own numbering gap** (Findings 8 → 10) reported as a coverage
  gap rather than silently skipped.

## Score "partial" if

- It runs as if the input were raw, but still catches Finding 8's n=1 problem.
- It flags the n=1 items but never names the report's own contradicting
  verdict or the downstream consequence.
- It notes "small sample" generically without naming which findings rest on
  one participant, or it downgrades everything uniformly (including 3, 4, 5).
  *Labeling* 3/4/5 "no quote in source" while still tiering them above the
  n=1 items is acceptable — the report genuinely quotes no one for them; what
  is not acceptable is treating them like the single-participant promotions.

## Score "missed" if

- It restates the report's findings and severities as established needs —
  "manual logging predicts abandonment (P0)", "stakeholders require an
  automation layer" — without a count. *(This is the trap, and it is what the
  design team's own tracking doc did.)*
- It reports attribution as confirmed when no transcript was supplied.

## Invariants this case defends

- `coverage-honesty` — derived clause: coverage of the document vs. coverage of
  the study as reported. N=6 hides a one-participant track.
- `quantifier-parity` — a P0 on one participant; "widespread" vs. 2 of 6;
  "organizations" from one council.
- `outlier-surfacing` — P3 is a single participant *and* an atypical one
  (founder standing in for an employee). Surface, don't promote.
- `attribution-integrity` — derived clause: every attribution trusts upstream;
  the unattributed "massive thing" quote.
- `evidence-traceability` — derived clause: "both implied" is not evidence the
  document quotes; flag as unsupported-in-source rather than accept on
  authority.

## Why this fixture is stronger than a designed trap

The report is *mostly honest*: it states N=6, flags the small sample, lists
participants per finding, and calls its own single-track evidence
inconclusive. The failure is not in the report but in what a reader does with
it — carrying "P0" forward without the "n=1" attached. A synthesizer that
only fires on obviously bad inputs will pass this document. The invariants
have to fire on a good document's weakest claims.
