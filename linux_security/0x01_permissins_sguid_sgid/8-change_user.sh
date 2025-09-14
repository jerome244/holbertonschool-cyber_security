# create a test file as 'alice' in the shared dir (assuming alice is in group devs)
sudo -u alice bash -c 'echo hello > /srv/shared/demo.txt'
ls -l /srv/shared/demo.txt

# now change its owner from alice to root and show it
sudo find /srv/shared -type f -user alice -exec chown -v root {} +
ls -l /srv/shared/demo.txt



# Change all files owned by USER in PATH to alice:devs
sudo find PATH -type f -user USER -exec chown alice:devs {} +

# Dry run (see what would change)
sudo find PATH -type f -user USER -print | head


ls -l /srv/shared/demo.txt
stat -c '%U:%G %n' /srv/shared/demo.txt



chown NEWOWNER FILE → change file owner

chown NEWOWNER:NEWGROUP FILE → change owner and group

chgrp NEWGROUP FILE → change group only

-R on chown/chgrp → do it recursively