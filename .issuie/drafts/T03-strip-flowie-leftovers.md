## Description
Replace the FLOWIE lending-domain examples in `<differences>` ("relocation vs retail", "banker vs ops") with domain-neutral placeholders.

## Why
SYNTHIE is a general research tool; the lending specifics are stale artifacts from the FLOWIE origin and read as oddly narrow.

## Scope
Copy-only edit inside the script's `<differences>` block.

## Touches
- scripts/versions/v1.5/SYNTHIE_v1.5.xml (shared — new version file)

## Source
Today's repo review.

## Owner
Lindsay.

## Acceptance criteria
- [ ] No lending/banking-specific examples remain in the general script
- [ ] Placeholders are domain-neutral and clearly fill-in-the-blank
