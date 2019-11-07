#!/usr/bin/env zsh

if (($DOTFILES_CONFIG[(Ie)macos])); then
    function devserver() {
        et -c "tmux -CC attach" -x patrickw3.sb.facebook.com:8080
    }
    function devserver-launch() {
        et -c "tmux -CC" -x patrickw3.sb.facebook.com:8080
    }
fi
