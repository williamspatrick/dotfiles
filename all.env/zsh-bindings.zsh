#!/usr/bin/env zsh

bindkey -e
bindkey "\e[3~" delete-char
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
