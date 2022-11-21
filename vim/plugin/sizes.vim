set cc=81

if has("gui_running") || exists("g:neovide")
    " Set DirDiff options.
    let g:DirDiffWindowSize=10

    " Set sizes.
    if &diff
        vertical resize 82
    endif
endif
