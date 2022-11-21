#!/usr/bin/env zsh

# Enable vim pathogen
zinit ice \
    atclone"mkdir -p ~/.vim/autoload ~/.vim/bundle && ln -sf ~/.zinit/plugins/tpope---vim-pathogen/autoload/pathogen.vim ~/.vim/autoload" atpull"%atclone" \
    pick"/dev/null" nocompile:!
zinit light tpope/vim-pathogen

## Enable pathogen modules
# vim-bitbake
zinit ice \
    atclone"mkdir -p ~/.vim/bundle && ln -sf ~/.zinit/plugins/kergoth---vim-bitbake ~/.vim/bundle/vim-bitbake" atpull"%atclone"\
    pick"/dev/null" nocompile:!
zinit light kergoth/vim-bitbake
# vim-gh-line
zinit ice \
    atclone"mkdir -p ~/.vim/bundle && ln -sf ~/.zinit/plugins/ruanyl---vim-gh-line ~/.vim/bundle/vim-gh-line" atpull"%atclone" \
    pick"/dev/null" nocompile:!
zinit light ruanyl/vim-gh-line


if [ ! -e ~/.vim/bundle/vim-williamspatrick ];
then
    ln -sf ~/.zinit/plugins/williamspatrick---dotfiles/vim ~/.vim/bundle/vim-williamspatrick
fi
