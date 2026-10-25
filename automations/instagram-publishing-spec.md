# Instagram Publishing Specification

## Safe publishing rule

Do not use fully autonomous posting for launch.

## Flow

`[Approved content] --> [Pre-schedule queue] --> [Founder review] --> [Manual publish] --> [Post-publish confirmation]`

## Inputs

- Approved carousel/reel/story assets.
- Final captions and CTAs.
- Approved posting date/time.

## Outputs

- Published post record
- Link/click tracking setup
- Metrics placeholders to track save/share/reply behavior

## Constraints

- No direct API posting without founder confirmation.
- Any high-risk or borderline copy stays in `human_review`.
- If queue is empty or pending, publishing pauses.

## Manual fallback

- If API/automation unavailable, post from native Instagram and log manually.

## Post publish checks

- Verify link in bio still points to correct scorecard path.
- Verify first comment/DM prompt is visible.
- Verify comment reply ownership handoff is active.
