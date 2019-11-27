#!/usr/bin/env zsh

DEFAULT_USER=patrickw3

# Remove 'git' status on devserver due to errors.
if (($DOTFILES_CONFIG[(Ie)linux])); then
    POWERLEVEL9K_VCS_BACKENDS=()
fi
