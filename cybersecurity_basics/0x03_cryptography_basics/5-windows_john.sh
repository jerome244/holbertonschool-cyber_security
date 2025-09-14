#!/bin/bash
sudo snap install seclists
WORDLIST="$(find /snap/seclists -type f -iname rockyou.txt | head -n1)"
john --wordlist="$WORDLIST" --format=NT hashes.txt
john --show --format=NT hashes.txt
