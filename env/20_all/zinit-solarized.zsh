#!/usr/bin/env zsh

# Enable solarized dircolors.
zinit ice wait lucid atclone"dircolors dircolors.ansi-dark > dircolors-solarized.zsh" atpull"%atclone" pick"dircolors-solarized.zsh" nocompile:!
zinit light seebi/dircolors-solarized
alias ls='ls --color=auto'

# Enable solarized mutt.
zinit ice wait lucid pick"/dev/null" nocompile:!
zinit light altercation/mutt-colors-solarized
