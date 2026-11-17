#!/usr/bin/env zsh

if [[ -d ~/node_modules/.bin ]]; then
    if (( ${path[(I)$HOME/node_modules/.bin]} == 0 )); then
        path=($HOME/node_modules/.bin $path)
    fi
fi
if [[ -d ~/node_modules && :$NODE_PATH: != *:$HOME/node_modules:* ]]; then
    export NODE_PATH=$HOME/node_modules${NODE_PATH:+:$NODE_PATH}
fi
