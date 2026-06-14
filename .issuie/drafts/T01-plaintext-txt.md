## Description
Generate a genuine plaintext/markdown rendering for the `.txt` script artifact, instead of shipping the `.xml` under a `.txt` extension.

## Why
README + manifest present `.txt` as the "paste into any LLM" fallback for users without an agent — but today it's byte-for-byte the `.xml`, so that user pastes raw `<instructions>…` tags. The non-technical path is broken.

## Scope
Format/packaging only — same method, two faithful renderings. Either emit a prose `.txt` from the XML source, or rename to `.xml`-only and drop the "plaintext" framing in README/manifest.

## Touches
- scripts/versions/v1.5/SYNTHIE_v1.5.txt (shared — new version file)
- README.md

## Source
Today's SYNTHIE repo review (2026-06-14): `.txt` == `.xml` confirmed via diff.

## Owner
Lindsay (sole maintainer).

## Acceptance criteria
- [ ] `.txt` is readable as plain prose when pasted (no raw XML tags), OR the plaintext claim is removed and only `.xml` is offered
- [ ] README "paste the .txt" instructions match what the file actually is
