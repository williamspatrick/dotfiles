#!/usr/bin/env zsh

if (($DOTFILES_CONFIG[(Ie)macos])); then
    function devserver() {
        et -f -t 9999:9999 -x -c "tmux -CC attach" \
            patrickw3.sb.facebook.com:8080
    }
    function devserver-launch() {
        et -f -t 9999:9999 -x -c "tmux -CC" \
            patrickw3.sb.facebook.com:8080
    }
fi
