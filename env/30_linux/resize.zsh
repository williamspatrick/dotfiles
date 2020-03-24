#!/usr/bin/env zsh

function __resize_to() {
    printf "\e[8;$1;$2;t"
}

function resize() {
    case $1 in
        mutt)
            __resize_to 65 80
            ;;
        irc)
            __resize_to 100 120
            ;;
        default)
            __resize_to 50 80
            ;;
        small)
            __resize_to 25 80
            ;;
        *)
            __resize_to $1 $2
            ;;
    esac
}
