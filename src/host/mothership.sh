#!/usr/bin/env bash

# Mothership loads documents and such via sshfs
# As such, we need direct access to Daedalus
echo "ATTEMPTING TO SEND SSH KEYS TO DAEDALUS..."
ssh-copy-id daedalus

# Create the directory and set correct ownership
sudo mkdir -p /mnt/storage
sudo chown "$USER:$USER" /mnt/storage

# Create the mount (systemd) file and enable it
mkdir -p ~/.config/systemd/user
cp ../config/mnt-storage.mount ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable mnt-storage.mount
systemctl --user start mnt-storage.mount

for i in {Documents,Music,Pictures,Videos}; do
    rm -rf ~/"$i"
    ln -s "/mnt/storage/$i" ~/"$i"
done
