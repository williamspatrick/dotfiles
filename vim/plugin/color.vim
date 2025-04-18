" Use Solarized color scheme
set background=dark
colorscheme solarized8
highlight NormalFloat guibg=NONE

if !has("gui_running") && !exists("g:neovide")
    set termguicolors
endif
