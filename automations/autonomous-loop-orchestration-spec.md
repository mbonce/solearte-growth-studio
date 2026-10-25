# Autonomous Loop Orchestration Specification

Status: internal-only automation spec. No external actions are approved.

## Goal

Keep the Wholesale-Ops Growth Studio loop running as a research-first, QA-gated, internally autonomous marketing system.

## Inputs

- `agent-ops/loop-state.json`
- `agent-ops/loop-state.schema.json`
- `agent-ops/hard-break-policy.yml`
- `agent-ops/task-queue.md`
- `launch/always-on-marketing-command-center.md`
- `launch/approval-board.md`
- `analytics/run-log.md`
- `research/evidence-ledger.md`
- Latest files under `content/`, `research/`, `voice-of-customer/`, and `analytics/`

## Allowed Work

- Public-source research.
- Evidence capture.
- Draft-only content production.
- QA and claims review.
- Internal analytics and learning logs.
- Founder digest preparation.
- Repo-local status updates.
- Local Downloads export for QA-approved/deployable staging assets only.

## Forbidden Work

- Posting.
- Publishing.
- External scheduling.
- DMs.
- Emails.
- Comment replies.
- Prospect, supplier, or customer contact.
- Pricing, billing, refund, discount, or guarantee commitments.
- Account-health, compliance, legal, IP, suspension, or Amazon-policy advice.
- Public result claims or undocumented product-capability claims.
- Fake metrics, fake testimonials, fake case studies, fake customers, or invented exact quotes.

## Tick Cadence

The Codex automation `wholesale-ops-growth-studio-loop` runs hourly.

On each tick:

1. Read and validate `agent-ops/loop-state.json`.
2. Read `agent-ops/hard-break-policy.yml`.
3. Count valid active agents.
4. If fewer than two active agents are valid, assign safe tasks from `ready_queue`.
5. If the ready queue is empty, create default safe internal tasks.
6. Move any hard-break task to `human_approval_queue` or `blocked_queue`.
7. Update `agent-ops/task-queue.md`, `analytics/run-log.md`, and the relevant research/QA files.
8. If QA marks an asset good for deployment preparation, export it to the local Downloads staging folder and update `agent-ops/downloads-export-manifest.json`.
9. Append an event to `agent-ops/loop-events.jsonl`.
10. Write human decisions needed to `launch/approval-board.md` or the founder digest.

## Active Agent Definition

An active agent must:

- Have `status: active`.
- Have an internal-only task.
- Have a heartbeat within `active_agent_ttl_hours`.
- Have no forbidden action.
- Not be waiting on human approval.

## Stop Conditions

Mark the loop blocked if:

- Fewer than two valid active agents can be assigned.
- The task queue contains only hard-break actions.
- Required source files are missing or invalid.
- A policy file is weakened or removed.
- The automation cannot write state.

## Future Vercel Role

Use Vercel for visibility and controlled UI:

- Internal dashboard.
- Read-only founder digest view.
- Approval-board UI.
- QA queue browser.
- Scorecard or public marketing pages only after claims are approved.

Do not use Vercel as the durable background orchestrator for this repo.

## Future n8n / GitHub Actions Role

Use n8n for scheduled pulls, summaries, digest prep, and safe handoff workflows.

Use GitHub Actions for validation:

- Validate loop state against schema.
- Check hard-break policy presence.
- Check minimum active-agent invariant.
- Generate static digest artifacts.
- Run dry-run hygiene checks before any automation-surface change merges.
