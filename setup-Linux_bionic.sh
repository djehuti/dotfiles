#!/bin/bash

# Generate an SSH key?

# Install packages

sudo apt-get install -y \
    zsh zsh-doc \
    ansible \
    gnome-tweaks gnome-shell-extensions gconf-editor \
    evolution

WebDeb() {
    if [[ "$#" -ne 2 ]]; then
       echo "WebDeb url basename"
    fi
    local tempdir=/tmp/linux-setup-$$"
    mkdir "${tempdir}"
    local package_url="$1"
    local package_basename="$2"
    curl -o "${package_url}" "${tempdir}/${local_package_basename}"
    echo sudo dpkg -i "${tempdir}/${local_package_basename}""
}

# Install a few things from other sources
WebDeb 

# Install AppImageLauncher

# Install AppImages

# Install Fonts
