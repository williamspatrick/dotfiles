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
    fi &&

    # Set up DL_DIR
    if ! grep -q "^DL_DIR" conf/local.conf ; then
        echo "DL_DIR ?= \"$HOME/local/builds/downloads\"" >> \
            conf/local.conf
    fi &&

    # Enable devtool link to sources directory, so existing checkouts are
    # reused.
    if [ ! -e workspace/sources ]; then
        devtool create-workspace
        ln -sf $(wd path obmcsrc) workspace/sources
    fi &&

    alias bitbake-build="bitbake obmc-phosphor-image"
}

function lf-obmc-qemu() {
    QEMU_EXE=$(eval echo \
        "$(wd path obmcsrc)/qemu/build/arm-softmmu/qemu-system-arm")
    QEMU_MACHINE=${QEMU_MACHINE:-${LF_MACHINE}}

    MTD_OPTION="-drive if=mtd,format=raw,file="
    NIC_OPTION="-net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2080-:80,hostfwd=:127.0.0.1:2443-:443,hostname=qemu"
    MISC_OPTION="-nographic"
    SD_OPTION="-drive if=sd,format=raw,file="

    IMGPATH="$HOME/local/builds/lf-build-$LF_MACHINE/tmp/deploy/images/$LF_MACHINE"

    IMGFILE=$(mktemp --dry-run)
    IMGFILE_EMMC=$(mktemp)

    cp $IMGPATH/flash-$LF_MACHINE $IMGFILE
    truncate -s 128M $IMGFILE

    truncate -s 1G $IMGFILE_EMMC

    ARGS="-M $QEMU_MACHINE-bmc $MTD_OPTION$IMGFILE"
    ARGS="$ARGS $SD_OPTION$IMGFILE_EMMC"
    ARGS="$ARGS $NIC_OPTION $MISC_OPTION"

    $QEMU_EXE ${=ARGS}

    rm $IMGFILE $IMGFILE_EMMC
}
