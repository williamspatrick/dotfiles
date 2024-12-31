#!/usr/bin/env zsh

if type nvim > /dev/null; then
    export EDITOR="$(which nvim)"
else
    export EDITOR="/usr/bin/vim"
fi
