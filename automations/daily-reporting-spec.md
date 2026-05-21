# Daily Reporting Specification

## Goal

Create one daily summary of launch activity and signal shifts.

## Required metrics

- posts published
- saves
- shares
- comments
- DMs
- scorecard clicks
- scorecard requests
- audits booked
- objections heard
- top pain points
- tomorrow’s actions

## Data sources

- `analytics/content-performance.md`
- `analytics/instagram-dm-performance.md`
- `analytics/scorecard-funnel-tracking.md`
- `analytics/workflow-audit-funnel-tracking.md`
- `analytics/research-insights-log.md`

## Flow

`[End of day pull] --> [Aggregate by source/asset] --> [Label risks] --> [Top 3 pain points] --> [Owner to-do list] --> [Founder digest]`

## Output format

- date
- content published count
- IG saves + shares + profile visits
- scorecard link clicks
- DMs + objection mix
- audits booked and blockers
- 3 prioritized tomorrow actions

## Review rules

- If posts underperform without saves/DMs, surface one adjustment.
- If objections spike on compliance/account-risk, flag QA + Account Risk.
