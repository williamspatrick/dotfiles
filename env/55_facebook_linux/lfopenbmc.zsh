#!/usr/bin/env zsh

function lf-obmc() {
    if [ -z $1 ]; then
        echo "Missing machine." && return
    fi
    LF_MACHINE=$1

    wd lfopenbmc &&
    source ./setup $LF_MACHINE \
        ~/local/builds/lf-build-$LF_MACHINE &&
    if ! grep -q SSTATE_DIR conf/local.conf ; then
        echo "SSTATE_DIR ?= \"\$HOME/local/builds/sstate-cache\"" >> \
            conf/local.conf
    fi &&
    if [ ! -e workspace/sources ]; then
        devtool create-workspace
        ln -s $HOME/local/sync/openbmc-sources workspace/sources
    fi
}
