if has("gui_running") || exists("g:neovide")
    if has('mac') || has('macunix') || has('gui_macvim')
        set guifont=FiraCode\ Nerd\ Font\ Mono:h12
    elseif exists("g:neovide")
        set guifont=Fira\ Code:h12
    else
        set guifont=Fira\ Code\ Regular\ 12
    endif
endif
