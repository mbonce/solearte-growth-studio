# Evidence Ledger

Status: internal evidence tracking. Do not turn evidence into public claims without QA and human approval.

| Lane | Confidence | Source Types | Allowed Claim Strength | Next Evidence Target |
|---|---|---|---|---|
| Spreadsheet/workflow load | Medium | Public forums, Reddit threads, operator/how-to blogs, internal product premise | Many operators hit workflow drag when catalog review lives across spreadsheets, messages, and manual checks. No metrics. No universal claims. | 5-10 ICP interviews or call notes confirming spreadsheet-specific bottlenecks and exact language used. |
| VA/team handoff | Medium | VA hiring posts, workflow assumptions, visible handoff patterns in wholesale teams | Team handoff gets harder when review state is not explicit. Safe as process pain, not a guaranteed fix. | Examples of real handoff failures: missed review state, duplicated review, unclear approval owner. |
| Supplier follow-up | Low | Advice/content marketing, marketplace copy, exploratory forum questions | Possible follow-up gap only. Do not claim it is a top pain or common failure mode. | Follow `research/supplier-follow-up-validation.md`: validate with direct complaints, owner/status examples, and buying-decision impact evidence. |
| Matched ASIN vs approved buy | Medium for workflow concept; Low for external proof | Internal product logic, review process design, operator judgment, repeated QA review of draft assets | Separating matched ASIN from approved buy can make review state clearer. Safe for internal workflow framing only; avoid safety, compliance, or profitability claims. | Document 3-5 real catalog review examples showing confusion between match, review, approval, and buy-list readiness, then upgrade only if direct operator examples appear. |
| Review states / scorecard discipline | Medium | Product workflow design, internal dogfooding, operator review patterns | Explicit review states help teams see what still needs judgment. Avoid claiming reduced mistakes unless measured. | Before/after workflow review with a real user: time-to-decision, unclear-owner moments, skipped-review moments. |

## Current Internal Promotion Notes

- Spreadsheet/workflow load, VA/team handoff, and matched-vs-approved-buy are strong enough for internal draft packets when the copy stays diagnostic and carries confidence labels.
- Supplier follow-up remains a secondary diagnostic lane. Story-level usage should stay in `human_review` or internal-only staging unless stronger first-person evidence is captured.
- Scorecard CTA path remains a distribution blocker, not an evidence blocker. Do not confuse a solid workflow concept with approval to externalize it.

## Promotion Rules

- `Seed`: internal hypothesis only.
- `Low`: one weak or indirect signal, or plausible pain with no repeated source support.
- `Medium`: repeated pattern across at least 3 relevant public sources, or 2 stronger VOC-style sources from the ICP.
- `High`: repeated ICP evidence plus observed response behavior such as replies, scorecard downloads, audit requests, interviews, or approved customer conversations.

## High-Confidence Thresholds

Move supplier sheet / CSV catalog intake to high confidence only after:

- 8+ independent public sources across at least 3 source types.
- At least 4 first-person seller/operator examples, not only vendor pages.
- Repeated language around supplier spreadsheets, CSV/XLSX, catalog/price-list upload, manual lookup, bulk analysis, and buying decisions.
- At least 2 examples from sellers beyond beginner stage or managing actual supplier files.

Move VA shortlist QA / buy-list review to high confidence only after:

- 6+ independent sources showing VAs/sourcing teams produce shortlists, buy lists, or supplier-catalog research for Amazon wholesale.
- At least 3 first-person manager/operator complaints about QA, rechecking, unclear notes, bad shortlists, or inconsistent VA work.
- At least 2 hiring posts or SOP/training examples requiring Google Sheets, ASIN matching, eligibility/profitability checks, and ready-to-buy flags.
- Evidence that the bottleneck is manager review quality, not merely hiring a VA.
