# 🧠 SYNTHIE v1.5

SYNTHIE is a structured, versioned, machine-readable reference that an agent reads to synthesize qualitative research — tagging quotes, mapping them to research questions, clustering themes, and producing stakeholder-ready findings **without presenting an insight the data doesn't support.**

The point isn't a clever one-off prompt. The synthesis logic lives in a repo as a structured artifact: readable by both collaborators and machines, version-controlled, and reusable across studies. You improve the analysis by editing the script and bumping the version — and every project that references SYNTHIE picks up the change. SYNTHIE is the research-synthesis sibling of [FLOWIE](https://github.com/LinzLos/FLOWIE); it shares the same versioned, agent-operable structure.

## What it is today

A single structured script (`.xml` + `.txt`, see `manifest.json` for the current version) that an LLM or agent loads and runs over transcripts, notes, or mixed-methods data. Given raw research input, SYNTHIE:

- **Builds an evidence ledger** — extracts candidate quotes with an id and a source/participant *first*, as the substrate every later claim must cite. Nothing gets asserted that isn't anchored here.
- **Enforces synthesis invariants** — the checks that make a synthesis trustworthy: every insight traces to a real quote (`evidence-traceability`), quotes stay attached to the right participant (`attribution-integrity`), strength language matches the count (`quantifier-parity`, so n=1 is never "users"), and a lone outlier is surfaced rather than promoted to a theme (`outlier-surfacing`).
- **Runs a traceability check** — audits the finished synthesis against those invariants and downgrades or drops any claim that fails.
- **Keeps coverage honest** — in multi-transcript mode, states how much of the input was actually analyzed and marks the rest unverified, instead of implying representativeness it can't back.
- **Outputs an evidence contract** — each insight with its supporting quote ids and a strength expressed as a count (`theme X — 4 of 9 — q3, q7, q12, q20`), so a stakeholder can audit the chain from claim to evidence.
- **Maps RQs, workflows, pain points, and recommendations**, overlays quantitative data for mixed-methods, and exports structured output for Notion, Airtable, JSON, or Markdown.
- **Audits existing syntheses, not just transcripts** — a `source-fidelity` mode (`raw` | `derived`) lets SYNTHIE review a teammate's or vendor's report against its own quoted evidence. On derived input, attribution is marked "trusts upstream synthesis" and confidence is downgraded rather than silently asserted.

It's also a clean teaching reference — the evidence ledger and invariants make the *reasoning* legible, which is exactly what junior researchers need to see modeled.

## Where it's going

SYNTHIE is built to be operated, not just pasted. The direction — *not yet built* — is for a scheduled agent to run the current version across a study's transcripts automatically: re-checking traceability as new sessions land, rolling out method updates by version bump, and flagging when a claimed theme loses its evidence. The structured, versioned format is the groundwork; this section is a roadmap, not a description of shipped features.

## 🚀 How to use

The script lives in [`scripts/versions/`](scripts/versions/); `manifest.json` always points at the current version.

**Primary — reference it from an agent.** Point your agent at the current script file and have it run SYNTHIE's passes over your research data. Because it's versioned, the agent always reads the same defined method, and updates propagate by bumping the version.

**Fallback — paste it into a chat.** If you don't have an agent set up, upload the current `.txt` to any LLM and say *"Use this SYNTHIE script to analyze my interview transcripts."* The `.txt` opens with a short plain-language usage note, followed by the full script; it will prompt you for anything it needs and let you start at any task. This is the manual path — fine to start with, but the structure exists so you can automate past it.

The `.xml` and `.txt` are the same script in two renderings — the `.txt` just adds the usage preamble. [`scripts/check_parity.sh`](scripts/check_parity.sh) verifies they haven't drifted; run it before cutting a release.

## 🛠 Features

- **Evidence ledger + invariants** — traceability, attribution integrity, quantifier↔count parity, outlier surfacing.
- **Source-fidelity mode** — audit a derived synthesis (report, coded sheet, deck) with attribution trusted-not-verified and coverage scoped to the document.
- **Traceability check + coverage-honesty pass** — no unsupported claims, no overstated coverage.
- **Auditable evidence contract** — claim → count → quote ids.
- **Regression cases** in [`cases/`](cases/) — designed traps (outlier-as-theme, quantifier overreach, misattribution) so each version can be scored against the last.
- **RQ mapping, workflow analysis, comparative insight, pain-point clustering, recommendations.**
- **Mixed-methods overlay** — contrast quant results with qual findings (validation, gaps, contradictions).
- **Structured export** — Notion, Airtable, JSON, Markdown.
- **Guided Walkthrough or Quick-Start**; tasks run in any order.

## 📚 Method grounding

SYNTHIE's passes operationalize standard qualitative-analysis practice — quote coding and **thematic analysis** (Braun & Clarke), affinity clustering of pain points, and evidence traceability as practiced in rigorous UX research. The script's structure, invariant set, and contract format are original; the underlying methods are credited to that body of practice.

---

❤️ SYNTHIE is an adaptation of [FLOWIE](https://github.com/LinzLos/FLOWIE) by Lindsay Zuñiga. Please credit when remixing or building further. Feedback welcome → [linkedin.com/in/zunigo](https://www.linkedin.com/in/zunigo)
