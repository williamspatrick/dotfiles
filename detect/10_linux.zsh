#!/usr/bin/env zsh

if [[ $OSTYPE == linux* ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "linux")
    if [[ -r /etc/os-release ]]; then
        local LINUX_OS_RELEASE_ID=${${$(</etc/os-release)##*$'\n'ID=}%%$'\n'*}
        LINUX_OS_RELEASE_ID=${${LINUX_OS_RELEASE_ID#\"}%\"}
        case $LINUX_OS_RELEASE_ID in
            gentoo)
                DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "gentoo")
                ;;
            arch)
                DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "arch")
                ;;

            *)
                ;;
        esac
        unset LINUX_OS_RELEASE_ID
    fi
fi
