#!/usr/bin/env zsh

function fb-obmc() {
    if [ -n "$FB_MACHINE" ]; then
        echo "FB_MACHINE already defined as: $FB_MACHINE" && return
    fi
    if [ -z $1 ]; then
        echo "Missing machine." && return
    fi
    systemd-run --user --slice=bitbake \
        --pty --same-dir --wait --collect --service-type=exec \
        -E FB_MACHINE=$1 \
        -E BITBAKE_SOURCE_DIR=$(wd path fbopenbmc) \
        -E GDMSESSION="$GDMSESSION" \
        zsh -i -c "$(wd path dotfiles)/files/obmc-helpers/fb-obmc-setup"
}

if [ -n "$FB_MACHINE" ]; then
    function __bitbake_osc7501()
    {
        local _b64
        _b64=$(printf '%s' "$2" | base64 | tr -d '\n')
        printf '\033]7501;state=%s:app=bitbake:msg=%s\033\\' "$1" "$_b64" >&2
    }

    function bitbake-build()
    {
        __bitbake_osc7501 working "Building $FB_MACHINE-image"
        if nice bitbake $FB_MACHINE-image $*; then
            local STATUS="DONE"
            __bitbake_osc7501 done "$FB_MACHINE-image: DONE"
        else
            local STATUS="FAILED"
            __bitbake_osc7501 error "$FB_MACHINE-image: FAILED"
        fi
        notify-send -i "$(wd path obmcsrc)/docs/logo/OpenBMC-Logo.svg" \
            -a Bitbake "Bitbake" "$FB_MACHINE: $STATUS"
    }
fi

function fb-obmc-docker() {
    if [ -z $1 ]; then
        echo "Missing machine." && return
    fi

    docker run --rm -it -v $HOME:/workdir \
        --env FB_MACHINE=$1 \
        --env BITBAKE_SOURCE_DIR=$(wd path fbopenbmc | sed "s#$HOME#/workdir#") \
        crops/poky:alma-9 \
        --workdir=/workdir \
        /workdir/.zinit/plugins/williamspatrick---dotfiles/files/obmc-helpers/fb-poky-docker-launch $1
}

function fb-obmc-qemu() {
    QEMU_EXE=$(eval echo \
        "$(wd path obmcsrc)/qemu/build/qemu-system-aarch64")
    QEMU_MACH=${QEMU_MACHINE:-${FB_MACHINE}}

    MTD_OPTION="-drive if=mtd,format=raw,file="
    NIC_OPTION="-net nic -net user,hostfwd=::2222-:22,hostfwd=::8080-:8080,hostname=qemu"
    MISC_OPTION="-nographic"

    if [ -n "$QEMU_WITH_EMMC" ]; then
        SD_OPTION="-drive if=sd,index=2,format=raw,file="
    fi

    IMGPATH="$HOME/local/builds/build-$FB_MACHINE/tmp/deploy/images/$FB_MACHINE"

    IMGFILE=$(mktemp --dry-run)
    IMGFILE_EMMC=$(mktemp)

    cp $IMGPATH/flash-$FB_MACHINE $IMGFILE
    truncate -s ${QEMU_IMG_SIZE:-128M} $IMGFILE

    truncate -s 1G $IMGFILE_EMMC

    if [[ $QEMU_MACH != *-evb ]]; then
        QEMU_MACH="${QEMU_MACH}-bmc"
    fi

    ARGS="-M $QEMU_MACH $MTD_OPTION$IMGFILE"
    if [ -n "$QEMU_WITH_EMMC" ]; then
        ARGS="$ARGS $SD_OPTION$IMGFILE_EMMC"
    fi
    ARGS="$ARGS $NIC_OPTION $MISC_OPTION"

    $QEMU_EXE ${=ARGS} $*

    rm $IMGFILE $IMGFILE_EMMC
}
