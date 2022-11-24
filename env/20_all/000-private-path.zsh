#!/usr/bin/env zsh

NPM_PATH=""
if which npm > /dev/null; then
    NPM_PATH="$(npm bin):"
fi

export PATH=$HOME/.local/bin:$HOME/private/bin:$HOME/.cargo/bin:$NPM_PATH$PATH

unset NPM_PATH
