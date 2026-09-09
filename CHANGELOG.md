# Changelog

All notable changes to SYNTHIE are documented here. Versions track the script
in `scripts/versions/`; `manifest.json` always points at the current release.

## [1.8] — 2026-09-09

- Current release. Adds the **`attribute-fidelity`** invariant, the sixth in the
  set: describe a participant only by what the input states. Never infer or
  supply gender, pronouns, age, seniority, employer, or location that is not in
  the data — a name, a role, or a speech style is not evidence of any of them.
  Refer to participants by id; where a pronoun is unavoidable and none is
  stated, use they/them.
- Applies to **every sentence of the write-up**, not only the ledger. The
  failure it guards against arrives as a passing pronoun in prose, where the
  other invariants — which check claims, counts, and quote ids — never look.
- Wired in two places: the evidence ledger records a participant's attributes
  only as stated, leaving unstated ones blank; the traceability check scans the
  finished write-up for attributes the input never contained and replaces them
  with the participant id.
- Motivated by a field miss. The first blind run of the raw-transcript path on
  real interview material (2026-09-09) was otherwise clean — correct counts,
  correct attribution, honest coverage — but referred to one participant as
  "she" twice, although no pronoun for that participant appears anywhere in the
  transcript. Every other invariant passed it, because it was never a claim.
- No change to the derived path or to any existing invariant.

## [1.7] — 2026-09-06

- Licensing cleanup — the repo moves from CC0 to **CC BY 4.0**, matching
  FLOWIE, and the script's attribution block now states that license (use,
  adapt, and share with credit). The former "please credit" line contradicted
  the CC0 LICENSE file, which waives attribution. No behavioral change from
  1.6; case scores carry. Mirrors FLOWIE v2.8.

## [1.6] — 2026-09-06

- Derived-input refinements from the first **blind run** of
  case 006 (scored caught under v1.5 on 2026-09-06; run saved under
  `cases/006-second-order-audit/runs/`).
- **Three-level evidence ladder on derived input** — `evidence-traceability`
  now grades each claim *quoted* / *paraphrased* (participants named, no quote;
  carried, downgraded one step) / *unsupported-in-source* (no participant
  named; not carried). The v1.5 run used "unsupported-in-source" for both of
  the last two, so an honest "3 of 6 (P2, P5, P6)" finding wore the same label
  as a claim nobody was recorded making. The traceability check and evidence
  contract carry the grade.
- **Persona-mismatch coverage note** — `coverage-honesty` on derived input now
  states when a track's only participant is not the persona the track tests
  (the run reported "Track B+C: 1 participant" but not that P3 was a founder
  standing in for an employee).
- Raw-transcript path unchanged from 1.4.

## [1.5] — 2026-09-05

- Packaging and second-order-audit release; the raw-transcript
  synthesis path is unchanged from 1.4.
- **Paste-ready `.txt`** (#1) — the `.txt` now opens with a plain-language usage
  preamble before the full script, instead of being a byte-for-byte copy of the
  `.xml`. `scripts/check_parity.sh` (ported from FLOWIE) enforces that the two
  renderings never drift; run it before cutting a release.
- **Well-formed XML** (#1) — block references inside step labels are now
  escaped, so XML parsers accept the `.xml` (v1.4 produced 48 parse errors).
- **`source-fidelity` mode: raw vs derived** (#2) — SYNTHIE can audit an
  existing synthesis (a teammate's or vendor's report, a coded sheet, a deck),
  not only raw transcripts. On derived input, `attribution-integrity` is marked
  "trusts upstream synthesis" and confidence is downgraded; the ledger admits
  only quotes the document actually contains, so a finding the document asserts
  without evidence is flagged unsupported-in-source; coverage is reported for
  the document and, separately and unverified, for the study it claims to
  cover. New `audit` task and "Second-Order Audit" context. Motivated by the
  2026-06-14 Surface B self-audit, where attribution rested on an upstream
  report's coding rather than raw recordings.
- **Domain-neutral placeholders** (#3) — the lending-domain comparison examples
  inherited from FLOWIE are replaced with fill-in-the-blank dimensions.

## [1.4] — 2026-06

- Evidence ledger: every insight grounds in a real, attributed
  quote before anything is synthesized.
- Synthesis invariants — traceability, attribution integrity, quantifier↔count
  parity, and outlier surfacing — with a traceability check that downgrades or
  drops any claim that fails.
- Coverage-honesty pass for multi-transcript synthesis; auditable evidence
  contract (claim → count → quote ids).
- SYNTHIE's analog of FLOWIE v2.6's invariant work: stops the tool from
  presenting an insight the data doesn't support.
- Regression cases added under `cases/` (designed traps).
- README consolidated to a single `README.md` and reframed around agent-reference
  use.

## [1.3] — 2025-09-15

- Latest script under `scripts/versions/v1.3/`.
- `README_SYNTHIE.md` updated to reflect v1.3.

## [1.2] — 2025-09

- Optimized release: quote tagging, research-question mapping, workflow synthesis,
  theme clustering; quant overlay for mixed-methods; structured export (Airtable, Notion, JSON).
- Documented in `README_SYNTHIE.md`.
