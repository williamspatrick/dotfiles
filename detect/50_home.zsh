#!/usr/bin/env zsh

if [[ ${USER:-$(whoami)} == "apwillia" ]] && [[ -z ${DOTFILES_CONFIG[(r)vps]} ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "home")
fi
