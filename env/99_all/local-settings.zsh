#!/usr/bin/env zsh

if [ -d "${HOME}/.local/zsh" ]; then
    for f in ${HOME}/.local/zsh/*.zsh
    do
        source $f
    done
fi
