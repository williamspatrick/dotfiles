if !exists("g:neovide") && has("gui_running")
    if has('mac') || has('macunix') || has('gui_macvim')
        set guifont=FiraCode\ Nerd\ Font\ Mono:h12
    else
        set guifont=Fira\ Code\ Regular\ 12
    endif
endif
