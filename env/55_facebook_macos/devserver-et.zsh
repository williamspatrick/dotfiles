#!/usr/bin/env zsh

function devserver() {
    et -t 9999:9999 -x -c "tmux -CC attach" \
        patrickw3.sb:8080
}

function devserver-launch() {
    et -t 9999:9999 -x -c "tmux -CC" \
        patrickw3.sb:8080
}
