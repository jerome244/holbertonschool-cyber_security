#!/bin/bash
printf '%s %s' "$2" "$1" | sha256sum | cut -d' ' -f1
