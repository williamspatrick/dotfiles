" Enable file plugins
filetype plugin on
filetype plugin indent on

" Switch on syntax highlighting.
syntax on

" Enable file modeline parsing.
set modeline

" Set indentation options
set expandtab
set shiftwidth=4
set softtabstop=4

" Set backspace level, so it can delete new-lines
set backspace=2

" Use Solarized color scheme
set background=dark
colorscheme solarized

" Put line/column into the footer.
set ruler

" Enable mouse.
"set mouse=r

autocmd FileType mail set spell
autocmd FileType gitcommit set spell

" Emacs-style Home / End bindings
map <C-A> <Home>
map! <C-A> <Home>
map <C-E> <End>
map! <C-E> <End>

