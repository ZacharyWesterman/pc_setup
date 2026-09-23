#!/usr/bin/env bash

if [ ! -d /mnt/storage ]; then
    echo -e '\e[31mERROR\e[0m: /mnt/storage does not exist!'
    exit 1
fi

if [ -e /mnt/storage/.not-mounted ]; then
	echo -e '\e[31mERROR:\e[0m Data backup drive is not mounted!'
	exit 1
fi

set -e

cd /mnt/storage

rsync -a daedalus:/mnt/storage/data/ /mnt/storage/data/ "$@"
rsync -a daedalus:/mnt/storage/share/ /mnt/storage/share/ --delete "$@"
rsync -a daedalus:/var/airsonic/ /mnt/storage/var-airsonic --exclude "airsonic.log.*.gz" "$@"
rsync -a daedalus:/home/daedalus/* /mnt/storage/daedalus-home/ "$@"
