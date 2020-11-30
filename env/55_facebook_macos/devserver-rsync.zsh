#!/usr/bin/env zsh

function fbobmc-to-dev() {
    wd fbopenbmc
    rsync --delete --delete-after -avr --progress . \
        patrickw3.sb:local/sync/fbopenbmc
}
