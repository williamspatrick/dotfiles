#!/usr/bin/env zsh

if (( $+commands[tree] )); then
    tree() {
        if (( ${@[(I)--no-gitignore]} )); then
            command tree ${@:#--no-gitignore}
        else
            command tree --gitignore "$@"
        fi
    }
fi
