#!/usr/bin/env zsh

bindkey -e
bindkey "\e[3~" delete-char
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "^F" forward-word
bindkey "^B" backward-word
