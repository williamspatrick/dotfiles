#!/usr/bin/env zsh

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
