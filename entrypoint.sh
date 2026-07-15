#!/bin/bash
set -e

args=("serve")
args+=("--port" "${OPENCODE_PORT:-4096}")
args+=("--hostname" "${OPENCODE_HOST:-0.0.0.0}")

if [ -n "$OPENCODE_CONFIG" ]; then
    args+=("--config" "$OPENCODE_CONFIG")
fi

if [ -n "$OPENCODE_CORS" ]; then
    IFS=',' read -ra ORIGINS <<< "$OPENCODE_CORS"
    for origin in "${ORIGINS[@]}"; do
        args+=("--cors" "$origin")
    done
fi

exec opencode "${args[@]}"
