#!/usr/bin/env zsh

if [[ $(uname) == 'Linux' ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "linux")
    if [ -e /etc/os-release ]; then
        local LINUX_OS_RELEASE_ID=$(grep "^ID=.*" /etc/os-release | sed 's/.*=//')
        case $LINUX_OS_RELEASE_ID in
            gentoo)
                DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "gentoo")
                ;;

            *)
                ;;
        esac
        unset LINUX_OS_RELEASE_ID
    fi
fi
