#!/usr/bin/env bash
set -e

# Set up symlink from workdir (real home) local.
ln -s /workdir/local "${HOME}"
mkdir /tmp/depmod && touch /tmp/depmod/depmod && chmod 755 /tmp/depmod/depmod
export PATH=${PATH}:/tmp/depmod

# shellcheck source=env/30_linux/fbopenbmc.zsh
source /workdir/.zinit/plugins/williamspatrick---dotfiles/env/30_linux/fbopenbmc.zsh

_fb-obmc "$1"
bash --rcfile <(alias || true)
