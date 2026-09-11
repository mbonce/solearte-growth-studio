# Commission Inquiry Routing Spec

Trigger: site commission form submitted or email with "commission" or "portrait" arrives.
Actions: create a row in the commission pipeline (source, subject, size, timing, placement), send the artist a notification, send the inquirer the auto-acknowledgement from `website/thank-you-page-copy.md` (no price, no timeline).
Fallback: artist checks email daily.
