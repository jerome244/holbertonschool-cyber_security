# create the group
sudo addgroup devs

# add alice (you) to it
sudo usermod -aG devs alice
# re-login or run: newgrp devs

# make a shared directory (choose your path)
sudo mkdir -p /srv/shared

# set group ownership to devs
sudo chown :devs /srv/shared

# give group read/execute (or rwx) and setgid so new files inherit the group
sudo chmod 2775 /srv/shared
# (2 = setgid; 775 = rwx for owner/group, r-x for others)


# make the dir (you already did this)
sudo mkdir -p /srv/shared

# give the directory's group to 'devs'
sudo chown :devs /srv/shared

# grant group rwx and setgid so new files inherit group 'devs'
sudo chmod 2775 /srv/shared

getent group devs     # should list devs:x:1002:..., and include alice after relogin
id alice              # groups should include devs
ls -ld /srv/shared    # expect: drwxrwsr-x ... root devs /srv/shared
