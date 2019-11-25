#!/usr/bin/env zsh

if (($DOTFILES_CONFIG[(Ie)linux])); then

    function fb-obmc() {
        if [ -z $1 ]; then
            echo "Missing machine." && return
        fi
        FB_MACHINE=$1

        wd fbopenbmc &&
        source openbmc-init-build-env $FB_MACHINE \
            ~/local/builds/build-$FB_MACHINE &&
        if ! grep -q SSTATE_DIR conf/local.conf ; then
            echo "SSTATE_DIR ?= \"$HOME/local/builds/sstate-cache\"" >> \
                conf/local.conf
        fi
    }

fi
