# Download zplugin if it doesn't exist.
if [[ ! -d ~/.zplugin ]] then
    mkdir ~/.zplugin
    git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
fi

# Load zplugin
source "$HOME/.zplugin/bin/zplugin.zsh"

zplugin ice compile'{detect/*.zsh,*.env/*.zsh}'
zplugin light williamspatrick/dotfiles

# oh-my-zsh plugins
zplugin ice svn pick"completion.zsh" multisrc"{history,git}.zsh"
zplugin snippet OMZ::lib
zplugin snippet OMZ::plugins/sudo/sudo.plugin.zsh

# Enable solarized dircolors.
zplugin ice atclone"dircolors dircolors.ansi-dark > dircolors-solarized.zsh" atpull"%atclone" pick"dircolors-solarized.zsh" nocompile:!
zplugin light seebi/dircolors-solarized
alias ls='ls --color=auto'

# Enable solarized vim.
zplugin ice atclone"mkdir -p ~/.vim/colors && ln -sf ~/.zplugin/plugins/altercation---vim-colors-solarized/colors/solarized.vim ~/.vim/colors/" pick"/dev/null" nocompile:!
zplugin light altercation/vim-colors-solarized

# Enable solarized mutt.
zplugin ice pick"/dev/null" nocompile:!
zplugin light altercation/mutt-colors-solarized

# Powerlevel9k/10K
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

# Enable vim pathogen
zplugin ice \
    atclone"mkdir -p ~/.vim/autoload ~/.vim/bundle && ln -sf ~/.zplugin/plugins/tpope---vim-pathogen/autoload/pathogen.vim ~/.vim/autoload" \
    pick"/dev/null" nocompile:!
zplugin light tpope/vim-pathogen
