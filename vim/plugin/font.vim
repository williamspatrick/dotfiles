if has("gui_running") || exists("g:neovide")
    if has('mac') || has('macunix') || has('gui_macvim')
        set guifont=MesloLGSNerdFontCompleteM-Regular:h12
    elseif exists("g:neovide")
        set guifont=Liberation\ Mono:h12
    else
        set guifont=Liberation\ Mono\ Regular\ 12
    endif
endif
