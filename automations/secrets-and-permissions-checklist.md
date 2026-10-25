# Secrets and Permissions Checklist

## Access checklist

- Instagram account access
- Meta Business Suite access
- scheduling tool
- scorecard form
- email tool
- booking tool
- analytics access
- storage access

## Secret categories (required before live automation)

- API tokens (environment secret, never in repo)
- webhook secrets
- service account credentials
- scheduling credentials

## Permissions

- `read` creator pages and comments
- `read/write` approved launch docs
- `post` rights only for approved content queues
- high-risk DM moderation rights for humans

## Human owner

- Primary owner: Founder
- Backup owner: Orchestrator Agent
- QA owner: QA Agent
- Escalation owner: Human reviewer (founder)

## Safety rule

- No credentials, keys, passwords, or tokens are stored in markdown or scripts.
