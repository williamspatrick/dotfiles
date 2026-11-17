#!/usr/bin/env zsh

if [[ $OSTYPE == darwin* ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "macos")
fi
