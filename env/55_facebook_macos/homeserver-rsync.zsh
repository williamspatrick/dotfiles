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
