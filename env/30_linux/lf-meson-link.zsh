#!/usr/bin/env zsh

function lf-meson-link() {
    FILES=($(ls *.wrap | sed 's/\.wrap//'))

    # Get workspace path and resolve to absolute canonical path
    ws_path="$(realpath $(wd path obmcsrc))"
    # Get current directory as absolute physical path (resolves symlinks)
    current_dir="$(pwd -P)"

    for f in ${FILES[@]}
    do
        if ! grep -q "revision = HEAD" $f.wrap ; then
            echo "skipping $f: not a HEAD revision"
            continue
        fi

        realdir="$(realpath $ws_path/$f)"
        if [ ! -d $realdir ];
        then
            echo "skipping $f: does not exist"
            continue
        fi

        if [ -e $f ];
        then
            continue
        fi

        # Determine symlink target: relative if in workspace, absolute otherwise
        # Check if current_dir starts with ws_path (prefix match)
        case "$current_dir" in
            "$ws_path"|"$ws_path"/*)
                # Inside workspace: calculate relative path from current_dir to realdir
                link_target="$(realpath --relative-to="$current_dir" "$realdir")"
                ;;
            *)
                # Outside workspace: use absolute path
                link_target="$realdir"
                ;;
        esac

        ln -s "$link_target" "$f"
    done
}
