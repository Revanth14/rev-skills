---
name: pr
description: Write a pull request or issue body as Problem / Fix / Testing / Context, with before/after test evidence and a rollback call. Use when writing, drafting, or rewriting a PR description or issue body, including for upstream Apache repos.
---

# pr

Writes the body of a pull request. It outputs markdown for the user to paste and never opens the PR, pushes, or commits.

## Before writing

1. If the repo has a PR template (`.github/pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE/`, or `PULL_REQUEST_TEMPLATE.md`), its headings win. Fill those headings with the content below and keep any checklists the template has.
2. Match the title to recent merged PRs: `git log --oneline -20 upstream/main` (or `origin/main`) shows the squash-merged titles. Copy their prefix style, e.g. `feat(table):` or `[core]`.
3. Read the diff against the merge base and any linked issue. Write only what the diff and the evidence support.

## Body

```markdown
## Problem

<what is wrong or missing, and who hits it. Link the issue.>

## Fix

<what changed and why this approach. Add a small visual only when prose is unclear.>

## Testing

<exact test names and commands, with before/after.>

## Context

<rollback cost, related PRs, intentional divergence from a reference implementation.>
```

Each section is a few precise sentences. No preamble, no restating the title, no repro scaffolding, no footer or badges.

### Fix

When the shape of the change is hard to state in a sentence, add the smallest visual that makes it clear: a call-tree `diff`, a short file tree, or pseudocode. One visual, next to the sentence it supports. Skip it for small changes.

### Testing

- Name the tests and the command that ran them, e.g. `go test -race ./table/...`.
- For a bug fix, show before/after: the test fails without the fix and passes with it. Claim this only if the test was actually run with the fix reverted. Otherwise write "regression test added; fail-without-fix not verified."
- Never claim a check passed that did not run. If something was skipped, say skipped.

### Context

- One line on rollback: a two-way door (cheap to revert) or a one-way door (migration, format or API change, data written in a new layout). For one-way doors, add one line on who is affected.
- If the change deliberately differs from a reference implementation (e.g. iceberg-go vs Java iceberg), say so and why. Never hide the difference.
- Leave the section out if there is nothing to say.

## Issue bodies

Same four headings, with **Fix** as the proposed fix and **Testing** as how the fix would be verified.
