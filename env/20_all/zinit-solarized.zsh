#!/usr/bin/env zsh

# Enable solarized dircolors.
zinit ice atclone"dircolors dircolors.ansi-dark > dircolors-solarized.zsh" atpull"%atclone" pick"dircolors-solarized.zsh" nocompile:!
zinit light seebi/dircolors-solarized
alias ls='ls --color=auto'

# Enable solarized vim.
zinit ice atclone"mkdir -p ~/.vim/colors && ln -sf ~/.zinit/plugins/lifepillar---vim-solarized8/colors/solarized8_high.vim ~/.vim/colors/" atpull"%atclone" pick"/dev/null" nocompile:!
zinit light lifepillar/vim-solarized8

# Enable solarized mutt.
zinit ice pick"/dev/null" nocompile:!
zinit light altercation/mutt-colors-solarized
