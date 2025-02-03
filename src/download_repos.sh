#!/usr/bin/env bash
cd ~ || exit 1

! dpkg -s git &>/dev/null && echo -e "\033[0;31mERROR: Git is not installed, so repositories cannot be downloaded.\033[0m" && exit 1
! dpkg -s wget &>/dev/null && echo -e "\033[0;31mERROR: wget is not installed, so repositories cannot be downloaded.\033[0m" && exit 1

[ -e repos ] || mkdir repos
cd repos || exit 1

wget https://raw.githubusercontent.com/ZacharyWesterman/bash-utils/refs/heads/main/bin/git-list-repos || exit 1
python3 git-list-repos ZacharyWesterman | while read -r i; do
    [ ! -e "$i" ] && git clone "git@github.com:ZacharyWesterman/$i.git" --recurse-submodules
done
rm git-list-repos -f
