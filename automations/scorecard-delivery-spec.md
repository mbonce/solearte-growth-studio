# Scorecard Delivery Specification

## Goal

Keep the scorecard funnel deterministic and safe.

## Funnel

`[Instagram CTA] --> [Landing page] --> [Scorecard request] --> [Delivery] --> [Follow-up] --> [Workflow audit handoff]`

## Steps

1. User clicks CTA from Instagram.
2. System records source and campaign.
3. User submits request or DM request is captured.
4. Auto-send delivery message with scorecard link.
5. Auto-send first follow-up after defined delay.
6. If workflow pain is confirmed, queue audit handoff card.

## Auto rules

- Do not promise outcomes.
- Include confirmation and disclaimer language.
- Use follow-up sequence that starts with one actionable question.

## Required handoff trigger fields

- lowest section
- pain intensity
- VA/team involvement
- catalog/backlog signal
- replenishment signal

## Failure handling

- If no contact after request, set reminder for manual check.
- If reply includes high-risk class, route to human DM triage.
