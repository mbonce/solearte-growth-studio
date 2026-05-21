# Wholesale-Ops FBA Growth Studio

Wholesale-Ops FBA Growth Studio is the internal AI-agent-powered growth repository for one product: Wholesale-Ops.

Wholesale-Ops is an operations command center for Amazon FBA wholesale sellers. It helps sellers manage supplier outreach, catalog analysis, ASIN qualification, buy lists, purchase orders, FBA shipment workflows, replenishment, margin tracking, VA workflows, and account-risk controls in one repeatable operating system.

FBA wholesale is not just sourcing. It is operations.

## Target Customer

This repo is for growth work aimed at Amazon FBA wholesale sellers:

- Sellers working with brands, suppliers, and distributors for Amazon resale.
- Operators analyzing supplier catalogs and ASIN opportunities.
- Teams using VAs, sourcing specialists, or replenishment managers.
- Sellers moving from solo spreadsheet workflows into repeatable operations.

This is not for brick-and-mortar wholesalers, traditional wholesale distributors, retail stores, warehouse operators, or distributor ERP buyers.

## What This Repo Contains

- `agents/`: Wholesale-Ops-specific agent cards and operating instructions.
- `.agents/`: Shared agent resources, including the external MarketingSkills submodule.
- `product/`: Positioning, ICP, product modules, objections, pricing hypotheses, and pilot offer.
- `research/`: Seller pain points, customer language, competitor notes, interview templates, and market questions.
- `content/`: Content pillars, calendars, posts, scripts, carousels, and newsletters.
- `lead-magnets/`: Scorecard and workflow audit assets.
- `outbound/`: Prospecting criteria, cold email, LinkedIn outreach, and reply handling.
- `sales/`: Discovery, workflow audit, demo, objection, proposal, and one-pager assets.
- `website/`: Homepage, landing page, demo page, scorecard page, and CRO notes.
- `analytics/`: Growth reporting, funnel tracking, experiment logs, and learning logs.
- `workflows/`: Weekly growth cadence and production/review workflows.
- `templates/`: Reusable Markdown templates for agents and growth work.
- `.github/`: Issue and pull request templates.

## How The Agent System Works

The agent system is a coordinated growth studio, not a pile of generic prompts.

`orchestrator-agent.md` runs the weekly growth cycle and routes work to specialized agents. Product marketing owns the narrative, research captures seller language, content turns operator problems into useful material, outbound and DM agents create demand, sales enablement turns interest into workflow audits, analytics closes the loop, and QA checks for fit, claims, and risk.

The expected flow is:

`[Research] --> [Messaging] --> [Content/Outbound] --> [Sales] --> [Analytics] --> [QA]`

## MarketingSkills Submodule

The external repo `coreyhaines31/marketingskills` is mounted at:

`.agents/marketingskills`

Use it as the shared marketing skill library. The files in `/agents` wrap those generic skills with Wholesale-Ops-specific context, constraints, and outputs.

## Weekly Operating Cadence

- Monday: research and strategy.
- Tuesday: content production.
- Wednesday: lead magnet and outbound.
- Thursday: sales asset improvement.
- Friday: analytics, learning, and QA.

Each week should produce a small set of useful assets, record what sellers actually said, and update the operating thesis without drifting into unsupported claims.

