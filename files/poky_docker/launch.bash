#!/usr/bin/env bash
set -e

# Set up symlink from workdir (real home) local.
ln -s /workdir/local "${HOME}"
mkdir /tmp/depmod && touch /tmp/depmod/depmod && chmod 755 /tmp/depmod/depmod
export PATH=${PATH}:/tmp/depmod

function wd() {
    local DIR
    DIR="$( (grep "$1" /workdir/.warprc || true) | sed 's#.*:~#/workdir#')"
    cd "${DIR}" || exit
}

# shellcheck source=env/30_linux/fbopenbmc.zsh
source /workdir/.zinit/plugins/williamspatrick---dotfiles/env/30_linux/fbopenbmc.zsh

fb-obmc "$1"
bash --rcfile <(alias || true)
