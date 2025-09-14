ps 1            # should say "systemd"
sudo systemctl enable --now apparmor
sudo aa-status



# Is AppArmor registered as an LSM?
cat /sys/kernel/security/lsm | grep -q apparmor && echo "AppArmor LSM: ON" || echo "AppArmor LSM: OFF"  

# Are profiles loaded? (works only if ON)
sudo aa-status
# If systemd is present:
systemctl is-enabled apparmor; systemctl is-active apparmor


aa-status                     # easiest: shows loaded profiles, or "filesystem is not mounted"
cat /sys/kernel/security/lsm  # should contain "apparmor" if the kernel enabled it
# on systemd systems:
systemctl is-enabled apparmor
systemctl is-active apparmor
# optional:
mount | grep apparmor         # shows apparmorfs if it’s active
