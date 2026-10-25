# Content Generation Automation Specification

## Goal

Turn research into launch-ready content artifacts with QA and approval gates.

## Flow

`[Research insights] --> [Instagram Content Agent prompt template] --> [Draft assets] --> [QA Agent review] --> [Approval queue] --> [Founder review] --> [Scheduled post queue]`

## Inputs

- `analytics/research-insights-log.md`
- `creative-research/high-performing-hooks.md`
- `creative-research/carousel-patterns.md`
- `creative-research/reel-patterns.md`

## Outputs

- carousel concepts
- reel scripts
- story sequences
- captions
- DM prompts

## Quality checks

- Instagram-native formatting.
- No guru/flex language.
- No profit/account-protection claims.
- Clear first pain area.
- Primary CTA includes scorecard or workflow audit.

## Approval policy

- All public content routes to QA.
- All scorecard CTA assets also route to Product Marketing Agent.
- Founder must approve final post copy and visuals before scheduling.

## Safe automation boundary

- Allowed: draft generation, draft classification, queue population.
- Not allowed: direct posting, direct DM replies, unapproved CTA changes.
