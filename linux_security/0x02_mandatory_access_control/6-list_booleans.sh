sudo aa-status
cat /sys/module/apparmor/parameters/enabled   # "Y" or "enforcing"/"complain", or file missing = not loaded
systemctl status apparmor 2>/dev/null

sudo aa-status                      # shows profiles in enforce/complain
sudo aa-complain /usr/sbin/nginx    # put a profile in learning (complain) mode
sudo aa-enforce  /usr/sbin/nginx    # back to enforcing
sudo aa-disable  /usr/sbin/nginx    # disable a profile (rarely recommended)
