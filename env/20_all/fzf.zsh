if which fzf > /dev/null; then

    if which fd > /dev/null; then
        FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
        FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
    elif which rg > /dev/null; then
        FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
        FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
    fi

    if which bat > /dev/null; then
        FZF_DEFAULT_OPTS="--ansi --preview='bat --color=always --line-range :200 {}' --preview-window='right,50%,<50(down:10)' --layout=reverse --height=50%"
        FZF_CTRL_R_OPTS="--no-preview"
        FZF_ALT_C_OPTS="--no-preview"
    fi

    source <(fzf --zsh)
fi
