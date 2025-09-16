# whois2csv.sh
#!/usr/bin/env bash
domain="$1"
if [[ -z "$domain" ]]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

whois "$domain" \
| awk -v IGNORECASE=1 -F': ' '/^(Registrant|Admin|Tech)[[:space:]]/ {
    gsub(/"/, "\"\"", $2); printf "\"%s\",\"%s\"\n", $1, $2
}' > "${domain}.csv"
