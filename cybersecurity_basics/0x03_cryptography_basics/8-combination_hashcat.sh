printf "summer\nwinter\n" > left.txt
printf "2023\n2024\n!\n" > right.txt
printf %s summer2024 | md5sum | awk '{print $1}' > md5.txt
hashcat -a 1 left.txt right.txt --stdout | head
hashcat -a 0 -m 0 md5.txt <(hashcat -a 1 left.txt right.txt --stdout)
hashcat -m 0 --show md5.txt
