#!/usr/bin/env zsh

if [[ $(uname) == "Darwin" ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "macos")
fi
