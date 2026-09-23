#!/bin/env bash
set -e

clear

while [ -z "$FORGEJO_HTTP" ]; do
    echo -n "URL to Forgejo instance: "
    read -r FORGEJO_HTTP
    proto=${FORGEJO_HTTP%%://*}
    port=${FORGEJO_HTTP##*:}
    url=${FORGEJO_HTTP#*://}
    url=${url%:*}

    if [ -z "$port" ]; then
        [ "$proto" == https ] && port=443 || port=80
    fi

    if ! echo -e "GET /\n\n" | nc -N -w 10 "$url" "$port" &>/dev/null; then
        echo -e >&2 "\e[31mERROR\e[0m: Unable to verify connection to \`$FORGEJO_HTTP\`. Please check that the URL is correct and can be connected to from this machine!"
        FORGEJO_HTTP=''
    fi
done

while [ -z "$FORGEJO_UUID" ]; do
    echo -n "Forgejo runner UUID: "
    read -r FORGEJO_UUID
done

while [ -z "$FORGEJO_TOKEN" ]; do
    echo -n "Forgejo runner token: "
    read -r FORGEJO_TOKEN
done

echo

mkdir -p "$HOME/docker"
cp config/docker/forgejo-runner "$HOME/docker" -r
nproc=$(nproc)
find "$HOME/docker" -type f | while read -r i; do
    sed -i "s|\\\${FORGEJO_HTTP}|$FORGEJO_HTTP|g; s|\\\${UUID}|$FORGEJO_UUID|g; s|\\\${TOKEN}|$FORGEJO_TOKEN|g; s|\\\${NPROC}|$nproc|g" "$i"
done

sudo apt update
sudo apt install ssh vim fail2ban ffmpeg -y
sudo apt upgrade -y
sudo snap install docker

cd "$HOME/docker/forgejo-runner"
sudo docker compose up -d
