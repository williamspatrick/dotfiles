#!/usr/bin/env zsh

alias nv="nvim"
if which neovide > /dev/null; then
    if [ -n "$GDMSESSION" ]; then
        alias nv="neovide"
    fi
fi
