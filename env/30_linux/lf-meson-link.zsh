#!/usr/bin/env zsh

function lf-meson-link() {
    FILES=($(ls *.wrap | sed 's/\.wrap//'))
    for f in ${FILES[@]}
    do
        if ! grep -q "revision = HEAD" $f.wrap ; then
            echo "skipping $f: not a HEAD revision"
            continue
        fi

        realdir="$(realpath $(wd path obmcsrc)/$f)"
        if [ ! -d $realdir ];
        then
            echo "skipping $f: does not exist"
            continue
        fi

        if [ -e $f ];
        then
            continue
        fi
        ln -s $realdir $f
    done
}
