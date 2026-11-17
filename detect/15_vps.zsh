#!/usr/bin/env zsh

if [[ -r /etc/hostname ]]; then
    _detect_hostname=$(</etc/hostname)
elif (( $+commands[hostname] )); then
    _detect_hostname=$(hostname)
elif (( $+commands[hostnamectl] )); then
    _detect_hostname=$(hostnamectl hostname)
fi

if [[ $_detect_hostname == vps* ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "vps")
fi

unset _detect_hostname