#!/usr/bin/env zsh

if type npm > /dev/null; then
    if npm root > /dev/null; then
        export PATH="$(cd ~ && npm root)/.bin:$PATH"
        export NODE_PATH="$(cd ~ && npm root)"
    fi
fi
