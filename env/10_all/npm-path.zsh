#!/usr/bin/env zsh

if which npm > /dev/null; then
    if npm bin > /dev/null; then
        export PATH="$(npm bin):$PATH"
        export NODE_PATH="$(npm root)"
    fi
fi
