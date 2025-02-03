#!/usr/bin/env bash
cd "${BASH_SOURCE%/*}" || exit 1

is_installed() {
    dpkg -s "$1" &>/dev/null
    return $?
}

names=()
urls=()
nonurls=()
load_config() {
    while read -r name url; do
        [ "$name" == '' ] && continue
        is_installed "$name" && continue

        if [ "$url" == '' ]; then
            nonurls+=("$name")
        else
            names+=("$name")
            urls+=("$url")
        fi
    done <apt.txt
}

install_apt_packages() {
    [ "${#nonurls[@]}" -eq 0 ] && return

    echo "Installing basic applications via package manager..."
    sudo apt install "${nonurls[@]}" -y || exit 1
}

failed_web_packages=()
success_web_packages=()
install_web_packages() {
    [ "${#urls[@]}" -eq 0 ] && return

    cd ~/Downloads || exit 1
    echo "Downloading extra applications from the web..."

    for i in "${urls[@]}"; do
        fname="$(basename "$i")"
        if ! wget "$i"; then
            failed_web_packages+=("$i")
        else
            success_web_packages+=("./$fname")
        fi
    done

    [ "${#success_web_packages[@]}" -gt 0 ] && sudo apt install "${success_web_packages[@]}" -y

    rm -f "${success_web_packages[@]}"

    cd "${BASH_SOURCE%/*}" || exit 1

    if [ "${#failed_web_packages[@]}" -gt 0 ]; then
        echo -e "\033[0;31mERROR: The following web packages could not be downloaded, and thus were not installed:\033[0m"
        for i in "${failed_web_packages[@]}"; do
            echo "    $i"
        done
        exit 1
    fi
}

# First update apt and upgrade any packages
sudo apt update
sudo apt upgrade -y

# Run simple installs
load_config
install_apt_packages
install_web_packages

# Install applications that are more manual
./install/mongodb.sh
./install/mullvad.sh

# Remove unneeded packages
sudo apt autoremove -y
