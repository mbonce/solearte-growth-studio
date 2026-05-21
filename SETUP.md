# Setup

This repository is intentionally lightweight. It contains Markdown operating assets for an AI-agent-powered growth studio, not application code.

## Clone The Repo

```bash
git clone https://github.com/mbonce/wholesale-ops-growth-studio.git
cd wholesale-ops-growth-studio
```

## Initialize Submodules

```bash
git submodule update --init --recursive
```

## Add MarketingSkills Manually If Needed

If the MarketingSkills submodule is missing, add it manually:

```bash
git submodule add https://github.com/coreyhaines31/marketingskills.git .agents/marketingskills
```

## Update MarketingSkills

Pull the latest version of the shared marketing skill library:

```bash
git submodule update --remote .agents/marketingskills
```

Review changes before committing because shared skills can change assumptions, examples, or recommended workflows.

## Work Directly On Main

This repo starts as a direct operating shell on `main`. Keep edits focused, make small commits, and avoid adding app scaffolding unless the product direction explicitly changes.

## Use With AI Agents

1. Start with `product/product-marketing.md` and `product/icp.md`.
2. Select the relevant agent card in `agents/`.
3. Pull reusable technique from `.agents/marketingskills`.
4. Write or revise the output in the matching folder.
5. Run `agents/qa-agent.md` against the work before using it externally.

Do not let generic marketing advice override the Wholesale-Ops constraint: this is for Amazon FBA wholesale operators, not traditional wholesale distributors.

