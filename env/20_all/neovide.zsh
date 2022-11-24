#!/usr/bin/env zsh

if which neovide > /dev/null; then
    if [ -n "$GDMSESSION" ]; then
        alias nv="neovide"
    else
        alias nv="nvim"
    fi
fi
