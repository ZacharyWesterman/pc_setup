#!/usr/bin/env bash

# Make sure path is set as I like.
./src/setpath.sh

# Set dark mode
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# Enable hot corners
gsettings set org.gnome.desktop.interface enable-hot-corners true

# 24hr format for clock
gsettings set org.gnome.desktop.interface clock-format '24h'

# Set default list of applications to show in side bar
gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop']"
