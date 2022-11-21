if !has("gui_running") && !exists("g:neovide")
    " mouse-mode on/off.
    map <Leader>mm :set mouse="a"<CR>
    map <Leader>mo :set mouse=""<CR>
endif
