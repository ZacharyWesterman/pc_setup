#!/usr/bin/env bash

# Make sure path is set as I like.
./src/setpath.sh

# Set dark mode
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# Enable hot corners
gsettings set org.gnome.desktop.interface enable-hot-corners true

# 24hr format for clock
gsettings set org.gnome.desktop.interface clock-format '24h'

# Don't show home folder on desktop
gsettings set org.gnome.shell.extensions.ding show-home false

# Show workspaces on all displays
gsettings set org.gnome.mutter workspaces-only-on-primary false

# Include apps from only current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Set default list of applications to show in side bar
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'code_code.desktop', 'obsidian_obsidian.desktop', 'noisetorch.desktop']"
