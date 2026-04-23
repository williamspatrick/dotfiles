#!/usr/bin/env zsh

zinit ice nocompile:!
zinit light williamspatrick/openbmc-subproject-container

function "obmc-launch"() {
    ~/.zinit/plugins/williamspatrick---openbmc-subproject-container/launch $*
}
