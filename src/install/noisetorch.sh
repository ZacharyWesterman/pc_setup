#!/usr/bin/env bash

# If already installed, skip installation.
which noisetorch &>/dev/null && exit 0

# Install noisetorch
wget https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz -O noisetorch.tgz
tar -C "$HOME" -h -xzf noisetorch.tgz
gtk-update-icon-cache

# Set required permissions
sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch
