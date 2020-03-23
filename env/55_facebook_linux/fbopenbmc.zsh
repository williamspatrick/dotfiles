#!/usr/bin/env zsh

function fb-sign-obmc() {
    autograph_client.par openbmc --sign-key openbmc-fb0 \
        ~/local/builds/build-$FB_MACHINE/tmp/deploy/images/$FB_MACHINE/flash-$FB_MACHINE
}
