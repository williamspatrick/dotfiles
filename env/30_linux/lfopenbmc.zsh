#!/usr/bin/env zsh

function lf-obmc() {
    if [ -z $1 ]; then
        echo "Missing machine." && return
    fi
    LF_MACHINE=$1

    wd lfopenbmc &&
    source ./setup $LF_MACHINE \
        ~/local/builds/lf-build-$LF_MACHINE &&

    # Set up SSTATE_DIR
    if ! grep -q "^SSTATE_DIR" conf/local.conf ; then
        echo "SSTATE_DIR ?= \"$HOME/local/builds/sstate-cache\"" >> \
            conf/local.conf
        echo "INHERIT += \"uninative\"" >> conf/local.conf
    fi

    # Set up DL_DIR
    if ! grep -q "^DL_DIR" conf/local.conf ; then
        echo "DL_DIR ?= \"$HOME/local/builds/downloads\"" >> \
            conf/local.conf
    fi

    # Enable devtool link to sources directory, so existing checkouts are
    # reused.
    if [ ! -e workspace/sources ]; then
        devtool create-workspace
        ln -s $(wd path obmcsrc) workspace/sources
    fi

    alias bitbake-build="bitbake obmc-phosphor-image"
}
