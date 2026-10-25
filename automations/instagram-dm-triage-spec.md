# Instagram DM Triage Specification

## Purpose

Route incoming Instagram DMs safely with strict human review for sensitive classes.

## Conversation classes

- scorecard request
- workflow pain
- qualified prospect
- beginner seller
- tool question
- pricing question
- account health/risk question
- support issue
- spam
- ambiguous

## Auto-allowed responses

- scorecard request
- simple "what is Wholesale-Ops?"
- basic qualification question

## Human approval required

- pricing
- account health
- IP complaints
- suspensions
- demo requests
- integration questions
- angry users
- profit guarantee questions

## Workflow

`[New DM] --> [Classify] --> [Check fit for FBA wholesale] --> [Safe auto-reply or queue human] --> [Log class + intent] --> [Offer audit handoff if qualified]`

## Auto-response output schema

- dm_id
- class
- source_handle
- risk_level
- response_type
- response_text
- action
- escalation_reason
- reviewed_by
- next_follow_up

## Notes

- Keep auto-replies short and non-committal.
- Never give pricing, policy, or account-health advice automatically.
- Qualified prospects move to `workflow-audit-booking-spec.md`.
