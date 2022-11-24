if exists("g:neovide")
    let g:neovide_transparency = 0.85
    let g:neovide_scroll_animation_effect = 0.1
    let g:neovide_cursor_animation_length = 0.01

    autocmd FocusGained * checktime
endif
