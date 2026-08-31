#!/bin/bash
# sync-handoffs.sh — mirror this Mac's handoff files into the vigilant-tribble
# repo so remote Claude sessions can read them without filesystem access.
#
# Run it ON EACH MAC that produces handoffs (MacBook Pro AND Mac mini).
# Each machine writes into its own host-namespaced subtree
# (handoffs/<short-hostname>/...), so the two Macs never clobber each other
# and a consolidator can see both sets side by side.
#
# Safe to run repeatedly; commits only on change.
set -euo pipefail

REPO="${HANDOFF_SYNC_REPO:-$HOME/Claude/.handoff-sync}"
BRANCH="${HANDOFF_SYNC_BRANCH:-main}"
HOST="$(scutil --get ComputerName 2>/dev/null || hostname -s)"
HOST="$(echo "$HOST" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')"
DEST="handoffs/$HOST"

if [ ! -d "$REPO/.git" ]; then
  echo "error: $REPO is not a git clone of vigilant-tribble" >&2
  echo "run: git clone https://github.com/JohnsManville/vigilant-tribble.git $REPO" >&2
  exit 1
fi

cd "$REPO"
git fetch origin "$BRANCH" 2>/dev/null || true
git checkout -q "$BRANCH" 2>/dev/null || git checkout -qb "$BRANCH"
git pull --ff-only origin "$BRANCH" 2>/dev/null || true

# Text-only mirror: markdown + csv + txt. No PDFs, images, or scans.
copytree() { # src  destsubdir
  local src="$1" sub="$2"
  [ -d "$src" ] || return 0
  mkdir -p "$DEST/$sub"
  rsync -a --delete --prune-empty-dirs \
    --include='*/' --include='*.md' --include='*.txt' --include='*.csv' \
    --exclude='*' "$src/" "$DEST/$sub/"
}

copytree "$HOME/Claude/Handoffs"        "Claude/Handoffs"
copytree "$HOME/ClaudeBox/handoffs"     "ClaudeBox/handoffs"
copytree "$HOME/Claude/Roswell/legal"   "Claude/Roswell/legal"
copytree "$HOME/Claude/Roswell/build"   "Claude/Roswell/build"

# stamp so a reader knows how fresh each host's mirror is
date -u +"%Y-%m-%dT%H:%M:%SZ  $HOST  $(whoami)@$(hostname)" > "$DEST/.last-sync"

if git status --porcelain | grep -q .; then
  git add -A
  git commit -qm "handoff sync: $HOST $(date '+%Y-%m-%d %H:%M')"
  git push -q origin "$BRANCH"
  echo "synced $DEST and pushed"
else
  echo "no changes for $HOST"
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
#   <key>RunAtLoad</key><true/>
#   <key>StandardOutPath</key><string>/tmp/handoff-sync.log</string>
#   <key>StandardErrorPath</key><string>/tmp/handoff-sync.log</string>
# </dict></plist>
