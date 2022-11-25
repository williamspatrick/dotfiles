#!/usr/bin/env zsh

if which npm > /dev/null; then
    export PATH="$(npm bin):$PATH"
fi
