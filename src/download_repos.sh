#!/usr/bin/env bash
cd ~ || exit 1

! dpkg -s git &>/dev/null && echo -e "\033[0;31mERROR: Git is not installed, so repositories cannot be downloaded.\033[0m" && exit 1

[ -e repos ] || mkdir repos
cd repos || exit 1

git config --global user.name "Zachary Westerman"
git config --global user.email "westerman.zachary@gmail.com"

while read -r i; do
    [ ! -e "$i" ] && git clone "git@github.com:ZacharyWesterman/$i.git" --recurse-submodules
done < config/repos.txt
