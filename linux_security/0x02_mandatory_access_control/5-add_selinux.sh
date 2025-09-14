u="$1"                       # the username you wanted to pass
sudo adduser "$u"            # interactive: sets password, home, shell
sudo deluser "$u" sudo       # ensure they’re NOT an admin

# examples: allow docker or web file access ONLY if required
sudo usermod -aG docker "$u"          # optional
sudo usermod -aG www-data "$u"        # optional

# /etc/sudoers.d/$u
# Let them ONLY restart a service, nothing else:
$u ALL=(root) NOPASSWD: /usr/bin/systemctl restart myapp.service
