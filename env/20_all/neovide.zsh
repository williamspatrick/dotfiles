#!/usr/bin/env zsh

alias nv="nvim"
if which neovide > /dev/null; then
    if [ -n "$GDMSESSION" ]; then
        alias nv="neovide"
    elif [[ $DOTFILES_SYSTEM == *macos* ]]; then
        alias nv="neovide --grid=80x50"
    fi
fi
