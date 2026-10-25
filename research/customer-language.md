# Customer Language

Use this file to capture seller phrases exactly. Mark source, date, context, and confidence.

## Direct Seller Phrases

| Date | Source | Phrase | Workflow Area | Notes |
|---|---|---|---|---|
| [YYYY-MM-DD] | [DM/comment/interview/call] | "[exact phrase]" | [supplier/catalog/buy-list/replenishment/etc.] | [fit, confidence, permission notes] |

## Sample Phrases To Validate

- "My sheets are getting out of control."
- "My VA found it, but I do not know why it made the buy list."
- "We analyzed that catalog already, but nobody knows what happened."
- "The margin looked fine until prep, shipping, and repricing hit."
- "I need to know what is ready to reorder before we run out."
- "Supplier follow-ups are all over Gmail and Slack."
- "I do not have a clean history of why we rejected that ASIN."
- "Account-health notes are separate from the product decision."

## Validation Notes

- Confirm which phrases come from qualified FBA wholesale sellers.
- Track whether language appears in interviews, DMs, comments, or sales calls.
- Avoid publishing seller quotes without permission.

## Cycle 2 Public VOC

Status: public-source research patterns. Use as internal research until QA and human approval clear any external wording.

### Supplier Sheet / CSV Catalog Intake

| Source Type | Phrase Or Pattern | Paraphrased Pattern | Confidence |
|---|---|---|---|
| Amazon Seller Central forum | "supplier spreadsheets" and "CSV supplier lists" | The painful unit is a large supplier file, not one ASIN. | Medium |
| Reddit seller thread | suppliers provide spreadsheets with product, price, UPC, and MSRP | Supplier spreadsheets are a common starting point for wholesale analysis. | Low to Medium |
| Operator/how-to blog | price list, product catalog, line sheet, CSV/XLSX | Public practitioner language clusters around price-list and catalog intake. | Low |
| Tool category pages | bulk analysis, supplier spreadsheets, shortlist | Vendor/tool language supports the category vocabulary but is not raw VOC. | Low |

Patterns to capture next:

- Manual lookup and copy/paste frustration.
- UPC/EAN/ASIN matching language.
- Bulk file upload -> enrich -> filter -> shortlist/buy decision.
- Native item-by-item workflow being too slow for supplier files.

### VA Shortlist QA / Buy-List Review

| Source Type | Phrase Or Pattern | Paraphrased Pattern | Confidence |
|---|---|---|---|
| VA hiring board | clean Google Sheets | Managers want structured output, not vague product ideas. | Medium |
| VA hiring board | test-buy-ready products only | Strong signal that shortlist quality is about decision readiness. | Medium |
| VA hiring board | ASIN matching, eligibility/profitability checks | VA tasks include producing reviewable catalog research. | Medium |
| VA training/delegation article | SOPs and repeatable tasks | Delegation quality depends on process clarity. | Low |

Patterns to capture next:

- "I still have to check everything."
- Quality varies.
- Not theoretical opportunities.
- Missing reason, unclear approval state, inconsistent fields, questionable ASIN match, stale assumptions, no notes, unclear rejection reason.
- Evidence that founder/operator reviews or rechecks VA shortlists before PO creation.

## Cycle 4 Vocabulary Guardrails

Date: 2026-06-10

Use these as source-labeled workflow patterns, not as direct seller quotes:

- Spreadsheet lane: supplier spreadsheet, price list, product catalog, line sheet, CSV supplier list, bulk spreadsheet scan.
- VA/review lane: clean Google Sheets, test-buy-ready, pass/fail decisions, manager-ready review, ready-to-buy flags.

Current rule:

- Public-source vocabulary is strong enough to shape internal hooks and diagnostic copy.
- First-person emotional phrasing is still too thin to justify quote-style copy or "sellers keep saying..." wording.
- Until direct VOC improves, write as paraphrased workflow observations and keep confidence labels attached in research and QA files.

## Cycle 8 Review-State Phrase Targets

Date: 2026-06-11

Status: internal-only phrase refinement from existing public-source evidence and current QA passes.

Use these as paraphrased workflow language, not direct seller quotes:

### Approval-State And Decision-History Lane

| Source Type | Phrase Or Pattern | Paraphrased Pattern | Confidence |
|---|---|---|---|
| Cycle 2 public evidence pass plus VA hiring posts | clean Google Sheets, pass/fail decisions, test-buy-ready, manager review | The shortlist is not useful until it is review-ready for the operator. | Medium |
| Cycle 2 public evidence pass plus catalog-intake research | supplier spreadsheet, price list, product catalog, ASIN matching, shortlist | Matching and filtering do not finish the decision; approval state still has to be made visible. | Medium |
| Internal QA and packet hardening passes | owner, status, reason, next action, rejection history | Decision history is the missing context that turns rows into reviewable work. | Medium for workflow framing; Low for external proof |

### Phrase Targets To Validate Next

- approved buy
- needs owner review
- rejection reason
- approval state
- review-ready
- next action missing
- stale status
- decision history

Current rule:

- Safe for internal hooks, QA labels, and design notes when kept diagnostic.
- Not safe to present as direct seller testimony or repeated public complaint without stronger source capture.

## Cycle 9 Operator-Proof Capture Brief

Date: 2026-06-11 06:29 MDT

Status: internal-only validation brief for the active direct-VOC workstream.

Priority proof targets for the next evidence upgrade:

| Target | Why It Matters | Current Confidence | Upgrade Trigger |
|---|---|---|---|
| "needs owner review" | Connects VA output to operator approval instead of generic team confusion. | Medium for workflow framing / Low for direct proof | 2+ first-person operator examples from qualified wholesale sellers or managers. |
| "decision history" | Sharpens the matched-vs-buy message without leaning on outcome claims. | Medium for workflow framing / Low for direct proof | 2+ examples of sellers needing rejection reasons or prior review context. |
| "approved buy" | Distinguishes analysis from final buy-list readiness. | Medium for workflow framing / Low for direct proof | 2+ public or approved direct sources showing explicit approval-state language. |
| "next action missing" | Supports diagnostic story framing without drifting into supplier-follow-up claims. | Medium for workflow framing / Low for direct proof | 2+ examples tying stalled review to a missing next action or stale status. |

Allowed source classes for this lane:

- Public first-person forum posts from qualified wholesale/FBA operators.
- Approved customer or founder call notes if permission is explicit.
- Hiring/SOP artifacts only as vocabulary support, not as quote proof.

Disallowed shortcut:

- Do not convert paraphrased workflow language into quote-style pain lines just to fill copy.

## Cycle 12 Decision-History Proof Increment

Date: 2026-06-12 03:45 MDT

Status: internal-only phrasing and visual-proof extension for the active direct-VOC workstream.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| rejection reason missing | A row can be matched and reviewed without preserving why it was rejected. | Medium for workflow framing / Low for direct proof | Decision-history board, QA labels, packet notes |
| approved-buy context missing | Approval should carry a visible owner, decision note, and handoff state. | Medium for workflow framing / Low for direct proof | Matched-vs-buy board, approval-state board |
| next action missing | Review-state confusion persists when nobody owns the next step after review. | Medium for workflow framing / Low for direct proof | Approval-state board, Story 5 replacement visuals |

Next upgrade trigger:

- Find 2+ qualified first-person operator examples that describe missing rejection reason, approval context, or next action after review.
- Keep all interim copy paraphrased and source-labeled until those examples exist.

## Cycle 13 Handoff-Ready Proof Increment

Date: 2026-06-12 04:46 MDT

Status: internal-only phrasing and board-system extension for the active direct-VOC workstream.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| handoff-ready state | A row is not handoff-ready until approval note, owner, and next action survive the review. | Medium for workflow framing / Low for direct proof | Handoff-ready board, packet notes, QA labels |
| approval note saved | Approval should preserve why the row moved forward, not only that it moved. | Medium for workflow framing / Low for direct proof | Handoff-ready board, matched-vs-buy board |
| owner carries the next step | Review stops being reusable when the next owner is implied instead of visible. | Medium for workflow framing / Low for direct proof | Approval-state board, handoff-ready board |

Current safe rule:

- Treat handoff-ready language as an internal endpoint for the same matched-vs-buy and approval-state packet lane.
- Keep all wording paraphrased and source-labeled until first-person operator proof appears.
- Do not convert "handoff-ready" into performance or speed claims.

## Cycle 14 Review-Queue Drift Proof Increment

Date: 2026-06-12 05:47 MDT

Status: internal-only phrasing and board-system extension for the active direct-VOC workstream.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| review queue drift | A row can be reviewed and still drift backward when the queue no longer preserves the reason, owner, or next step. | Medium for workflow framing / Low for direct proof | Review-queue-drift board, packet notes, QA labels |
| stale review state | Review status alone does not protect the row if the queue lacks a saved decision note or explicit ownership. | Medium for workflow framing / Low for direct proof | Review-queue-drift board, approval-state board |
| queue re-opened after review | Teams keep re-checking the same row when the saved next action disappears after the initial review. | Medium for workflow framing / Low for direct proof | Review-queue-drift board, decision-history board |

Current safe rule:

- Treat review-queue-drift language as an internal-only companion to handoff-ready framing, not a separate performance claim.
- Keep all wording paraphrased and source-labeled until first-person operator proof appears.
- Do not convert queue-drift language into speed, SLA, or throughput claims.

## Cycle 15 Saved-Decision-Context Proof Increment

Date: 2026-06-12 06:47 MDT

Status: internal-only phrasing and board-system bridge for the active direct-VOC workstream.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| saved decision context | A review becomes reusable when approval note, rejection reason, next owner, and next step stay attached to the row. | Medium for workflow framing / Low for direct proof | Saved-decision-context board, packet notes, QA labels |
| rejection reason preserved | Rejected rows still create useful workflow context when the reason stays visible for the next review. | Medium for workflow framing / Low for direct proof | Saved-decision-context board, decision-history board |
| next owner preserved | Review does not hand off cleanly when the row loses who owns the next move after approval. | Medium for workflow framing / Low for direct proof | Saved-decision-context board, handoff-ready board |

Current safe rule:

- Treat saved-decision-context language as the bridge between decision-history and handoff-ready framing, not as a speed or automation claim.
- Keep all wording paraphrased and source-labeled until first-person operator proof appears.
- Do not convert saved-context language into promises about throughput, error reduction, or operational guarantees.

## Cycle 16 Review-Receipt Proof Increment

Date: 2026-06-12 07:49 MDT

Status: internal-only phrasing and board-system extension for the active direct-VOC workstream.

## Cycle 19 Approval-Chain Bridge Increment

Date: 2026-06-12 09:40 MDT

Status: internal-only phrasing and packet-bridge extension for the staged graphics lane.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| approval chain | A row needs the decision note, reviewer checkpoint, reopen reason, and next owner to travel together. | Medium for workflow framing / Low for direct proof | Approval-chain board, founder-review packet cover, QA notes |
| context travels with the row | Review is only reusable when the context moves with the row instead of living in memory or side channels. | Medium for workflow framing / Low for direct proof | Approval-chain board, social draft guardrail |
| chain breaks after review | The next operator rebuilds the same decision when the review chain loses who cleared the row, what changed, or who owns the next move. | Medium for workflow framing / Low for direct proof | Approval-chain board, queue QA notes |

Current safe rule:

- Treat approval-chain language as a bridge across the existing matched-vs-buy, review-receipt, reopen-reason, and handoff-ready boards.
- Keep all wording paraphrased and source-labeled until first-person operator proof appears.
- Do not convert approval-chain framing into speed, accuracy, or guarantee claims.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| review receipt | A reviewed row is only reusable when the queue keeps a saved reviewer checkpoint, not only a status chip. | Medium for workflow framing / Low for direct proof | Review-receipt board, packet notes, QA labels |
| who cleared this row | Teams re-check approved rows when the reviewer, decision note, or approval checkpoint is not preserved. | Medium for workflow framing / Low for direct proof | Review-receipt board, review-queue-drift board |
| checkpoint survives handoff | Review context should persist as a lightweight receipt that names the reviewer, reason, next owner, and next step. | Medium for workflow framing / Low for direct proof | Review-receipt board, handoff-ready board |

Current safe rule:

- Treat review-receipt language as the artifact that makes saved decision context reusable, not as a throughput or automation claim.
- Keep all wording paraphrased and source-labeled until first-person operator proof appears.
- Do not convert review-receipt framing into guarantees about speed, accuracy, or fewer mistakes.

## Cycle 17 Reopen-Reason Proof Increment

Date: 2026-06-12 08:51 MDT

Status: internal-only phrasing and board-system extension for the active direct-VOC workstream.

## Cycle 21 Chain-Breakpoint Increment

Date: 2026-06-12 11:52 MDT

Status: internal-only phrasing and packet-tightening extension for the active direct-VOC workstream.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| chain breakpoint | The workflow breaks where the row drops the decision note, reviewer checkpoint, reopen trigger, or next owner. | Medium for workflow framing / Low for direct proof | Graphic 11, packet notes, QA labels |
| context leak | Teams repeat the same review when context leaks out of the row and into memory or side channels. | Medium for workflow framing / Low for direct proof | Graphic 10, caption tightening, derivative brief |
| next operator rebuilds the decision | The next operator starts over when the row keeps status but loses the approval chain. | Medium for workflow framing / Low for direct proof | Graphic 09, Graphic 11, X derivative map |

Current safe rule:

- Treat chain-breakpoint language as a tighter naming layer on top of the existing approval-chain lane.
- Keep all wording paraphrased and source-labeled until first-person operator proof appears.
- Do not convert context-leak or breakpoint language into promises about speed, revenue, or error reduction.

## Cycle 20 Approval-Chain Direct-VOC Upgrade

Date: 2026-06-12 10:50 MDT

Status: internal-only phrasing and packet-selection extension for the active direct-VOC workstream.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| context carries forward | Review is only reusable when the decision context carries forward with the row instead of living in memory, chat, or separate notes. | Medium for workflow framing / Low for direct proof | Approval-chain board, alternate cover board, founder packet notes |
| decision carries with the row | The row is not handoff-ready if the approval note, reviewer checkpoint, reopen trigger, and next owner do not move together. | Medium for workflow framing / Low for direct proof | Approval-chain board, packet QA notes |
| chain breaks force re-review | Teams rebuild the same decision when the queue loses why the row moved, who cleared it, or what changed. | Medium for workflow framing / Low for direct proof | Approval-chain board, cover-sequence QA notes |

Current safe rule:

- Treat this phrasing as the highest-signal internal bridge between the staged graphics packet and the direct-VOC workstream.
- Keep all wording paraphrased and source-labeled until first-person operator proof appears.
- Do not convert context-carries-forward framing into claims about speed, automation accuracy, or outcome improvement.

Use these as diagnostic workflow patterns, not direct seller quotes:

| Target | Safe Internal Framing | Confidence | Visual Use |
|---|---|---|---|
| reopen reason missing | A row that comes back into review still needs an explicit reason for why it reopened, not only a new status. | Medium for workflow framing / Low for direct proof | Reopen-reason board, packet notes, QA labels |
| back in review without context | Teams repeat the same review when the queue does not preserve what changed or who reopened the row. | Medium for workflow framing / Low for direct proof | Reopen-reason board, review-queue-drift board |
| change trigger saved | Re-opened review is reusable only when the row carries the trigger, reviewer checkpoint, next owner, and next step forward. | Medium for workflow framing / Low for direct proof | Reopen-reason board, review-receipt board |

Current safe rule:

- Treat reopen-reason language as a diagnostic extension of review drift and review-receipt framing, not as a promise about fewer mistakes or faster decisions.
- Keep all wording paraphrased and source-labeled until first-person operator proof appears.
- Do not convert reopen-reason framing into guarantees about workflow quality, throughput, or operator accuracy.
