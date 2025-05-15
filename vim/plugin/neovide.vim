if exists("g:neovide")
    if !(has('mac') || has('macunix') || has('gui_macvim'))
        let g:neovide_opacity = 0.85
    endif
    let g:neovide_scroll_animation_effect = 0.1
    let g:neovide_cursor_animation_length = 0.01

    autocmd FocusGained * checktime
endif
