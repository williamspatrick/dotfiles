#!/usr/bin/env zsh

# oh-my-zsh plugins
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZP::sudo

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

