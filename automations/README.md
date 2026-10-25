# Automations

These files are launch run specifications for later implementation in n8n, Zapier, Make, or another orchestrator.

They are not live automations and do not include secrets, credentials, or active posting hooks.

## Scope

- `research-automation-spec.md`: research pull and synthesis.
- `content-generation-spec.md`: content draft workflow.
- `qa-approval-spec.md`: QA and safe approval gates.
- `instagram-publishing-spec.md`: approval-aware publishing.
- `instagram-dm-triage-spec.md`: DM classification and escalation.
- `scorecard-delivery-spec.md`: lead magnet delivery flow.
- `workflow-audit-booking-spec.md`: qualified lead handoff flow.
- `daily-reporting-spec.md`: launch metrics capture.
- `manual-fallback-runbook.md`: operations without automation.
- `n8n-workflow-backlog.md`: planned n8n implementation order.
- `secrets-and-permissions-checklist.md`: access requirements.

## Safe for launch operations now

- Research extraction and summarization (no public action).
- Internal logging of leads, pains, hooks, and objections.
- QA status tracking and approval routing.
- Scorecard follow-up scheduling and reminder preparation.
- Daily reporting and blocker tracking.

## Requires human approval before execution

- Any post publishing.
- Any response to high-risk DM classes.
- Any account-health/compliance mention.
- Any pricing, billing, integrations, refunds, or legal claims.

## Why we do not automate everything yet

- Public posting can overstep brand guardrails without human review.
- High-risk DMs can create policy, legal, or reputation risk.
- Instagram platform behavior changes can require rapid manual control.
- The brand is positioning-sensitive and launch-first mistakes are costly.
- Human review keeps the operating model safe while we measure signal quality.
