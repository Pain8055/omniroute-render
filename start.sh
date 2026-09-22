#!/bin/bash
set -e

mkdir -p "$HOME/.omniroute"

if [ -n "$OMNIROUTE_CONFIG_B64" ]; then
  echo "Restoring OmniRoute config from OMNIROUTE_CONFIG_B64..."
  echo "$OMNIROUTE_CONFIG_B64" | base64 -d > /tmp/omniroute-config.tar.gz
  tar -xzf /tmp/omniroute-config.tar.gz -C "$HOME/.omniroute"
  echo "Config restored."
else
  echo "No OMNIROUTE_CONFIG_B64 set — starting with empty config."
fi

exec npx omniroute serve --port "$PORT" --no-open
