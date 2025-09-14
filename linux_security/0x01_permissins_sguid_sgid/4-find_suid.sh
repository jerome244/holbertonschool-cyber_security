 # SUID only
sudo find / -xdev -type f -perm -4000 -printf '%M %u %g %p\n' 2>/dev/null

# SUID and SGID (2000) together
sudo find / -xdev -type f \( -perm -4000 -o -perm -2000 \) -printf '%M %u %g %p\n' 2>/dev/null
