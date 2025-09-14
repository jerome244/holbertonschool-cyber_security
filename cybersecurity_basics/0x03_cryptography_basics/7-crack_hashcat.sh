printf "password\n123456\nqwerty\n" > mylist.txt
hashcat -m 0 -a 0 md5.txt mylist.txt
hashcat -m 0 --show md5.txt
