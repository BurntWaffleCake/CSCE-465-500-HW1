#!/usr/bin/env bash
set -euo pipefail

# Resolve paths relative to this script's location, not the caller's cwd
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HW1_DIR="$(dirname "$SCRIPT_DIR")"
MARKER_DIR="$HW1_DIR/markers"
MARKER_FILE="$MARKER_DIR/marker.txt"

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 course-marker" >&2
    exit 1
fi

if [[ "$1" != "course-marker" ]]; then
    echo "Rejected: only the literal argument 'course-marker' is accepted." >&2
    exit 1
fi

mkdir -p "$MARKER_DIR"
printf 'course-marker created at %s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > "$MARKER_FILE"
echo "Marker created: $MARKER_FILE"
