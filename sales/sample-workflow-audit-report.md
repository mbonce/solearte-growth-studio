# Sample Workflow Audit Report (Template Narrative)

_This is a fictional example used for internal sales training and service packaging consistency._

## Fictional Seller Profile

- Seller: Atlas Wholesale Ops (fictional)
- Model: Amazon FBA wholesale
- Team: Founder + 2 VAs + 1 sourcing partner
- Monthly catalog volume: 180–260 candidate SKUs
- Replenishment cadence: weekly review cycle
- Current software set:
  - Google Sheets
  - Seller Central
  - Slack
  - Gmail
  - 1 task tracker

## Current Workflow Map

1. Supplier outreach and follow-up in email + messenger.
2. Catalog files downloaded into a master sheet.
3. Analyst-like review notes in shared notes, not unified with decision records.
4. Buy-list built from partial ASIN checks and manual assumptions.
5. POs issued in Gmail/notes, then copied into a sheet.
6. Shipment prep tracked in a different sheet from supplier confirmation.
7. Replenishment done from gut feel when stock alarms appear.

## Tool Fragmentation Map

| Workflow stage | Primary tool | Backup artifact | Problem |
|---|---|---|---|
| Supplier pipeline | Gmail + sheet | Slack thread | Follow-up ownership unclear |
| Catalog intake | Google Sheet | Notes app | No single review state |
| ASIN review | Sheet + notes | Voice notes | Decision rationale hard to audit |
| Buy list | Spreadsheet tab | Private VA messages | Weak approval trace |
| PO workflow | Sheet | Email attachments | Missing status consistency |
| Shipment | Spreadsheet + messages | Shipping receipt inbox | Delayed exception visibility |
| Replenishment | Sheet memory + spreadsheet | Founder notes | Time-lagged margin checks |
| VA work | Slack | Private notes | Task outputs unreviewed |

## Bottlenecks

- Suppliers without status windows.
- Catalog rows sitting in “review” without owner assignment.
- ASIN decisions without confidence, margin, and exception tags.
- Buy-list entries updated after purchase decisions.
- Shipment and PO handoff mismatch causing repeated status checks.
- Replenishment from memory when velocity changed mid-week.

## Risk Points

- Supplier communication delays can create late contact windows.
- Inconsistent decision rationale creates duplicated buys.
- No structured exception flow for invoice or PO variance.
- Restriction or brand notes not tied to supplier/catalog context.

## Spreadsheet Dependency Points

- No single source of truth for catalog-to-buy-list state.
- Status columns differ by sheet and by VA.
- Reconciliation only happens during urgent issue spikes.

## Recommended Cleanup Sequence

### Phase 1 (Weeks 1–2): Supplier + Catalog Handoff
- Standardize one schema for catalog rows.
- Add ownership and decision date fields.
- Introduce supplier next-follow-up owner + reminder logic.

### Phase 2 (Weeks 2–3): ASIN and Buy-List Alignment
- Force buy-list entries to link back to approved ASIN records.
- Require rationale + assumption check for each buy line.

### Phase 3 (Weeks 3–4): PO / Shipment / Replenishment
- Add PO status and shipment exception fields in one workflow map.
- Introduce replenishment trigger that references latest stock, margin, and supplier reliability.

## 30-Day Implementation Plan

- Day 1: intake + map + baseline scorecard.
- Day 4: cleaned workflow template for catalog intake.
- Day 8: buy-list approval and VA accountability update.
- Day 12: connect PO and shipment handoff fields.
- Day 18: first replenishment guardrail trial and exception drill.
- Day 25: scorecard re-check and first operator handoff.
- Day 30: pilot recommendation and next-step plan.

## SaaS Transition Recommendation

- Pilot-ready candidate workflow: catalog intake + buy-list handoff.
- SaaS fit score: High, because this workflow has:
  - repeatable decision inputs
  - recurring VA participation
  - frequent handoffs
  - recurring exceptions
- Pilot conclusion options:
  - move selected workflow into Wholesale Ops SaaS beta
  - keep some steps manual for 30–60 days while operational quality stabilizes
  - drop pilot and re-scope if founder capacity is currently the bottleneck

## Founder Notes

- Refrain from claiming realized profit outcomes from this sample.
- Use only as a training artifact and sales framing baseline.
- Replace every number with real seller data in live audits.
