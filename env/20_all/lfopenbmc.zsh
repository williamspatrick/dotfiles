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

function lf-obmc-apply() {
    local REPONAME=$(git remote get-url origin | sed "s#.*://[^/]*/##")
    local COMMIT=$(git rev-parse HEAD)

    local LFREPO=$(wd path lfopenbmc)
    local FILES=$(git -C "$LFREPO" grep -l "git://.*/$REPONAME")
    for f in $FILES; do
        sed -i "s/branch=[^;]*/nobranch=1/" "$LFREPO/$f"
        sed -i "s/SRCREV = .*/SRCREV = \"$COMMIT\"/" "$LFREPO/$f"
    done
}
