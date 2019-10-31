#!/usr/bin/env zsh

if [[ `uname` == 'Linux' ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "linux")
fi
