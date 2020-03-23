#!/usr/bin/env zsh

function fb-obmc() {
    if [ -z $1 ]; then
        echo "Missing machine." && return
    fi
    FB_MACHINE=$1

    wd fbopenbmc &&
    source openbmc-init-build-env $FB_MACHINE \
        ~/local/builds/build-$FB_MACHINE &&

    # Set up SSTATE_DIR
    if ! grep -q "^SSTATE_DIR" conf/local.conf ; then
        echo "SSTATE_DIR ?= \"$HOME/local/builds/sstate-cache\"" >> \
            conf/local.conf
    fi

    # Remove 'fb-only-network' on non-Facebook systems.
    if [[ $DOTFILES_SYSTEM != *facebook* ]]; then
        if ! grep -q "^INHERIT_remove" conf/local.conf ; then
            echo "INHERIT_remove = \"fb-only-network\"" >> \
                conf/local.conf
        fi
    fi
}