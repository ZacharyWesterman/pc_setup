#!/usr/bin/env bash
cd "${BASH_SOURCE%/*}" || exit 1

! dpkg -s code &>/dev/null && echo -e "\033[0;31mERROR: VSCode is not installed, so extensions were not installed for it.\033[0m" && exit 1

extensions=()
while read -r i; do
    extensions+=("--install-extension=$i")
done < ../config/vscode.txt
code "${extensions[@]}"
