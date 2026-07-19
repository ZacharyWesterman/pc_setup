#!/usr/bin/env bash
cd "${BASH_SOURCE%/*}" || exit 1

# Custom filesystem settings for various computer setups.

if [ -e "host/${HOSTNAME,,}.sh" ]; then
    ./"host/${HOSTNAME,,}.sh"
fi
