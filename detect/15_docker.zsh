#!/usr/bin/env zsh

if [[ -f /.dockerenv ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "docker")
fi
