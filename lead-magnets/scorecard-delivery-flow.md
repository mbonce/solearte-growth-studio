# Scorecard Delivery Flow

## Automated Flow

1. Instagram CTA click
2. Scorecard page load
3. Scorecard request form submit
4. Auto confirmation DM/email with link
5. Auto follow-up day 1: lowest-score prompt reminder
6. Auto follow-up day 2: workflow-audit option in message
7. Tag for workflow-interest and scorecard completion monitoring

## Manual Backup Flow

1. Instagram post asks for scorecard
2. User messages in Instagram DM
3. Human sends scorecard link manually
4. Human sends confirmation and asks for preferred contact method
5. Human sends follow-up prompt after reply
6. Manual qualification for workflow audit handoff

## Core Rules

- First reply never includes pricing, account-health promises, or compliance claims.
- All low-score responses route to the `scorecard-to-audit-handoff` checks.
- If user asks for urgent help, route to Human review queue.

## Flow Mapping

[IG CTA] --> [Scorecard Page] --> [Download/Request] --> [Confirmation] --> [Follow-Up] --> [Workflow Audit Offer]
