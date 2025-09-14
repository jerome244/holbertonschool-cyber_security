# Make lists
printf 'summer\nwinter\n' > left.txt
printf '2023\n2024\n!\n' > right.txt

# Target hash: MD5(summer2024)
printf %s 'summer2024' | md5sum | awk '{print $1}' > md5.txt

# Crack with combinator (no pipe needed)
hashcat -m 0 -a 1 md5.txt left.txt right.txt
hashcat -m 0 --show md5.txt
