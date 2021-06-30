# Download zinit if it doesn't exist.
if [[ ! -d ~/.zinit ]] then
    mkdir ~/.zinit
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
fi

# Load zinit
source "$HOME/.zinit/bin/zinit.zsh"

zinit ice compile'{detect/*.zsh,*.env/*.zsh}'
zinit light williamspatrick/dotfiles

# oh-my-zsh plugins
zinit ice svn pick"completion.zsh" multisrc"{history,git}.zsh"
zinit snippet OMZ::lib
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# Enable solarized dircolors.
zinit ice atclone"dircolors dircolors.ansi-dark > dircolors-solarized.zsh" atpull"%atclone" pick"dircolors-solarized.zsh" nocompile:!
zinit light seebi/dircolors-solarized
alias ls='ls --color=auto'

# Enable solarized vim.
zinit ice atclone"mkdir -p ~/.vim/colors && ln -sf ~/.zinit/plugins/altercation---vim-colors-solarized/colors/solarized.vim ~/.vim/colors/" atpull"%atclone" pick"/dev/null" nocompile:!
zinit light altercation/vim-colors-solarized

# Enable solarized mutt.
zinit ice pick"/dev/null" nocompile:!
zinit light altercation/mutt-colors-solarized

# Powerlevel9k/10K
zinit light romkatv/powerlevel10k

# Window titles
zstyle ':prezto:module:terminal' auto-title 'yes'
zinit snippet PZT::modules/terminal

# wd
WD_SKIP_EXPORT=1
zinit ice as"program" atload"wd() { source wd.sh }" \
    cp"_wd.sh -> _wd" \
    atpull'!git reset --hard' pick"wd.sh" wait lucid
zinit light mfaerevaag/wd

# Common completions
zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# Auto suggest
zinit ice wait lucid compile'{src/*.zsh,src/strategies/*}' atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=11"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1

# colored man pages
zinit ice wait lucid
zinit light ael-code/zsh-colored-man-pages

# offline gitignore.io templates
zinit ice wait lucid blockf
zinit light laggardkernel/git-ignore

# cd-gitroot
zinit ice wait lucid
zinit light mollifier/cd-gitroot

# Load iterm2 imgcat (useful on remote Linux servers too)
#zinit ice svn pick="imgcat"
#zinit snippet --command \
#    https://github.com/gnachman/iterm2-website/trunk/source/utilities/

# Enable vim pathogen
zinit ice \
    atclone"mkdir -p ~/.vim/autoload ~/.vim/bundle && ln -sf ~/.zinit/plugins/tpope---vim-pathogen/autoload/pathogen.vim ~/.vim/autoload" atpull"%atclone" \
    pick"/dev/null" nocompile:!
zinit light tpope/vim-pathogen

## Enable pathogen modules
# vim-bitbake
zinit ice \
    atclone"mkdir -p ~/.vim/bundle && ln -sf ~/.zinit/plugins/kergoth---vim-bitbake ~/.vim/bundle/vim-bitbake" atpull"%atclone"\
    pick"/dev/null" nocompile:!
zinit light kergoth/vim-bitbake

# Enable terraform autocomplete
zinit light jsporna/terraform-zsh-plugin

# Finish zinit / auto-complete
autoload -Uz compinit
compinit
zinit cdreplay -q
