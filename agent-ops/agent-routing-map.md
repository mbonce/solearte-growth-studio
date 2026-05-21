# Agent Routing Map

## Routing Rules

- Instagram content -> Instagram Content Agent first, then QA Agent.
- Audience questions -> Audience Research Agent first.
- Content trends -> Audience Research Agent, then Instagram Content Agent.
- Creator analysis -> Audience Research Agent.
- Hooks -> Audience Research Agent, then Instagram Content Agent.
- DM replies -> Instagram DM Agent, then QA or human if risky.
- Product positioning -> FBA Product Marketing Agent, then QA.
- Scorecard copy -> Product Marketing Agent + Instagram Content Agent + QA.
- Supplier workflow content -> Supplier Workflow Agent, then Instagram Content Agent, then QA.
- Catalog/ASIN/buy-list content -> Catalog Analysis Agent, then QA.
- Margin/replenishment content -> Profitability Agent, then QA.
- Account-risk content -> Account Risk Agent, then QA and human if specific.
- Sales materials -> Sales Enablement Agent + QA.
- Outreach -> Outbound Agent + QA.
- Metrics -> Analytics Agent.
- Launch blockers -> Orchestrator Agent.

## Default Path

`[Request] --> [Specialist Agent] --> [QA] --> [Orchestrator] --> [Publish/Use] --> [Analytics]`
