#!/usr/bin/env zsh

function "lf-obmc"() {
    if [ -n "$LF_MACHINE" ]; then
        echo "LF_MACHINE already defined as: $LF_MACHINE" && return
    fi
    if [ -z $1 ]; then
        echo "Missing machine." && return
    fi
    systemd-run --user --slice=bitbake \
        --pty --same-dir --wait --collect --service-type=exec \
        -E LF_MACHINE=$1 \
        -E BITBAKE_SOURCE_DIR=$(wd path lfopenbmc) \
        -E OPENBMC_WORKSPACE=$(wd path obmcsrc) \
        -E GDMSESSION="$GDMSESSION" \
        zsh -i -c "$(wd path dotfiles)/files/obmc-helpers/lf-obmc-setup"
}

if [ -n "$LF_MACHINE" ]; then
    function bitbake-build()
    {
        if nice bitbake obmc-phosphor-image $*; then
            local STATUS="DONE"
        else
            local STATUS="FAILED"
        fi
        notify-send -i "$(wd path obmcsrc)/docs/logo/OpenBMC-Logo.svg" \
            -a Bitbake "Bitbake" "$LF_MACHINE: $STATUS"
    }
fi

function "lf-obmc-qemu"() {
    QEMU_EXE=$(eval echo \
        "$(wd path obmcsrc)/qemu/build/qemu-system-aarch64")
    QEMU_MACH=${QEMU_MACHINE:-${LF_MACHINE}}

    MTD_OPTION="-drive if=mtd,format=raw,file="
    NIC_OPTION="-net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2080-:80,hostfwd=:127.0.0.1:2443-:443,hostname=qemu"
    MISC_OPTION="-nographic"
    SD_OPTION="-drive if=sd,index=2,format=raw,file="

    IMGPATH="$HOME/local/builds/lf-build-$LF_MACHINE/tmp/deploy/images/$LF_MACHINE"

    IMGFILE=$(mktemp --dry-run)
    IMGFILE_EMMC=$(mktemp)

    if [ -e "$IMGPATH/flash-$LF_MACHINE" ]; then
        cp $IMGPATH/flash-$LF_MACHINE $IMGFILE
    elif [ -e "$IMGPATH/obmc-phosphor-image-$LF_MACHINE.ubi.mtd" ]; then
        cp $IMGPATH/obmc-phosphor-image-$LF_MACHINE.ubi.mtd $IMGFILE
    else
        echo "Unable to find a supported flash image for $LF_MACHINE."
        return
    fi
    truncate -s ${QEMU_IMG_SIZE:-128M} $IMGFILE

    truncate -s 1G $IMGFILE_EMMC

    if [[ $QEMU_MACH != *-evb ]]; then
        QEMU_MACH="${QEMU_MACH}-bmc"
    fi

    ARGS="-M $QEMU_MACH $MTD_OPTION$IMGFILE"
    if [[ $QEMU_MACH == *bletchley* ]]; then
        ARGS="$ARGS $SD_OPTION$IMGFILE_EMMC"
    fi
    ARGS="$ARGS $NIC_OPTION $MISC_OPTION"

    $QEMU_EXE ${=ARGS} $*

    rm $IMGFILE $IMGFILE_EMMC
}

function "lf-ut"() {
    REPO="$(git rev-parse --show-toplevel)"
    UT_PATH="$(wd path obmcsrc)/openbmc-build-scripts"

    UNIT_TEST_PKG="$(basename $REPO)" WORKSPACE="$(dirname $REPO)" \
        "$UT_PATH/run-unit-test-docker.sh"
}
