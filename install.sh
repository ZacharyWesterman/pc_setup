#!/usr/bin/env bash

./src/install_apt.sh || exit 1
./src/mod_vscode.sh || exit 1
./src/download_repos.sh || exit 1
