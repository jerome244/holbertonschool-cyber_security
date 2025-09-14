#!/usr/bin/env bash
set -euo pipefail
path="${1:-.}"
find "$path" -type f -empty -print -exec chmod -v 0644 {} +


#Fedora/RHEL/CentOS: SELinux is on by default (enforcing).

#Ubuntu & WSL: typically use AppArmor instead; your output “SELinux status: disabled” is normal.
