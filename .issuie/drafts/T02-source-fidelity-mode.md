## Description
Add a `source-fidelity` flag (`raw` vs `derived`) so SYNTHIE can audit an existing synthesis (a report), not only raw transcripts — and auto-downgrade attribution confidence when input is derived.

## Why
SYNTHIE's evidence ledger assumes verbatim participant quotes. Auditing a downstream report (a common real task — reviewing a teammate/vendor synthesis) isn't a supported mode, and in it `attribution-integrity` is unverifiable by construction. Today's Surface B self-audit hit exactly this limit.

## Scope
Script logic only (new flag + a coverage/attribution note in the traceability pass). No change to the existing raw-transcript path.

## Touches
- scripts/versions/v1.5/SYNTHIE_v1.5.xml (shared — new version file)

## Source
Today's self-audit: second-order analysis of Julie's R4 report; attribution rested on her coding, not raw recordings.

## Owner
Lindsay.

## Acceptance criteria
- [ ] `source-fidelity: raw|derived` selectable
- [ ] On `derived`, attribution-integrity is explicitly marked "trusts upstream synthesis" and confidence downgraded
- [ ] Raw-transcript behaviour unchanged
