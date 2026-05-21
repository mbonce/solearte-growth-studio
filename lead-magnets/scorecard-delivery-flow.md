# Scorecard Delivery Flow

## Automated Flow

1. Instagram CTA click
2. Scorecard page load
3. Scorecard request form submit
4. Auto confirmation DM/email with link and no qualification questions.
5. Auto follow-up day 1: ask for lowest-scoring section (`suppliers`, `catalogs`, `buy list`, `shipments`, `replenishment`, `VA workflow`, `risk control`)
6. Auto follow-up day 2: workflow-audit option in message
7. Tag for workflow-interest and scorecard completion monitoring

## Manual Backup Flow

1. Instagram post asks for scorecard
2. User messages in Instagram DM
3. Human sends scorecard link manually from template:
   - "Absolutely — here’s the scorecard: {{scorecard_link}}"
4. Human sends the qualifying prompt after link:
   - "After you run it, send me your lowest-scoring section: suppliers, catalogs, buy list, shipments, replenishment, VA workflow, or risk control."
5. Human sends confirmation and asks for preferred contact method
6. Human sends follow-up prompt after reply
6. Manual qualification for workflow audit handoff

## Core Rules

- First reply never includes pricing, account-health promises, or compliance claims.
- All low-score responses route to the `scorecard-to-audit-handoff` checks.
- If user asks for urgent help, route to Human review queue.

## Flow Mapping

[IG CTA] --> [Scorecard Page] --> [Download/Request] --> [Confirmation] --> [Follow-Up] --> [Workflow Audit Offer]
