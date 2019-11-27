function __dotfiles_check_machine() {

    local dir_name=$(basename $1 $2)
    local path_parts=(${(s/_/)dir_name})

    local wrong_machine=0
    for p in $path_parts
    do
        if [[ "$p" = <-> ]]; then
            continue
        fi

        if ! (($DOTFILES_CONFIG[(Ie)$p])); then
            return 1
        fi
    done

    return 0
}
