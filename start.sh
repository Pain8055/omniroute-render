#!/bin/bash
set -e

if [ -n "$GITHUB_PAT" ]; then
  echo "Restoring OmniRoute config from private repo..."
  rm -rf "$HOME/.omniroute"
  git clone --depth 1 "https://${GITHUB_PAT}@github.com/Pain8055/omniroute-config.git" "$HOME/.omniroute"
  rm -rf "$HOME/.omniroute/.git"
  echo "Config restored."
else
  echo "No GITHUB_PAT set — starting with empty config."
  mkdir -p "$HOME/.omniroute"
fi

exec npx omniroute serve --port "$PORT" --no-open
