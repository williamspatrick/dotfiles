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
# solarized8
zinit ice \
    ver"neovim" \
    atclone"ln -sf ~/.zinit/plugins/lifepillar---vim-solarized8 $VIM_PACK_DIR" \
    atpull "%atclone" pick"/dev/null" nocompile:!
zinit light lifepillar/vim-solarized8
# lazy.nvim
zinit ice \
    atclone"ln -sf ~/.zinit/plugins/folke---lazy.nvim $VIM_PACK_DIR" \
    atpull "%atclone" pick"/dev/null" nocompile:!
zinit light folke/lazy.nvim

if [ ! -e $VIM_PACK_DIR/00-vim-williamspatrick ];
then
    ln -sf ~/.zinit/plugins/williamspatrick---dotfiles/vim $VIM_PACK_DIR/00-vim-williamspatrick
fi

unset VIM_PACK_DIR
