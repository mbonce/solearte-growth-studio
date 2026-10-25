# SOLEARTé Growth Studio

SOLEARTé Growth Studio is the AI-agent-powered growth repository for one artist: SOLEARTé.

It is not a generic AI marketing utility. It is a go-to-market operating engine that advocates for SOLEARTé's work, grows her audience, books portrait commissions and collaborations, and sells the Carry Your Colors wearable-art collection.

SOLEARTé is a Denver-based contemporary artist creating saturated portraiture, original paintings, commissions, and wearable art rooted in identity, migration, resilience, movement, and unapologetic individuality. Her work translates lived experience into color and gesture, made to be carried forward.

Site: https://solearte.co (also https://www.solearté.com)
Location: Denver, Colorado, 80211
Contact: solearté@gmail.com

Art is not just something to look at. It is something to carry.

This repo is a growth operating shell, not an application codebase. It contains agent instructions, brand narrative, audience research, content drafts, Instagram operations, commission sales assets, collaboration outreach, website copy, analytics templates, workflows, launch operations, automation specifications, and QA guardrails. Do not add app code, dependency manifests, databases, or invented facts about the artist unless the repo scope is explicitly changed.

## What SOLEARTé Offers

Three revenue paths, documented on solearte.co:

1. **Original paintings**: saturated contemporary portraits and original works.
2. **Commissions and collaborations**: custom portrait commissions and collaborative artwork, scoped directly with the artist before work begins.
3. **Carry Your Colors**: a wearable-art collection (high-top sneakers, mug, accent pillow) created to honor identity, resilience, and the courage it takes to begin again. 15% of proceeds support Rocky Mountain Immigrant Advocacy Network (RMIAN) and its legal services for immigrant families.

## Who This Repo Speaks To

- Collectors and first-time art buyers in Denver and the Front Range who want expressive, personal, color-forward work.
- People commissioning a portrait of a family member, partner, child, elder, pet, or themselves for a milestone, memorial, or gift.
- Immigrants, first-generation families, and anyone whose story includes movement, who see themselves in the work.
- Brands, venues, creators, and community organizations seeking an artist collaboration with a real point of view.
- Supporters who want their purchase to fund immigrant legal aid through RMIAN.

This is not for print-on-demand marketplaces, NFT drops, stock-art licensing, or generic "art for sale" churn. The work carries a story, and the growth system must carry it too.

## What This Repo Contains

- `agents/`: SOLEARTé-specific agent cards and operating instructions.
- `agent-ops/`: Launch-mode routing, activation prompts, approval rules, handoffs, and output contracts.
- `.agents/`: Shared agent resources, including the external MarketingSkills submodule.
- `product/`: Brand brief, positioning, audiences, offers, pricing notes, objections, and claim boundaries.
- `research/`: Audience questions, collector language, comparable artists, community notes, and the Denver art scene.
- `audience-research/`: Personas, emotional drivers, motivations, objections, and content triggers.
- `creative-research/`: Instagram hooks, reel, carousel, and story patterns, visual patterns, and save/share triggers.
- `competitors/`: Comparable artist accounts, content breakdowns, and positioning gaps.
- `swipe-files/`: Reusable story, process, CTA, DM, and collection hooks.
- `voice-of-customer/`: Quote capture, buying language, and common phrases (capture only, never invent).
- `content/`: Content pillars, calendar, captions, carousels, scripts, and newsletter drafts.
- `instagram/`: Instagram-first strategy, profile, visual style, engagement, DM handling, and week-one plan.
- `lead-magnets/`: Portrait commission guide and follow-up sequences.
- `outbound/`: Collaboration and venue prospecting, outreach sequences, and reply handling.
- `sales/`: Commission inquiry handling, intake, proposal, delivery, and objection assets.
- `website/`: Homepage, about, commission, Carry Your Colors, product copy, CRO, and SEO notes.
- `analytics/`: Weekly reporting, content performance, commission pipeline, shop performance, experiments.
- `workflows/`: Weekly growth cadence, production, commission process, research loop, QA.
- `automations/`: Non-credentialed automation specs for publishing, DM triage, inquiry routing, order follow-up, and reporting.
- `launch/`: Artist-facing launch command center, checklists, publishing calendar, risk register, retrospective.
- `templates/`: Reusable Markdown templates for agents and growth work.
- `.github/`: Issue and pull request templates.

## How The Agent System Works

`agents/orchestrator-agent.md` runs the weekly growth cycle and routes work to specialized agents. The Brand Narrative Agent owns the story, research captures how collectors and communities actually talk, the Instagram Content Agent turns studio life and finished work into Instagram-native posts, the DM and Commission Sales agents turn interest into scoped commissions, the Collab Outreach Agent opens doors with brands and venues, the Shop Agent moves Carry Your Colors, the Community Impact Agent keeps the RMIAN commitment visible and honest, analytics closes the loop, and QA checks for accuracy, tone, and risk.

`[Research] --> [Narrative] --> [Content/Outreach] --> [Commissions/Shop] --> [Analytics] --> [QA]`

Agents should read in this order:

1. `product/brand-brief.md` for the canonical artist context.
2. `product/icp.md` for fit and disqualification.
3. `audience-research/` and `voice-of-customer/` for buyer psychology and language.
4. `creative-research/`, `competitors/`, and `swipe-files/` for current creative patterns.
5. The relevant agent card in `agents/`.
6. The matching workflow in `workflows/`.
7. `workflows/qa-review.md` before anything is used externally.

## Channel Strategy

Instagram is the primary channel because art is bought with the eyes first, and collectors, commissioners, and collaborators discover artists there.

Primary:

- Instagram (feed, reels, stories, DMs)

Secondary:

- Email (commission inquiries and a small collector list)
- In-person Denver events, markets, murals, and studio visits
- TikTok and YouTube Shorts (process video reuse)
- LinkedIn (brand collaborations and corporate commissions only)

## Weekly Operating Cadence

- Monday: research, narrative, and priorities.
- Tuesday: Instagram content production from studio footage and finished work.
- Wednesday: commission follow-up, collab outreach, and shop pushes.
- Thursday: sales asset and website improvement.
- Friday: analytics, learning, and QA.

## Claim Boundaries

Do not claim SOLEARTé:

- Has gallery representation, press features, awards, exhibitions, or clients that are not documented in this repo.
- Has testimonials, sales numbers, follower counts, or case studies that are not documented in this repo.
- Guarantees a commission price, timeline, or format before the artist reviews the inquiry.
- Donates more or less than the documented 15% of Carry Your Colors proceeds to RMIAN, or that RMIAN endorses the work.
- Speaks for RMIAN, any immigrant community, or any individual's story other than her own.

If a claim is uncertain, mark it as a hypothesis or route it to QA. The artist's story is hers. Amplify it accurately.
