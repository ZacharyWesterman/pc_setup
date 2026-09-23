#!/usr/bin/env bash

if grep "$HOSTNAME" config/helper_pc.txt &>/dev/null; then
    ./src/host/helper_pc.sh
    exit 0
fi

./src/setpath.sh

./src/daedalus.sh || exit 1
./src/ssh_key.sh || exit 1
./src/install_software.sh || exit 1
./src/mod_vscode.sh || exit 1
./src/download_repos.sh || exit 1
