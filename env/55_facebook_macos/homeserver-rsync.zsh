#!/usr/bin/env zsh

function fbobmc-to-home() {
    wd fbopenbmc
    rsync --delete --delete-after -avr \
        . apwillia@192.168.1.32:local/sync/fbopenbmc
}

function fbobmc-from-home() {
    wd fbopenbmc
    rsync --delete --delete-after -avr \
        apwillia@192.168.1.32:local/sync/fbopenbmc/ .
}

function obmcsrc-to-home() {
    wd obmcsrc
    rsync --delete --delete-after -avr \
        . apwillia@192.168.1.32:local/sync/openbmc-sources
}

function obmcsrc-from-home() {
    wd obmcsrc
    rsync --delete --delete-after -avr \
        apwillia@192.168.1.32:local/sync/openbmc-sources/ .
}
