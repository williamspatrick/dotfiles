#!/usr/bin/env zsh

alias nv="nvim"
if (( $+commands[neovide] )); then
    if [ -n "$GDMSESSION" ]; then
        alias nv="neovide"
    elif [[ $DOTFILES_SYSTEM == *macos* ]]; then
        alias nv="neovide --grid=80x50"
    fi

    export NEOVIDE_FORK=1
fi
