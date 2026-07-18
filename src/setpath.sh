#!/usr/bin/env bash

grep '\.local/bin' <<< "$PATH" && exit 0

echo '
export PATH="$PATH:$HOME/.local/bin"
' >> ~/.bashrc

mkdir -p ~/.local/bin
