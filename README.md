# rev-skills

The agent skills I use in my day-to-day workflow with my agents, bundled behind one command.

## Install

Everything, into the current project:

```bash
curl -fsSL skills.revanth.io | bash
```

Globally (user-level) instead:

```bash
curl -fsSL skills.revanth.io | bash -s -- -g
```

Or install just the `rev-skills` meta skill, then ask your agent to run `/rev-skills`. It pulls in the rest:

```bash
npx skills add Revanth14/rev-skills --skill rev-skills -y
```

Targets Claude Code by default. For another agent, set `SKILLS_AGENT` on `bash`, after the pipe:

```bash
curl -fsSL skills.revanth.io | SKILLS_AGENT=codex bash
```

## The workflow

| Stage | Skill | What it does | Source |
| --- | --- | --- | --- |
| Setup | `setup-matt-pocock-skills` | One-time repo setup: issue tracker, triage labels, domain doc layout | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Setup | `git-guardrails-claude-code` | Hooks that block push, `reset --hard`, `clean`, `branch -D` before they run | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Think | `grilling` | Grills me relentlessly on a plan, decision, or idea | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Think | `grill-with-docs` | Same interview, but writes ADRs and a glossary as it goes | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Plan | `to-spec` | Turns the conversation into a spec on the issue tracker | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Plan | `to-tickets` | Breaks a spec into tracer-bullet tickets with blocking edges | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Build | `implement` | Implements work from a spec or set of tickets | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Build | `tdd` | Test-first, red-green-refactor | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Build | `golang-testing` | Table-driven tests, fuzzing, goroutine leak detection | [samber/cc-skills-golang](https://github.com/samber/cc-skills-golang) |
| Build | `golang-concurrency` | Goroutine lifecycle, channel ownership, leak prevention | [samber/cc-skills-golang](https://github.com/samber/cc-skills-golang) |
| Build | `golang-performance` | Allocation, CPU and memory-layout fixes, driven by profiling | [samber/cc-skills-golang](https://github.com/samber/cc-skills-golang) |
| Build | `modern-python` | Python projects and scripts on uv, ruff and ty | [trailofbits/skills](https://github.com/trailofbits/skills) |
| Build | `frontend-design` | Distinctive, intentional UI design | [anthropics/skills](https://github.com/anthropics/skills) |
| Build | `vercel-react-best-practices` | React / Next.js performance rules | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| Debug | `diagnosing-bugs` | Diagnosis loop for hard bugs and perf regressions | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Verify | `verification-before-completion` | No "done" or "passing" claim without fresh command output | [obra/superpowers](https://github.com/obra/superpowers) |
| Review | `code-review` | Standards and spec review in parallel sub-agents | [mattpocock/skills](https://github.com/mattpocock/skills) |
| Review | `web-design-guidelines` | Audits UI against the Web Interface Guidelines | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| Review | `receiving-code-review` | Weighs review feedback on its merits instead of agreeing by default | [obra/superpowers](https://github.com/obra/superpowers) |
| Ship | `pr` | PR and issue bodies as Problem / Fix / Testing / Context, with before/after test evidence | [Revanth14/rev-skills](skills/pr/SKILL.md) |
| Reflect | `retro` | Runs a retrospective on a coding session | [mattpocock/skills](https://github.com/mattpocock/skills) |

## Updating the list

Edit the `SKILLS` array in [`install.sh`](install.sh), the table above, and the table in [`skills/rev-skills/SKILL.md`](skills/rev-skills/SKILL.md).
