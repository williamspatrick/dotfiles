#!/usr/bin/env zsh

function home-server-hostname() {
    if ifconfig -X en | grep "inet 192.168.1.132" > /dev/null ; then
        echo "192.168.1.32"
    else
        echo "home-server"
    fi
}

function fbobmc-to-home() {
    wd fbopenbmc
    rsync --delete --delete-after -avr \
        . apwillia@$(home-server-hostname):local/sync/fbopenbmc
}

function fbobmc-from-home() {
    wd fbopenbmc
    rsync --delete --delete-after -avr \
        apwillia@$(home-server-hostname):local/sync/fbopenbmc/ .
}

function obmcsrc-to-home() {
    wd obmcsrc
    rsync --delete --delete-after -avr \
        . apwillia@$(home-server-hostname):local/sync/openbmc-sources
}

function obmcsrc-from-home() {
    wd obmcsrc
    rsync --delete --delete-after -avr \
        apwillia@$(home-server-hostname):local/sync/openbmc-sources/ .
}
