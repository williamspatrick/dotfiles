#!/usr/bin/env zsh

if which npm > /dev/null; then
    if npm root > /dev/null; then
        export PATH="$(npm root)/.bin:$PATH"
        export NODE_PATH="$(npm root)"
    fi
fi
