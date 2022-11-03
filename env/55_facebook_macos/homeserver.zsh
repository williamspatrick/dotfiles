#!/usr/bin/env zsh

function home-server-hostname() {
    if ifconfig -X en | grep "inet 192.168.1.132" > /dev/null ; then
        echo "192.168.1.32"
    elif /Applications/Tailscale.app/Contents/MacOS/Tailscale status --json --self=true --peers=false \
        | grep "Online" | grep "true" > /dev/null ; then
        echo "heinlein.taila677.ts.net"
    else
        echo "home-server"
    fi
}
