#!/usr/bin/env zsh

function gerrit-hook() {
    scp openbmc.gerrit:hooks/commit-msg \
        $(git rev-parse --show-toplevel)/.git/hooks/
}
function gerrit-origin() {
    local REPONAME=$(git rev-parse --show-toplevel | xargs basename)
    git config remote.origin.url ssh://openbmc.gerrit/openbmc/$REPONAME
}
function gerrit-maint() {
    $(wd path obmcsrc)/openbmc-tools/maintainers/obmc-gerrit reviewers $*
}
