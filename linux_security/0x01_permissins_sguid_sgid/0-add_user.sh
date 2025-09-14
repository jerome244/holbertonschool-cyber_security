sudo useradd -m -s /bin/bash -G sudo alice
sudo passwd alice
id alice                    # see UID and groups (should include sudo)
getent passwd alice         # see shell and home    
ls -ld /home/alice          # confirm home exists   
sudo -i -u alice            # switch to alice’s shell
