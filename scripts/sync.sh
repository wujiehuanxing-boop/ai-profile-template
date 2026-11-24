#!/bin/sh
# AI profile auto sync (macOS / Linux)
# 1. Change REPO to the folder where you cloned your PRIVATE ai-profile repo.
# 2. chmod +x sync.sh
# 3. crontab -e, add a line to run hourly:
#    0 * * * * /path/to/sync.sh

REPO="$HOME/ai-profile"
LOG="$REPO/.sync.log"

cd "$REPO" || exit 1
git pull -q --rebase origin main >/dev/null 2>&1
git add -A
if ! git diff --cached --quiet; then
  git commit -q -m "auto sync $(date '+%Y-%m-%d %H:%M')"
fi
if git push -q origin main >/dev/null 2>&1; then r=ok; else r="PUSH FAILED"; fi
echo "$(date '+%Y-%m-%d %H:%M') $r" >> "$LOG"
