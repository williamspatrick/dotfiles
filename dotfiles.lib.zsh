function __dotfiles_check_machine() {

    local dir_name=$(basename $1 $2)
    local path_parts=(${(s/_/)dir_name})

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

function dotfiles_check_machine() {

    local dir_name=$(basename $1 $2)
    local path_parts=(${(s/_/)dir_name})
    local system_config=(${(s/:/)DOTFILES_SYSTEM})

    for p in $path_parts
    do
        if [[ "$p" = <-> ]]; then
            continue
        fi

        if ! ((system_config[(Ie)$p])); then
            return 1
        fi
    done

    return 0
}
