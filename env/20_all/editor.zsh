#!/usr/bin/env zsh

if which nvim > /dev/null; then
    export EDITOR="$(which nvim)"
else
    export EDITOR="/usr/bin/vim"
fi
