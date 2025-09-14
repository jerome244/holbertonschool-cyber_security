sudo find / -xdev -type f -perm -2000 -printf '%M %u %g %p\n' 2>/dev/null

sudo find / -xdev -type d -perm -2000 -printf '%M %u %g %p\n' 2>/dev/null

sudo find / -xdev -type f \( -perm -4000 -o -perm -2000 \) -printf '%M %u %g %p\n' 2>/dev/null
