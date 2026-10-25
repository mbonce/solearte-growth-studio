# Overnight Production Queue

Mode: autonomous internal production only.

Hard breaks: no posting, no DMs, no email sends, no external scheduling, no outside communications, no pricing promises, no account-health/compliance advice, no public result claims, and no undocumented product claims.

## Active Invariant

Keep at least two internal agents working at all times while the loop is active.

## Queue

| Priority | Agent | Task | Inputs | Output | Status | Risk |
|---|---|---|---|---|---|---|
| P0 | Orchestrator Agent | Maintain launch loop and assign next two tasks before any agent idles | Command center, task queue, routing map | Updated NOW / NEXT / BLOCKERS / OWNERS | In progress | Low |
| P0 | FBA Customer Research Agent | Build public-source customer-language research backlog | Research spec, VOC files, audience files | Research questions, source queries, capture schema | Complete - Cycle 1 | Low |
| P0 | Audience Research Agent | Build creative-pattern research backlog | Creative research files, Instagram strategy | Hook patterns, angle map, QA risks | Complete - Cycle 1 | Low |
| P1 | Product Marketing Agent | Map research themes to approved Wholesale-Ops positioning | Product marketing, ICP, objections | Positioning-safe message map | In progress | Medium |
| P1 | Instagram Content Agent | Convert safe research insights into draft content angles | Research insights, hooks, content strategy | Draft-only carousel/reel/story angles | In progress | Medium |
| P1 | QA Agent | Review all generated public-facing draft ideas | QA workflow, human approval rules | Revise / blocked / human_review labels | Not started | Medium |
| P2 | Analytics Agent | Create first loop run log | Command center, completed agent outputs | Activity / interpretation / next experiment | In progress | Low |
| P2 | Sales Enablement Agent | Extract workflow-audit questions from research | Research insights, pilot offer, audit process | Draft audit questions for QA | Not started | Medium |

## Handoff Rules

- Research output goes to Product Marketing, Instagram Content, and Analytics.
- Draft public copy goes to QA before use.
- Risky topics go to human review.
- Analytics feeds the next research cycle.
- Orchestrator reassigns immediately when any active agent finishes or blocks.
