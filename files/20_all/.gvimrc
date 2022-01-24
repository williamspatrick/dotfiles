" Enable Pathogen
execute pathogen#infect()

" Enable file plugins
filetype plugin on
filetype plugin indent on

" Switch on syntax highlighting.
syntax on

" Enable file modeline parsing.
set modeline

" Switch on search pattern highlighting.
set hlsearch

" Ignore white-space for diff.
set diffopt=iwhite

" Switch leader to ,
let mapleader=","

" Set indentation options
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
nnoremap <Leader>nm :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>
nnoremap <Leader>km :set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab<CR>
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

" Use Solarized color scheme
set background=dark
colorscheme solarized

" Remove icon bar.
unmenu ToolBar
unmenu! ToolBar

" Put line/column into the footer.
set ruler

" folding options
set foldlevel=1000 " start with folds open.
set foldmethod=syntax

" Set DirDiff options.
let g:DirDiffWindowSize=10

" Extra options based on file-type
autocmd FileType mail set spell
autocmd FileType gitcommit set spell
autocmd FileType markdown set spell
autocmd FileType python set foldmethod=indent
autocmd BufNewFile,BufRead Jenkinsfile setf groovy

" Set sizes.
if &diff
    set columns=165
    vertical resize 82
else
    set columns=80
endif
set lines=60

" Set ,cf to code-format options.
autocmd FileType c,cpp nnoremap <Leader>cf :%!clang-format --assume-filename=%<CR>
autocmd FileType python nnoremap <Leader>cf :%!black -q -l87 -<CR>

" Emacs-style Home / End bindings
map <C-A> <Home>
map! <C-A> <Home>
map <C-E> <End>
map! <C-E> <End>
map <C-F> <C-Right>
map! <C-F> <C-Right>
map <C-B> <C-Left>
map! <C-B> <C-Left>

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
