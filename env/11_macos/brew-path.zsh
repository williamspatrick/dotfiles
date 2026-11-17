#!/usr/bin/env zsh

if (( $+commands[brew] )); then
    eval "$(brew shellenv)"
fi
