#!/usr/bin/env bash
# Install every skill in Revanth's workflow into the current project.
#   curl -fsSL skills.revanth.io | bash
# Pass -g to install globally instead:  ... | bash -s -- -g
set -euo pipefail

AGENT="${SKILLS_AGENT:-claude-code}"
EXTRA=("$@")

# source repo -> space-separated skill names
SKILLS=(
  "mattpocock/skills|code-review diagnosing-bugs git-guardrails-claude-code grill-with-docs grilling implement retro setup-matt-pocock-skills tdd to-spec to-tickets"
  "obra/superpowers|receiving-code-review verification-before-completion"
  "samber/cc-skills-golang|golang-concurrency golang-performance golang-testing"
  "anthropics/skills|frontend-design"
  "trailofbits/skills|modern-python"
  "Jeffallan/claude-skills|spring-boot-engineer"
  "vercel-labs/agent-skills|vercel-react-best-practices web-design-guidelines"
  "Revanth14/rev-skills|pr"
)

if ! command -v npx >/dev/null 2>&1; then
  echo "rev-skills needs Node.js (npx). Install it from https://nodejs.org and rerun." >&2
  exit 1
fi

for entry in "${SKILLS[@]}"; do
  src="${entry%%|*}"
  names="${entry#*|}"
  args=()
  for n in $names; do args+=(--skill "$n"); done
  echo "==> $src: $names"
  npx -y skills add "$src" "${args[@]}" --agent "$AGENT" -y ${EXTRA[@]+"${EXTRA[@]}"}
done

echo "Done. Installed rev-skills for $AGENT."
