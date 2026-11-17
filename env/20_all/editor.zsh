#!/usr/bin/env zsh

if (( $+commands[nvim] )); then
    export EDITOR=$commands[nvim]
else
    export EDITOR=/usr/bin/vim
fi
