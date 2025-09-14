#!/usr/bin/env bash
# usage: ./crack_md5.sh hashes.txt [wordlist]
set -euo pipefail

HASHES="${1:?Usage: $0 <hashes_file> [wordlist]}"
WORDLIST="${2:-$HOME/wordlists/rockyou.txt}"
JOHN="/snap/bin/john-the-ripper"

"$JOHN" --wordlist="$WORDLIST" --format=raw-md5 "$HASHES"
"$JOHN" --show --format=raw-md5 "$HASHES"



# run 

# chmod +x crack_md5.sh

# (if you don’t have rockyou yet)
# mkdir -p ~/wordlists
# curl -L -o ~/wordlists/rockyou.txt \
#  https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/rockyou.txt

# make a test hash file (MD5 of "password")
# printf %s 'password' | md5sum | awk '{print $1}' > hashes.txt

# run it
# ./crack_md5.sh hashes.txt                 # uses ~/wordlists/rockyou.txt
# or specify a different wordlist:
# ./crack_md5.sh hashes.txt ./mylist.txt
