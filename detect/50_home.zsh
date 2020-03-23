#!/usr/bin/env zsh

if [[ `whoami` == "apwillia" ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "home")
fi
