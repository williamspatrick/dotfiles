" Extra options based on file-type
autocmd FileType mail set spell
autocmd FileType gitcommit set spell | set tw=72 | set cc=+1
autocmd FileType markdown set spell
autocmd FileType python set foldmethod=indent
autocmd BufNewFile,BufRead Jenkinsfile setf groovy
