#!/usr/bin/env zsh

if (($DOTFILES_CONFIG[(Ie)linux])); then
    if [ -z $SSH_AUTH_SOCK ]; then
        export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.socket
    fi
fi
