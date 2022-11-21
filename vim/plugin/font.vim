if has("gui_running") || exists("g:neovide")
    if has('mac') || has('macunix') || has('gui_macvim')
        set gfn=Menlo\ Regular:h12
    else
        set gfn=Liberation\ Mono\ Regular\ 12
    endif
endif
