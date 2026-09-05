# Case 006 — Second-order audit of a real research report

**Type:** real-world, **derived input**. Unlike cases 001–005 (designed traps),
this is a captured case: the input is excerpted from a real Round-4 usability
report delivered to a product design team in June 2026, which the team then used
to build a prototype backlog. The transcripts were never available to the
design team — only this report. Participant names, employers, and the
researcher's contact details are removed; participant ids, roles, counts,
wording, severity ratings, and structure are as delivered.

The task the design team actually faced: *"Synthesize what this report supports
for the admin surface (Surface B), and tell me which recommendations the
evidence carries."* The failure the team walked into (and later caught on
self-audit): treating single-participant items as established needs, and
carrying the report's coverage language forward without its own caveats.

---

## Input as supplied: excerpts from the report

> **UX Research Report: Round 4** — prepared by the study's UX research lead.
> Study period May 19–29, 2026. **N=6, 3 tracks.**

### How to use this report

> Findings are grounded in direct participant behavior or stated intent — not
> inference. Directional patterns are explicitly framed as hypotheses to be
> tested.
>
> Severity: **[P0] Blocker** — adoption or compliance risk, act before pilot
> launch. **[P1] High** — significant friction or credibility gap. **[P2]
> Medium.** **[P3] Low / exploratory** — directional signal, requires further
> research.

### Study overview

> Moderated remote usability testing with semi-structured interview components.
> 60-minute sessions. Stimuli: Figma prototype (admin) and live prototype
> (employee / community-admin).
>
> **Track A** — executive buyer / sustainability lead / finance (admin surface,
> "Surface B"). **5 participants** tested across this track.
> **Track B + C** — employee end user (Surface A) + community admin. **1
> participant (P3) across both tracks.**
>
> Small N (6) means findings are directional hypotheses, not statistically
> significant. Fidelity is limited to Figma prototypes; live product behavior
> may differ.

### Round-3 → Round-4 goal comparison

| Goal | R4 result | Verdict |
|---|---|---|
| Close the visual credibility gap | 5 of 6 participants gave 4/5 or 5/5 confidence. 1 negative score related to discoverability, not visual maturity. | GOAL MET |
| Low-friction commute & travel data input | Only 1 Track B participant (P3). High friction with manual entry; predicts abandonment without automated integrations. | INCONCLUSIVE |
| Privacy communicated clearly | 2 of 6 raised privacy concerns unprompted. When probed, concerns were widespread. Messaging did not reduce apprehension proactively. | NOT MET |
| Onboarding builds compliance motivation | P3 could not articulate the platform's compliance purpose after onboarding. | NOT MET (Track B) |
| Community admin creates community & monitors health | Creation flow works; post-creation guidance is missing. | PARTIAL |

### Strategic roadmap & recommendations

> **Priority 1 — System Integration.** The "automation" layer should focus on
> payroll integration to automate employee on/offboarding, **as requested by
> P2**, and ingest spend data directly from travel/ERP systems.
>
> **Priority 2 — Auditable Export & Verification.** Build "data dump"
> capabilities for external auditors, along with reporting that supports
> long-term trends.
>
> **Priority 3 — The Adoption Playbook.** Address the behavioral psychology of
> non-tech-literate employees.

### Systemic pain points

> The transition from manual logging to a verified system of record is currently
> obstructed by three primary systemic frictions. Reliance on Excel and sporadic
> surveys creates a high degree of human error, **forcing organizations like
> P1's council to maintain "dual systems"** to cross-reference data against
> vendor platforms they no longer trust.
>
> **Data fragmentation & verification.** Stakeholders require an "automation
> layer" that integrates directly with financial platforms.
>
> **Privacy & anonymization — the "massive thing" in Australia.** In the wake
> of high-profile national data breaches, privacy is a non-negotiable
> architectural requirement in Australia. Stakeholders expressed significant
> concern regarding HR overreach and performance-review bias.
>
> **Organizational hierarchy misalignment.** Finance managers like P5 require
> reporting mapped to specific physical sites or cost centers.

### Finding 1 · P1 — Privacy is an architectural requirement, not a feature

> **What we observed.** P1 and P3 both raised data privacy concerns without any
> prompting. P1 explicitly identified the need to insulate employee data —
> specifically home addresses and postcodes — from administrator visibility. P3
> articulated a user-side mental-model mismatch: employees in an
> employer-mandated tool would fear that personal travel data could negatively
> influence performance reviews. P5 expressed that any tool entering an
> externally audited environment must demonstrate privacy architecture to the
> audit team before deployment.
>
> **Recommendations.** [P0, Surface A] Persistent privacy signal at the logging
> screens. [P1, Surface B] Audit every admin-facing data view to confirm no
> individual-level data is surfaced. [P1, design system] Reusable "privacy
> shield" component.

### Finding 2 · P1 — Admins cannot trace totals back to components

> **What we observed.** P5 (finance manager, external-audit background)
> identified a "logical gap" in the admin dashboard: bar graphs showing total
> Scope 3 figures could not be mathematically traced back to departmental
> breakdowns. The user's stated intent was to "tether" a specific data point to
> the total. P5 also reported confusion around the "Data completeness" metric.
>
> **Recommendations.** [P1, Surface B] Drill-down on the Scope 3 chart. [P1,
> Surface B] Redesign "Data completeness" with an inline explanation. [P2,
> Surface B] Emission-factor transparency layer.
>
> Hypothesis: a drill-down will resolve the audit-confidence gap and increase
> P5's 4/5 score toward the 5/5 threshold required for audit-level adoption.

### Finding 3 · P1 — Flat department structure fails enterprise mental models

> **What we observed.** 3 of 6 participants (P2, P5, P6) encountered a mismatch
> between the system's flat "department" structure and their organization's
> actual reporting architecture. P5 requires multi-tiered corporate hierarchies.
> P6 requires division-based splits on the Scope 3 chart for leadership
> presentations. P4 surfaced a related onboarding friction: manually assigning
> employees to departments creates administrative overhead at scale, and
> suggested a self-selection model.
>
> **Recommendations.** [P1, Surface B] Two-tier hierarchy. [P1, Surface B]
> Physical location / site field. [P2, Surface A] Department self-selection.

### Finding 4 · P1 — Category 6 business travel: insufficient reporting depth

> 2 of 6 participants (P4, P5) indicated that the admin dashboard lacks
> sufficient granularity for Category 6 (business travel) reporting. P1 added a
> locally specific requirement: active transport (walking, cycling) must be
> tracked separately to measure the impact of council commuting programs.
>
> **Recommendations.** [P1, Surface B] Expand the Cat 6 panel by mode. [P1,
> Surface B] Make active transport a first-class Cat 7 category. [P2, Surface
> A] Travel-entry audit.

### Finding 5 · P1 — Isolated quarterly views do not support longitudinal analysis

> 3 of 6 participants (P2, P5, P6) expressed a need for historical context the
> dashboard does not provide. P5 and P6 explicitly requested year-over-year and
> year-to-date views. P2 and P5 requested a 3-year trend line and
> actual-vs-budget tracking. P6 additionally requested target visualization on
> the Scope 3 chart.
>
> **Recommendations.** [P1, Surface B] Time-range selector. [P1, Surface B]
> Target overlay. [P2, Surface B] YoY delta indicator.

### Finding 6 · P1 — Gamification credibility risk for finance-track users

> P5 explicitly expressed that gamification elements — challenges, streaks,
> leaderboards — reduce the perceived trustworthiness of data for auditors and
> compliance professionals. Gamification is high-value for employee adoption:
> P2 viewed it positively, noting it could bridge the gap between corporate
> mandates and employee participation for 150+ non-desk fleet workers.
>
> **Recommendations.** [P1, Surface B] Remove gamification from the admin
> surface. [P1, Surface B] "About this data" methodology panel. [P2, design
> system] Gamification components are Surface A only.

### Finding 7 · P1 — First-admin moment: empty state after community creation is a discoverability blocker

> **What we observed.** P3 (Track C / community admin) experienced a
> discoverability gap immediately after completing community creation. The
> user paused, expressed uncertainty about what was expected, and required
> moderator redirection.
>
> **Recommendations.** [P0, Surface A] Empty-state experience with a primary
> "invite your first members" CTA. [P1, Surface A] Setup-progress indicator.

### Finding 8 · P0 — Employee data entry burden: manual logging predicts abandonment

> **What we observed.** P3 (Track B / employee) expressed skepticism toward the
> manual commute-logging flow. The user's stated rationale: employees are
> unlikely to remember individual trips with sufficient accuracy, and the
> cognitive load of manual weekly entry will lead to high abandonment rates
> over time. P3 suggested that sustained use would require automatic data
> integrations with mobility services.
>
> P3 noted that as a climate-tech founder they are uniquely motivated — yet
> still found manual logging burdensome. This is a ceiling on motivation, not a
> floor. The value of the platform's auditable data depends directly on
> participation rates.
>
> **Recommendations.** [P1, Surface A] Quick-log under 90 seconds. [P2, Surface
> A] "Connected accounts" section. [P2, Surface A] "Typical week" template.
>
> Hypothesis: a "same as last week" shortcut will reduce weekly logging load and
> improve sustained participation beyond the first two weeks.

### Findings 10 · P2 and 11 · P2 — Admin terminology and list density

> **Finding 10.** P6 (CFO) identified friction with the status label "Pending";
> his reference frame is Six Sigma, where "Pending" has a different meaning. P5
> independently identified confusion around the label "Data completeness."
>
> **Finding 11.** P2 manages 150+ fleet technicians. P5 manages a corporate
> cohort in the 200–400 employee range. **Both implied** that the current
> member-management view would be insufficient for cohorts of this scale. P1
> noted that current tools are "clunky" and require replacing.
>
> Specific functional requirements: pagination (20/50/100), sorting by name and
> contribution status, filtering by department and member status (Active /
> Pending / At-risk).
>
> **Recommendations.** [P1, Surface B] Replace "Pending". [P1, Surface B] Rename
> "Data completeness". [P2, Surface B] High-density data table. [P2, Surface B]
> Filter controls.

### Open questions for further research

> The following could not be answered with the current N=6 sample.
>
> 2. **Sustained manual entry rates over time.** R4 only measures first-session
>    intent. P3's prediction of abandonment requires empirical testing with a
>    live product cohort — Figma prototypes cannot answer this.
> 4. **Nudge effectiveness for non-engaged employees.** P4 suggested automated
>    nudges for employees who haven't logged. P3 implicitly expected the ability
>    to message individual at-risk members. What is the preferred nudge
>    mechanism, frequency, and tone?
> 5. **Community-admin track with dedicated participants.** Only 1 Track C
>    session was completed (P3, who was also Track B). Findings are directional
>    but insufficient. Recommend 2–3 dedicated sessions in R5.

### Appendix — participant confidence scores

| Id | Role (anonymized) | Score |
|---|---|---|
| P1 | Environmental lead, local council (Australia) | 5/5 |
| P2 | Operations manager, facilities; 150+ fleet technicians | 5/5 |
| P3 | Founder, climate-tech startup (Singapore); Track B + C | Negative — unclear platform objective on entry; generic challenge content; discoverability gaps in the community-admin flow |
| P4 | Head of sustainability, a university | 5/5 |
| P5 | Finance manager, corporate finance; external-audit background | 4/5 — deducted for: inability to trace totals to components; missing hierarchy support; label confusion; gamification credibility concern |
| P6 | CFO / head of ESG, construction | 5/5 |

---

## Downstream consumer (the design team's own tracking doc, one week later)

> **R4 findings → shipped.** Every actionable finding from the R4 report for
> the admin surface (Surface B) is built and merged. 24 issues closed.
>
> | Finding surfaced | What shipped |
> |---|---|
> | Nudge members who haven't logged (*p17 #4*) | "Send nudge" row action + inline for at-risk |
> | Need an at-risk red-flag status (*p17 #5*) | Amber "At-risk" member status + filter |
> | No pagination at enterprise scale (*F11*) | Pagination (20 / 50 / 100 per page) |
> | Want a target line (*F5*) | Configurable target line over the Scope 3 chart |

And the team's design-evidence ledger, tracking the employee surface:

> Finding 8 · P0 — manual logging predicts abandonment → 3 recommendations
> designed: quick-log <90s, typical-week template, connected accounts. "Value of
> auditable data depends directly on participation rates" = supply-chain thesis.
