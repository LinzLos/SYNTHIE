## Description
Cut the v1.5 release: create `scripts/versions/v1.5/`, bump `manifest.json` `current_version`, and add a CHANGELOG entry covering T01–T03.

## Why
T01–T03 all edit the script; they ship as one version. This is the release/integration step.

## Recommended prerequisite
T01, T02, T03 (all merged into the v1.5 script first).

## Scope
Versioning + release bookkeeping. No new method beyond T01–T03.

## Touches
- manifest.json
- CHANGELOG.md
- README.md (version badge)
- scripts/versions/v1.5/ (new dir)

## Source
Bundles today's script findings into a release.

## Owner
Lindsay.

## Acceptance criteria
- [ ] `manifest.json` points at v1.5
- [ ] CHANGELOG has a v1.5 entry crediting the changes
- [ ] v1.4 dir preserved (history intact)
