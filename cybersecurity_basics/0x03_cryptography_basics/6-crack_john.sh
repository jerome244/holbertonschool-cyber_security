# Make a test raw SHA-256 hash of 'password'
echo 5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8 > sha256.txt
dos2unix sha256.txt 2>/dev/null || true

# Use the wordlist from the seclists snap
WORDLIST="$(find /snap/seclists -type f -iname 'rockyou.txt' | head -n1)"

# Crack with the Snap john
/snap/bin/john-the-ripper --wordlist="$WORDLIST" --format=raw-sha256 sha256.txt
/snap/bin/john-the-ripper --show --format=raw-sha256 sha256.txt
