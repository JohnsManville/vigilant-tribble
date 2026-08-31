#!/bin/bash
# sync-handoffs.sh — mirror the Macs' handoff files into the vigilant-tribble
# repo so remote Claude sessions can read them without filesystem access.
#
# DRIVER MODEL: run this ON THE MAC MINI (it has working GitHub write access
# and can `ssh mbp`). It mirrors BOTH machines:
#   - the mini's own ~/Claude + ~/ClaudeBox           -> handoffs/<mini-host>/
#   - the MacBook Pro's, pulled over `ssh mbp`         -> handoffs/<mbp-host>/
# The MacBook cannot push to the repo itself (deploy-key-only GitHub auth),
# so everything is driven from the mini. Each host lands in its own namespace
# so the two never clobber each other.
#
# Safe to run repeatedly; commits only on change.
set -euo pipefail

REPO="${HANDOFF_SYNC_REPO:-$HOME/Claude/.handoff-sync}"
BRANCH="${HANDOFF_SYNC_BRANCH:-main}"

# Remote Macs to also mirror, as "ssh-alias:namespace" pairs.
# Default: the MacBook Pro via its `mbp` ssh alias.
REMOTES=("${HANDOFF_SYNC_REMOTES:-mbp:jeffreys-macbook-pro}")

# lowercase, drop apostrophes (straight + curly), collapse other non-alnum to single dashes
host_slug() { printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | sed "s/'//g; s/$(printf '\xe2\x80\x99')//g" | tr -cs 'a-z0-9' '-' | sed 's/^-//; s/-$//'; }
LOCAL_HOST="$(host_slug "$(scutil --get ComputerName 2>/dev/null || hostname -s)")"

RSYNC_FILTER=(--include='*/' --include='*.md' --include='*.txt' --include='*.csv' --exclude='*')

if [ ! -d "$REPO/.git" ]; then
  echo "error: $REPO is not a git clone of vigilant-tribble" >&2
  echo "run: git clone git@github.com:JohnsManville/vigilant-tribble.git $REPO" >&2
  exit 1
fi

cd "$REPO"
git fetch origin "$BRANCH" 2>/dev/null || true
git checkout -q "$BRANCH" 2>/dev/null || git checkout -qb "$BRANCH"
git pull --ff-only origin "$BRANCH" 2>/dev/null || true

# --- local (the mini) ---
copy_local() { # src  destsubdir
  [ -d "$1" ] || return 0
  mkdir -p "handoffs/$LOCAL_HOST/$2"
  rsync -a --delete --prune-empty-dirs "${RSYNC_FILTER[@]}" "$1/" "handoffs/$LOCAL_HOST/$2/"
}
copy_local "$HOME/Claude/Handoffs"      "Claude/Handoffs"
copy_local "$HOME/ClaudeBox/handoffs"   "ClaudeBox/handoffs"
copy_local "$HOME/Claude/Roswell/legal" "Claude/Roswell/legal"
copy_local "$HOME/Claude/Roswell/build" "Claude/Roswell/build"

# Claude Code CLI home: config + plans + any handoff/state notes.
# Prune the bulky, non-handoff subdirs (raw transcripts, telemetry, caches).
CC_PRUNE=(--exclude='projects/' --exclude='telemetry/' --exclude='uploads/' \
  --exclude='backups/' --exclude='sessions/' --exclude='session-env/' \
  --exclude='tasks/' --exclude='plugins/' --exclude='skills/' \
  --exclude='scheduled-tasks/' --exclude='shell-snapshots/' --exclude='todos/')
if [ -d "$HOME/.claude" ]; then
  mkdir -p "handoffs/$LOCAL_HOST/ClaudeCode/dot-claude"
  rsync -a --delete --prune-empty-dirs "${CC_PRUNE[@]}" "${RSYNC_FILTER[@]}" \
    "$HOME/.claude/" "handoffs/$LOCAL_HOST/ClaudeCode/dot-claude/"
fi

date -u +"%Y-%m-%dT%H:%M:%SZ  $LOCAL_HOST  local" > "handoffs/$LOCAL_HOST/.last-sync"

# --- remotes (the MacBook Pro over ssh) ---
for pair in "${REMOTES[@]}"; do
  alias="${pair%%:*}"; ns="${pair##*:}"
  ssh -o BatchMode=yes -o ConnectTimeout=8 "$alias" 'true' 2>/dev/null || { echo "skip $ns ($alias unreachable)"; continue; }
  copy_remote() { # remote-src  destsubdir
    ssh -o BatchMode=yes "$alias" "test -d $1" 2>/dev/null || return 0
    mkdir -p "handoffs/$ns/$2"
    rsync -a --delete --prune-empty-dirs -e 'ssh -o BatchMode=yes' "${RSYNC_FILTER[@]}" "$alias:$1/" "handoffs/$ns/$2/"
  }
  copy_remote '~/Claude/Handoffs'      "Claude/Handoffs"
  copy_remote '~/ClaudeBox/handoffs'   "ClaudeBox/handoffs"
  copy_remote '~/Claude/Roswell/legal' "Claude/Roswell/legal"
  copy_remote '~/Claude/Roswell/build' "Claude/Roswell/build"
  if ssh -o BatchMode=yes "$alias" 'test -d ~/.claude' 2>/dev/null; then
    mkdir -p "handoffs/$ns/ClaudeCode/dot-claude"
    rsync -a --delete --prune-empty-dirs -e 'ssh -o BatchMode=yes' "${CC_PRUNE[@]}" "${RSYNC_FILTER[@]}" \
      "$alias:~/.claude/" "handoffs/$ns/ClaudeCode/dot-claude/"
  fi
  date -u +"%Y-%m-%dT%H:%M:%SZ  $ns  via $alias" > "handoffs/$ns/.last-sync"
done

if git status --porcelain | grep -q .; then
  git add -A
  git commit -qm "handoff sync $(date '+%Y-%m-%d %H:%M') from $LOCAL_HOST"
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
#     <string>/bin/bash</string><string>-lc</string>
#     <string>$HOME/Claude/.handoff-sync/bin/sync-handoffs.sh</string>
#   </array>
#   <key>StartInterval</key><integer>1800</integer>
#   <key>RunAtLoad</key><true/>
#   <key>StandardOutPath</key><string>/tmp/handoff-sync.log</string>
#   <key>StandardErrorPath</key><string>/tmp/handoff-sync.log</string>
# </dict></plist>
