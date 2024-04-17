#!/usr/bin/env zsh

function fbobmc-to-dev() {
    wd fbopenbmc
    rsync --delete --delete-after -avr --progress . \
        patrickw3.sb.facebook.com:local/sync/fbopenbmc
}

function fbobmc-from-dev() {
    wd fbopenbmc
    rsync --delete --delete-after -avr --progress \
        patrickw3.sb.facebook.com:local/sync/fbopenbmc/ .
}
