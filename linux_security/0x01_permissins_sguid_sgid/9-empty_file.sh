#!/usr/bin/env bash
set -euo pipefail
path="${1:-.}"
find "$path" -type f -empty -print -exec chmod -v 0644 {} +
