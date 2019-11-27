0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

source ${0:h}/dotfiles.lib.zsh

DOTFILES_CONFIG=( "all" )

# Identify machine type(s).
for d in ${0:h}/detect/*.zsh
do
    source $d
done

for d in ${0:h}/env/*
do
    if __dotfiles_check_machine $d ; then
        for f in $d/*.zsh
        do
            source $f
        done
    fi
done

for d in ${0:h}/bin/*
do
    if __dotfiles_check_machine $d ; then
        path=("$d" "${path[@]}")
    fi
done

export DOTFILES_SYSTEM=${(j/:/)DOTFILES_CONFIG}
