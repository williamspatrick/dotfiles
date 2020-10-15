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
    fi &&

    # Set up DL_DIR
    if ! grep -q "^DL_DIR" conf/local.conf ; then
        echo "DL_DIR ?= \"$HOME/local/builds/downloads\"" >> \
            conf/local.conf
    fi &&

    # Remove 'fb-only-network' on non-Facebook systems.
    if [[ $DOTFILES_SYSTEM != *facebook* ]]; then
        if ! grep -q "^INHERIT_remove" conf/local.conf ; then
            echo "INHERIT_remove = \"fb-only-network\"" >> \
                conf/local.conf
        fi
    fi &&

    alias bitbake-build="bitbake $FB_MACHINE-image"
}

function fb-obmc-docker() {
    if [ -z $1 ]; then
        echo "Missing machine." && return
    fi

    docker run --rm -it -v $HOME:/workdir crops/poky --workdir=/workdir \
        /workdir/.zinit/plugins/williamspatrick---dotfiles/files/poky_docker/launch.bash $1
}

function fb-obmc-qemu() {
    QEMU_EXE=$(eval echo \
        "$(wd path obmcsrc)/qemu/build/arm-softmmu/qemu-system-arm")
    QEMU_MACHINE=${QEMU_MACHINE:-${FB_MACHINE}}

    MTD_OPTION="-drive if=mtd,format=raw,file="
    NIC_OPTION="-net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostname=qemu"
    MISC_OPTION="-nographic"
    SD_OPTION="-drive if=sd,format=raw,file="

    IMGPATH="$HOME/local/builds/build-$FB_MACHINE/tmp/deploy/images/$FB_MACHINE"

    IMGFILE=$(mktemp --dry-run)
    IMGFILE_EMMC=$(mktemp)

    cp $IMGPATH/flash-$FB_MACHINE $IMGFILE
    truncate -s 128M $IMGFILE

    truncate -s 1G $IMGFILE_EMMC

    ARGS="-M $QEMU_MACHINE-bmc $MTD_OPTION$IMGFILE"
    ARGS="$ARGS $SD_OPTION$IMGFILE_EMMC"
    ARGS="$ARGS $NIC_OPTION $MISC_OPTION"

    $QEMU_EXE ${=ARGS}

    rm $IMGFILE $IMGFILE_EMMC
}
