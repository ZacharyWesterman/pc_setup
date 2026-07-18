#!/usr/bin/env bash

clear

while true; do
    echo -n "INPUT THE IP TO DAEDALUS: "
    read -r ip_address
    if ! scp "daedalus@$ip_address:/mnt/storage/data/config/ssh_config ~/.ssh/config"; then
        echo "ERROR: Unable to connect!"
        continue
    fi

    chmod 664 ~/.ssh/config
    break
done

echo "SUCCESS"
