# Download zinit if it doesn't exist.
if [[ ! -d ~/.zinit ]] then
    mkdir ~/.zinit
    git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

# Load zinit
source "$HOME/.zinit/bin/zinit.zsh"

zinit ice compile'{detect/*.zsh,*.env/*.zsh}'
zinit light williamspatrick/dotfiles

# Load iterm2 imgcat (useful on remote Linux servers too)
#zinit ice svn pick="imgcat"
#zinit snippet --command \
#    https://github.com/gnachman/iterm2-website/trunk/source/utilities/

# Finish zinit / auto-complete
autoload -Uz compinit
compinit
zinit cdreplay -q
