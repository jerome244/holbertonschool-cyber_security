sudo grep -Ev '^\s*(#|$)' /etc/ssh/sshd_config
# or see the *effective* config:
sudo sshd -T | sort
