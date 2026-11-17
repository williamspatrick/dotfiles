#!/usr/bin/env zsh

if [[ ${USER:-$(whoami)} == "patrickw3" ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "facebook")
    if [ -e /etc/ondemand-whoami ]; then
        DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "ondemand")
    fi
fi
