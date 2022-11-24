#!/usr/bin/env zsh

if which nvim > /dev/null; then
    export EDITOR="/usr/bin/nvim"
else
    export EDITOR="/usr/bin/vim"
fi
