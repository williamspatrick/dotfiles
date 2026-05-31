#!/usr/bin/env zsh

if (( $+commands[hostnamectl] )); then
    _detect_hostname=$(hostnamectl hostname)
elif (( $+commands[hostname] )); then
    _detect_hostname=$(hostname)
elif [[ -f /etc/hostname ]]; then
    _detect_hostname=$(< /etc/hostname)
fi

if [[ $_detect_hostname == vps* ]]; then
    DOTFILES_CONFIG=("${DOTFILES_CONFIG[@]}" "vps")
fi

unset _detect_hostname