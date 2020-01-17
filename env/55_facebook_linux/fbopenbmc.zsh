#!/usr/bin/env zsh

function fb-obmc() {
    if [ -z $1 ]; then
        echo "Missing machine." && return
    fi
    FB_MACHINE=$1

    wd fbopenbmc &&
    source openbmc-init-build-env $FB_MACHINE \
        ~/local/builds/build-$FB_MACHINE &&
    if ! grep -q "^SSTATE_DIR" conf/local.conf ; then
        echo "SSTATE_DIR ?= \"$HOME/local/builds/sstate-cache\"" >> \
            conf/local.conf
    fi
}

function fb-sign-obmc() {
    autograph_client.par openbmc --sign-key openbmc-fb0 \
        ~/local/builds/build-$FB_MACHINE/tmp/deploy/images/$FB_MACHINE/flash-$FB_MACHINE
}

