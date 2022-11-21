" Enable Pathogen
execute pathogen#infect()

" Enable file plugins
filetype plugin on
filetype plugin indent on

" Switch on syntax highlighting.
syntax on

" Enable file modeline parsing.
set modeline

" Switch leader to ,
let mapleader=","

" Set indentation options
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
nnoremap <Leader>nm :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>
nnoremap <Leader>km :set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab<CR>
nnoremap <Leader>fm :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>
autocmd BufWritePre *.[CHchS] :%s/\s\+$//e
autocmd BufWritePre *.p[lmy] :%s/\s\+$//e
autocmd BufWritePre *.[ch]pp :%s/\s\+$//e
autocmd BufWritePre *.[ch]pp.in :%s/\s\+$//e
autocmd BufWritePre *.md :%s/\s\+$//e
autocmd BufWritePre *.mako :%s/\s\+$//e
autocmd BufWritePre *.yaml :%s/\s\+$//e
autocmd FileType c,cpp,python,perl,markdown,dot,groovy,yaml,sh,conf,dts,cmake,make,meson autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set backspace level, so it can delete new-lines
set backspace=2

" Set fold level to all open.
set foldlevel=100

" Use Solarized color scheme
set background=dark
colorscheme solarized

" Put line/column into the footer.
set ruler

" Enable mouse.
"set mouse=r

autocmd FileType mail set spell
autocmd FileType gitcommit set spell | set tw=72 | set cc=+1
autocmd FileType markdown set spell
autocmd FileType python set foldmethod=indent
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" Set sizes.
set cc=81

" Set ,cf to code-format options.
autocmd FileType c,cpp nnoremap <Leader>cf :%!clang-format --assume-filename=%<CR>
autocmd FileType python nnoremap <Leader>cf :%!black -q -l79 -<CR>

" Emacs-style Home / End bindings
map <C-A> <Home>
map! <C-A> <Home>
map <C-E> <End>
map! <C-E> <End>
map <C-F> <C-Right>
map! <C-F> <C-Right>
map <C-B> <C-Left>
map! <C-B> <C-Left>

" 'normal' copy/paste keys.
vmap <C-C> y
vmap <C-X> d
map <C-V> p

" mouse-mode on/off.
map <Leader>mm :set mouse="a"<CR>
map <Leader>mo :set mouse=""<CR>

" vim-gh-line config
let g:gh_github_domain = "openbmc.gerrit"
if has('mac') || has('macunix') || has('gui_macvim')
    let g:gh_open_command = 'unsetopt nomatch; fn() { echo "$@" | sed "s#ssh://openbmc.gerrit#https://github.com#" | xargs open }; fn '
else
    let g:gh_open_command = 'unsetopt nomatch; fn() { echo "$@" | sed "s#ssh://openbmc.gerrit#https://github.com#" | xargs xdg-open }; fn '
endif
let g:gh_cgit_url_pattern_sub = [
    \ ['.\+git.kernel.org/', 'https://git.kernel.org/' ],
    \ ['.\+git.yoctoproject.org/', 'https://git.yoctoproject.org/' ],
    \ ['.\+git.qemu.org/', 'https://git.qemu.org/' ],
\ ]
