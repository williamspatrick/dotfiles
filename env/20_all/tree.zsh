#!/usr/bin/env zsh

if type tree > /dev/null; then
    tree() {
        if (( ${@[(I)--no-gitignore]} )); then
            command tree ${@:#--no-gitignore}
        else
            command tree --gitignore "$@"
        fi
    }
fi
