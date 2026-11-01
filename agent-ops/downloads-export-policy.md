# Downloads Export Policy

Status: active local-staging policy.

Downloads export root:

`/Users/michaelboncelet/Downloads/wholesale-ops-growth-studio-approved-content`

## Purpose

When QA thinks a marketing asset is good enough for deployment preparation, agents should copy the asset into the local Downloads export folder so Mike can quickly find it.

This is a local staging action only. It is not permission to post, DM, email, schedule, publish, or externally distribute anything.

## Eligible For Downloads Export

An asset may be exported when all of these are true:

- QA status is one of:
  - `internal queue approved`
  - `internal-ready after QA tagging`
  - `ready after approval`
  - `approved_for_human_use`
  - `qa_deployable`
- The asset includes no unresolved `remove` findings from the claims tagging rubric.
- The asset includes the scorecard CTA only if the scorecard delivery path is either confirmed or clearly marked pending confirmation.
- The asset carries any remaining human-approval warnings.
- The export manifest records source path, QA source, export timestamp, and external-use status.

## Not Eligible

Do not export assets with status:

- `draft`
- `draft-only`
- `needs_revision`
- `needs_qa`
- `human_review` with unresolved QA edits
- `blocked`

Do not export any asset containing:

- Posting instructions.
- DM/send/reply instructions.
- Email instructions.
- External scheduling instructions.
- Pricing, billing, refund, or guarantee commitments.
- Account-health, compliance, legal, IP, suspension, or Amazon-policy advice.
- Public result claims.
- Undocumented product claims.
- Fake metrics, testimonials, case studies, customers, or invented exact quotes.

## Export Rules

- Keep Markdown as Markdown.
- Preserve source filenames when possible.
- Add or preserve warnings that external use still requires Mike approval.
- Export into a cycle-specific folder such as `cycle-1/`.
- Update `agent-ops/downloads-export-manifest.json` after each export.
- Append an event to `agent-ops/loop-events.jsonl`.

