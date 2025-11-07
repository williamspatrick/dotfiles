#!/usr/bin/env zsh

function lf-meson-link() {
    FILES=($(ls *.wrap | sed 's/\.wrap//'))
    for f in ${FILES[@]}
    do
        realpath "../../$f"
        if [ ! -d "../../$f" ];
        then
            continue
        fi
        ln -s ../../$f $f
    done
}
