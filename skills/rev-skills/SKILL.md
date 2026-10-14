---
name: rev-skills
description: Install Revanth's full set of agent skills (repo setup, git guardrails, grilling, specs/tickets, TDD, Go testing/concurrency/performance, Python tooling (uv/ruff), frontend design, React/Next.js performance, UI audits, bug diagnosis, code review and receiving review, verification before completion, PR bodies, retrospectives) into the current project.
disable-model-invocation: true
---

# rev-skills

Installs every skill in Revanth's workflow in one go.

## Steps

1. Ask once whether to install into this project (default) or globally (`-g`), unless the user already said.
2. Run the installer from the repo root of the current project:

   ```bash
   curl -fsSL skills.revanth.io | bash
   ```

   For a global install append `-s -- -g` to `bash`.
3. Report which skills were installed (the script prints each source). If one source fails, rerun just that line from `install.sh` and report the error verbatim.

## What gets installed

| Skill | Source |
| --- | --- |
| code-review, diagnosing-bugs, git-guardrails-claude-code, grill-with-docs, grilling, implement, retro, setup-matt-pocock-skills, tdd, to-spec, to-tickets | mattpocock/skills |
| receiving-code-review, verification-before-completion | obra/superpowers |
| golang-concurrency, golang-performance, golang-testing | samber/cc-skills-golang |
| frontend-design | anthropics/skills |
| modern-python | trailofbits/skills |
| vercel-react-best-practices, web-design-guidelines | vercel-labs/agent-skills |
| pr | Revanth14/rev-skills |

To add or remove a skill, edit the `SKILLS` list in `install.sh` and this table.
