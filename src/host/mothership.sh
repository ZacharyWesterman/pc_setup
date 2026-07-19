#!/usr/bin/env bash

# Mothership loads documents and such via sshfs
# As such, we need direct access to Daedalus
echo "ATTEMPTING TO SEND SSH KEYS TO DAEDALUS..."
ssh-copy-id daedalus

# Create the directory and set correct ownership
sudo mkdir -p /mnt/storage
sudo chown "$USER:$USER" /mnt/storage

# Create the mount (systemd) file and enable it
cp ../config/mothership_storage.mount ~/.config/systemd/user/
systemctl --user enable mothership_storage.mount
systemctl --user start mothership_storage.mount

for i in {Documents,Music,Pictures,Videos}; do
    rm -rf ~/"$i"
    ln -s "/mnt/storage/$i" ~/"$i"
done
