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
