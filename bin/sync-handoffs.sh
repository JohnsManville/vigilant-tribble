#!/bin/bash
# sync-handoffs.sh — mirror the Mac mini's handoff files into the
# vigilant-tribble repo so remote Claude sessions can read them.
# Run on the Mac mini. Safe to run repeatedly; commits only on change.
set -euo pipefail

REPO="${HANDOFF_SYNC_REPO:-$HOME/Claude/.handoff-sync}"
BRANCH="${HANDOFF_SYNC_BRANCH:-main}"

if [ ! -d "$REPO/.git" ]; then
  echo "error: $REPO is not a git clone of vigilant-tribble" >&2
  echo "run: git clone https://github.com/JohnsManville/vigilant-tribble.git $REPO" >&2
  exit 1
fi

cd "$REPO"
git fetch origin "$BRANCH" 2>/dev/null || true
git checkout -q "$BRANCH" 2>/dev/null || git checkout -qb "$BRANCH"
git pull --ff-only origin "$BRANCH" 2>/dev/null || true

# Text-only mirror: handoffs plus Roswell status notes. No binaries.
rsync -a --delete --prune-empty-dirs \
  --include='*/' --include='*.md' --include='*.txt' --exclude='*' \
  "$HOME/Claude/Handoffs/" Claude/Handoffs/
rsync -a --delete --prune-empty-dirs \
  --include='*/' --include='*.md' --include='*.txt' --exclude='*' \
  "$HOME/ClaudeBox/handoffs/" ClaudeBox/handoffs/
for d in legal build; do
  if [ -d "$HOME/Claude/Roswell/$d" ]; then
    mkdir -p "Claude/Roswell/$d"
    rsync -a --delete --prune-empty-dirs \
      --include='*/' --include='*.md' --include='*.txt' --exclude='*' \
      "$HOME/Claude/Roswell/$d/" "Claude/Roswell/$d/"
  fi
done

if git status --porcelain | grep -q .; then
  git add -A
  git commit -qm "handoff sync $(date '+%Y-%m-%d %H:%M') from $(hostname -s)"
  git push -q origin "$BRANCH"
  echo "synced and pushed"
else
  echo "no changes"
fi

# --- launchd template (save as ~/Library/LaunchAgents/com.jeff.handoff-sync.plist,
#     then: launchctl load ~/Library/LaunchAgents/com.jeff.handoff-sync.plist) ---
# <?xml version="1.0" encoding="UTF-8"?>
# <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
#   "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
# <plist version="1.0"><dict>
#   <key>Label</key><string>com.jeff.handoff-sync</string>
#   <key>ProgramArguments</key><array>
#     <string>/bin/bash</string>
#     <string>-lc</string>
#     <string>$HOME/Claude/.handoff-sync/bin/sync-handoffs.sh</string>
#   </array>
#   <key>StartInterval</key><integer>1800</integer>
#   <key>StandardOutPath</key><string>/tmp/handoff-sync.log</string>
#   <key>StandardErrorPath</key><string>/tmp/handoff-sync.log</string>
# </dict></plist>
