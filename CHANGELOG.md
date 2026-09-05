# Changelog

All notable changes to SYNTHIE are documented here. Versions track the script
in `scripts/versions/`; `manifest.json` always points at the current release.

## [1.5] — 2026-09-05

- Current release. Packaging and second-order-audit release; the raw-transcript
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
