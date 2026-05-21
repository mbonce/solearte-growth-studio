# Research Automation Specification

## Goal

Capture and classify market signal daily, feeding content and QA systems.

## Inputs

- Instagram creator posts
- Instagram comments
- X posts and thread comments
- YouTube titles and comments
- Instagram DMs (public classification only)
- Existing analytics files:
  - `analytics/content-performance.md`
  - `analytics/instagram-dm-performance.md`
  - `analytics/research-insights-log.md`

## Outputs

- pain points
- hooks
- seller language
- objections
- content opportunities
- product implications

## Process

Gather signals --> Normalize timestamps + source --> Classify by workflow area --> Extract language --> Tag sentiment and confidence --> Write to research outputs --> Raise to Audience Research Agent

## Workflow mapping

- Map signals to these buckets:
  - Supplier pipeline
  - Catalog intake
  - ASIN review
  - Buy-list workflow
  - Margin tracking
  - PO workflow
  - FBA shipments
  - Replenishment
  - VA accountability
  - Risk control

## Data model

- date
- source
- raw text
- topic
- workflow area
- pain intensity (low/med/high)
- candidate hook
- candidate objection
- evidence confidence (low/med/high)
- recommended owner
- human review needed (true/false)

## Acceptance criteria

- Every daily run creates at least one structured output row.
- Weak confidence rows are marked for review.
- No creator data is copied without public-source discipline.
