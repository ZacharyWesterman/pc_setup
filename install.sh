#!/usr/bin/env bash

./src/daedalus.sh || exit 1
./src/ssh_key.sh || exit 1
./src/install_software.sh || exit 1
./src/mod_vscode.sh || exit 1
./src/download_repos.sh || exit 1
