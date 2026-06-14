# Changelog

All notable changes to SYNTHIE are documented here. Versions track the script
in `scripts/versions/`; `manifest.json` always points at the current release.

## [1.4] — 2026-06

- Current release. Evidence ledger: every insight grounds in a real, attributed
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
