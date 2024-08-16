#!/usr/bin/env zsh

function devserver() {
    x2ssh -et patrickw3.sb.facebook.com -c "tmux -CC attach"
    # et -t 9999:9999 -x -c "tmux -CC attach" \
    #    patrickw3.sb.facebook.com:8080
}

function devserver-launch() {
    x2ssh -et patrickw3.sb.facebook.com -c "tmux -CC"
    # et -t 9999:9999 -x -c "tmux -CC" \
    #    patrickw3.sb.facebook.com:8080
}
