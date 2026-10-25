# Setup

This repository is intentionally lightweight. It contains Markdown operating assets for an AI-agent-powered growth studio for the artist SOLEARTé, not application code.

## Clone The Repo

```bash
git clone https://github.com/mbonce/solearte-growth-studio.git
cd solearte-growth-studio
```

## Initialize Submodules

```bash
git submodule update --init --recursive
```

## Add MarketingSkills Manually If Needed

```bash
git submodule add https://github.com/coreyhaines31/marketingskills.git .agents/marketingskills
```

## Update MarketingSkills

```bash
git submodule update --remote .agents/marketingskills
```

Review changes before committing because shared skills can change assumptions, examples, or recommended workflows.

## Work Directly On Main

Keep edits focused, make small commits, and avoid adding app scaffolding unless the direction explicitly changes.

## Use With AI Agents

1. Start with `product/brand-brief.md` and `product/icp.md`.
2. Select the relevant agent card in `agents/`.
3. Pull reusable technique from `.agents/marketingskills`.
4. Write or revise the output in the matching folder.
5. Run `agents/qa-agent.md` against the work before using it externally.

Do not let generic marketing advice override the SOLEARTé constraint: this is one artist's story and work, told accurately, in her voice, never as a faceless art brand.

## Source Of Truth

Facts about the artist, offers, prices, and the RMIAN commitment come from https://solearte.co. When the site and this repo disagree, the site wins and the repo gets updated.
