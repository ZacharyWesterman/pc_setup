#!/usr/bin/env bash

[ ! -e ~/.ssh/id_rsa ] && ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa
[ ! -e ~/.ssh/id_ed25519 ] && ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/id_ed25519

clear

echo 'THIS IS YOUR SSH PUBLIC KEY. ADD IT TO GITHUB NOW!'
echo '----------------------------------------------'
cat ~/.ssh/id_ed25519.pub
echo '----------------------------------------------'
cat "PRESS ENTER TO CONTINUE...."
read -r xx

clear
