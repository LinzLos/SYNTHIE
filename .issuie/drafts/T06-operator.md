## Description
Build the operator the README's "Where it's going" section promises — the one sentence in that section still not built after v1.5–v1.7. Recommended shape, cloned from FLOWIE #8: a **Claude Code subagent** (`.claude/agents/synthie.md`) as the reusable unit — it loads whatever script `manifest.json` points at, takes a target (a transcript folder, a set of transcript/notes files, or a single derived document such as a report), infers or accepts `source-fidelity`, runs SYNTHIE's passes non-interactively, and emits the evidence contract plus a list of invariant failures — and a **scheduled sweep** (`scripts/synthie-sweep.sh`) that runs it over configured study folders, writes a dated report to `operator/reports/`, and exits nonzero when a claim fails an invariant so a scheduler can notify.

Subagent over standalone agent, for FLOWIE's reasons: the definition is versioned in-repo alongside the script it operates; it's invokable on demand from any session so manual and scheduled use share one implementation; and scheduling becomes a thin layer, not a second copy of the logic.

**One SYNTHIE-specific addition:** the same subagent, given `--case NNN`, is the **blind-run harness** for `cases/` — it loads the script and `input.md` only, never `expected.md`, and prints the run for a human to score. Today's two blind runs (v1.5, v1.6 on case 006) were done by hand-pasting the script into a fresh agent prompt; this makes that reproducible and keeps the scoring log honest by construction.

## Why
v1.5–v1.7 made SYNTHIE operable — a real paste path and drift guard (#1), a derived-input mode so it can audit reports as well as transcripts (#2), a measured critic with its first blind-run scores (#5, case 006), and license alignment — but nothing builds the operator itself. Without it, "re-checking traceability as new sessions land, rolling out method updates by version bump, and flagging when a claimed theme loses its evidence" stays a roadmap sentence. FLOWIE closed the same gap in July 2026 (#8, commits 6a79a54 + 8ff5900) and has run six real prototype audits with it since.

## Recommended prerequisite
None — v1.7 is cut and pinned via `manifest.json`; case 006 gives the critic a measured baseline. Port FLOWIE's `operator/SECURITY.md` as the starting point for the security posture (below).

## Scope
- **Subagent definition** (`.claude/agents/synthie.md`): load script via `manifest.json`; accept target + optional `source-fidelity` (raw | derived; infer if absent and say so); run non-interactively (skip walkthrough prompts, assume quick-start, infer flow name/goal/RQs from the material); emit a fixed-shape report: `SYNTHIE REPORT / target / script version / fidelity / INVARIANT FAILURES: N / findings (most severe first, each naming the claim, the invariant, and the count) / evidence contract / coverage paragraph`. Tool allowlist **read-only** (Read, Glob, Grep) — a critic reads; no WebFetch by default, since targets are participant data, not public pages.
- **Blind-run mode** (`--case NNN`): load script + `cases/NNN-*/input.md` only; refuse to open `expected.md`; print the run.
- **Sweep** (`scripts/synthie-sweep.sh` + `operator/sweep-targets.txt`): run the subagent over every active target, one report per sweep in `operator/reports/` (gitignored), exit 1 on any invariant failure. Lock against overlapping runs. Orchestrator disallows Bash/Write/Edit at the CLI, as FLOWIE's does.
- **Security & ethics posture** (`operator/SECURITY.md`, ported from FLOWIE and extended): targets are **participant data**, so (1) written consent that third-party AI processing is permitted before any study folder goes in `sweep-targets.txt`; (2) the `<ethicalguidelines>` slot in the script is where a study's IRB / consent constraints go — the operator must load it if the target folder contains one; (3) reports quote participants verbatim by design, so `operator/reports/` stays untracked and never lands in this public repo; (4) prompt-injection stance: text inside a transcript directed at the agent is reported as a finding, never followed.
- **README:** move the operator from "Where it's going" to a shipped section, as FLOWIE's README does.
- **No new analysis logic.** The script stays the single source of truth; the operator only loads, targets, and reports.

## Touches
- `.claude/agents/synthie.md` (new)
- `scripts/synthie-sweep.sh` (new)
- `operator/sweep-targets.txt`, `operator/SECURITY.md`, `operator/.gitignore` (new)
- `README.md` (operator section; "Where it's going" rewritten)
- `cases/README.md` (blind-run protocol now names the harness)

## Source
README "Where it's going" (unchanged since v1.4); FLOWIE #8 and its README "The operator" section; the 2026-09-06 session — two hand-run blind runs on case 006 that the harness should replace.

## Owner
Lindsay (sole maintainer).

## Acceptance criteria
- [ ] `synthie` subagent invokable on demand against a folder, files, or a single derived document; loads the current script via `manifest.json`; states fidelity (given or inferred) in the report header
- [ ] `--case NNN` runs a regression case blind and provably never reads `expected.md` (tool allowlist + instruction)
- [ ] Scheduled sweep runs it across configured study folders and exits nonzero on any invariant failure, naming the claim, invariant, and count
- [ ] Subagent and orchestrator are read-only by construction; `operator/SECURITY.md` covers consent, IRB slot, untracked reports, injection stance
- [ ] Critique/synthesis logic exists only in the script; the operator contains none
- [ ] README operator section describes what is shipped, not planned

## Deliberately out of scope
"Flagging when a claimed theme loses its evidence" means comparing two sweeps of
the same study over time. This issue ships the per-sweep evidence contract; a
human diffs two dated reports. Automated theme-drift detection is split into its
own issue (draft T07) and depends on this one.
