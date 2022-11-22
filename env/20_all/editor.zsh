#!/usr/bin/env zsh

if [ -e /usr/bin/nvim ]; then
    export EDITOR="/usr/bin/nvim"
else
    export EDITOR="/usr/bin/vim"
fi
