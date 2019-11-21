0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

DOTFILES_CONFIG=( "all" )

# Identify machine type(s).
for d in ${0:h}/detect/*.zsh
do
    source $d
done

# For each machine type, source environment and set up path.
for d in ${DOTFILES_CONFIG}
do
    if [[ -d ${0:h}/$d.env ]]; then
        for f in ${0:h}/$d.env/*.zsh
        do
            source $f
        done
    fi
    if [[ -d ${0:h}/$d.bin ]]; then
        path=("${0:h}/$d.bin" "${path[@]}")
    fi
done

export DOTFILES_SYSTEM=${(j/:/)DOTFILES_CONFIG}
