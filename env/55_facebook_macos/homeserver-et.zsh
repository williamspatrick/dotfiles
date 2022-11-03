#!/usr/bin/env zsh

function homeserver() {
    et -r 5901:5900 apwillia@$(home-server-hostname)
}
