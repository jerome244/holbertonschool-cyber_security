# users with a real shell
getent passwd | awk -F: '$7 ~ /(bash|zsh|fish)$/ {print $1 ":" $7}'

# “normal” users by UID (often >=1000 on Ubuntu)
getent passwd | awk -F: '$3>=1000 && $3<60000 {print $1 ":" $3 ":" $7}'

whoami                 # your login name
id                     # uid/gid + all groups
groups                 # your group memberships
sudo -l                # what sudo privileges you have
getent group sudo      # members of the 'sudo' group
sudo grep -R '' /etc/sudoers /etc/sudoers.d 2>/dev/null  # sudo rules (read-only)

sudo usermod -aG sudo <username>   # grant sudo
sudo deluser <username> sudo       # revoke sudo

who         # who is logged in
last        # recent login sessions
lastlog     # last login per user
