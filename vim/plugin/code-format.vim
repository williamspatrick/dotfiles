if !has("nvim")
    " Set ,cf to code-format options.
    autocmd FileType c,cpp nnoremap <Leader>cf :%!clang-format --assume-filename=%<CR>
    autocmd FileType python nnoremap <Leader>cf :%!black -q -l79 -<CR>
endif
