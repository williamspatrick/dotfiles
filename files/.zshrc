SYSTEM_TYPE=`uname`

# Download zplugin if it doesn't exist.
if [[ ! -d ~/.zplugin ]] then
    mkdir ~/.zplugin
    git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
fi

## System-specific settings (Linux vs Darwin/MacOS)
if [[ $SYSTEM_TYPE == 'Linux' ]] then

    export PATH=/usr/local/bin:$PATH

    if [[ -f /.dockerenv ]] then
        SYSTEM_TYPE='Docker'
    fi

elif [[ $SYSTEM_TYPE == 'Darwin' ]] then

    export CLICOLOR=1

    export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"
    export PATH="$HOME/.brew/opt/findutils/libexec/gnubin:$PATH"
    export PATH="$HOME/.brew/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="$HOME/.brew/opt/gnu-getopt/bin:$PATH"
    export PATH="$HOME/.brew/opt/grep/libexec/gnubin:$PATH"
    export PATH="$HOME/.brew/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="$HOME/.brew/opt/gawk/libexec/gnubin:$PATH"

    clang-env()
    {
        export PATH="$HOME/.brew/opt/llvm/bin:$PATH"
        export CC="$HOME/.brew/opt/llvm/bin/clang"
        export CXX=${CC}++
    }

    fpath=($HOME/.brew/completions/zsh $fpath)
    #   /Users/patrickw3/.brew/opt/gnu-getopt/etc/bash_completion.d

fi

export PATH=$HOME/private/bin:$PATH
export EDITOR="/usr/bin/vim"

bindkey -e
bindkey "\e[3~" delete-char
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

# Load zplugin
source "$HOME/.zplugin/bin/zplugin.zsh"

zplugin load williamspatrick/dotfiles

# oh-my-zsh plugins
zplugin ice svn pick"completion.zsh" multisrc"{history,git}.zsh"
zplugin snippet OMZ::lib
zplugin snippet OMZ::plugins/sudo/sudo.plugin.zsh

# Enable solarized dircolors.
zplugin ice atclone"dircolors dircolors.ansi-dark > dircolors-solarized.zsh" atpull"%atclone" pick"dircolors-solarized.zsh" nocompile:!
zplugin load seebi/dircolors-solarized
alias ls='ls --color=auto'

# Enable solarized vim.
zplugin ice atclone"mkdir -p ~/.vim/colors && ln -sf ~/.zplugin/plugins/altercation---vim-colors-solarized/colors/solarized.vim ~/.vim/colors/" pick"/dev/null" nocompile:!
zplugin load altercation/vim-colors-solarized

# Powerlevel9k/10K
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs virtualenv vcs)
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
POWERLEVEL9K_SHORTEN_STRATEGY=default
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=".."
if [[ $SYSTEM_TYPE != 'Docker' ]] then
    POWERLEVEL9K_VCS_BACKENDS=(git hg)
else
    POWERLEVEL9K_VCS_BACKENDS=()
fi
DEFAULT_USER=patrickw3
zplugin light romkatv/powerlevel10k

# wd
WD_SKIP_EXPORT=1
zplugin ice as"program" atload"wd() { source wd.sh }" \
    cp"_wd.sh -> _wd" \
    atpull'!git reset --hard' pick"wd.sh" wait lucid
zplugin light mfaerevaag/wd

# Common completions
zplugin ice blockf atpull'zplugin creinstall -q .'
zplugin light zsh-users/zsh-completions

# Auto suggest
zplugin ice wait lucid compile'{src/*.zsh,src/strategies/*}' atload'_zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=11"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1

# colored man pages
zplugin ice wait lucid
zplugin light ael-code/zsh-colored-man-pages

# offline gitignore.io templates
zplugin ice wait lucid blockf
zplugin light laggardkernel/git-ignore

# cd-gitroot
zplugin ice wait lucid
zplugin light mollifier/cd-gitroot

autoload -Uz compinit
compinit
zplugin cdreplay -q
