#!/usr/bin/env zsh

VIM_PACK_DIR=~/.vim/pack/plugins/start
mkdir -p $VIM_PACK_DIR

## Enable modules
# vim-bitbake
zinit ice \
    atclone"ln -sf ~/.zinit/plugins/kergoth---vim-bitbake $VIM_PACK_DIR" \
    atpull"%atclone" pick"/dev/null" nocompile:!
zinit light kergoth/vim-bitbake
# vim-gh-line
zinit ice \
    atclone"ln -sf ~/.zinit/plugins/ruanyl---vim-gh-line $VIM_PACK_DIR" \
    atpull"%atclone" \
    pick"/dev/null" nocompile:!
zinit light ruanyl/vim-gh-line
# mesonic
zinit ice \
    atclone"ln -sf ~/.zinit/plugins/igankevich---mesonic $VIM_PACK_DIR" \
    atpull"%atclone" pick"/dev/null" nocompile:!
zinit light igankevich/mesonic
# solarized8
zinit ice \
    atclone"ln -sf ~/.zinit/plugins/lifepillar---vim-solarized8 $VIM_PACK_DIR" \
    atpull "%atclone" pick"/dev/null" nocompile:!
zinit light lifepillar/vim-solarized8
# packer.nvim
zinit ice \
    atclone"ln -sf ~/.zinit/plugins/wbthomason---packer.nvim $VIM_PACK_DIR" \
    atpull "%atclone" pick"/dev/null" nocompile:!
zinit light wbthomason/packer.nvim

if [ ! -e $VIM_PACK_DIR/vim-williamspatrick ];
then
    ln -sf ~/.zinit/plugins/williamspatrick---dotfiles/vim $VIM_PACK_DIR/vim-williamspatrick
fi

unset VIM_PACK_DIR
