sudo find "${1:-/}" -xdev -type f \( -perm -4000 -o -perm -2000 \) -mtime -1 \
  -printf '%M %u %g %TY-%Tm-%Td %TH:%TM %p\n' 2>/dev/null


sudo find "${1:-/}" -xdev -type d -perm -2000 -mtime -1 \
  -printf '%M %u %g %TY-%Tm-%Td %TH:%TM %p\n' 2>/dev/null


# files changed suid or sgid in last 24 hours