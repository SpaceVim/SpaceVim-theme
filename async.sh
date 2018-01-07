#!/usr/bin/env bash

#=============================================================================
# install.sh --- bootstrap script for SpaceVim
# Copyright (c) 2016-2017 Shidong Wang & Contributors
# Author: Shidong Wang < wsdjeg at 163.com >
# URL: https://spacevim.org
# License: MIT license
#=============================================================================


# Reset
Color_off='\033[0m'       # Text Reset
Version='0.6.0'

# Regular Colors
Red='\033[0;31m'
Blue='\033[0;34m'
Green='\033[0;32m'

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "${Green}[✔]${Color_off} ${1}${2}"
}

info() {
    msg "${Blue}==>${Color_off} ${1}${2}"
}

spacevim-theme-download () {
    url="https://raw.githubusercontent.com/SpaceVim/SpaceVim/colors/$1"
    path="$PWD/$1"
    if [[ -f "$path" ]]
    then
        success "Downloaded $1"
    else
        info "Downloading $1"
        wget -q -O "$path" "$url"
        success "Downloaded $1"
    fi
}

spacevim-theme-download "colors/SpaceVim.vim"
spacevim-theme-download "autoload/SpaceVim/api.vim"
spacevim-theme-download "autoload/SpaceVim/api/color.vim"
spacevim-theme-download "autoload/SpaceVim/api/vim/highlight.vim"
