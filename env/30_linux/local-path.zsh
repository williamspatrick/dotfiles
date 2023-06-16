#!/usr/bin/env zsh

if ! [[ $PATH == */usr/local/bin* ]] ; then
    export PATH=/usr/local/bin:$PATH
fi
