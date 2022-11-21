set cc=81

if has("gui_running")
    " Set DirDiff options.
    let g:DirDiffWindowSize=10

    " Set sizes.
    if &diff
        set columns=165
        vertical resize 82
    else
        set columns=80
    endif
    set lines=60
endif
