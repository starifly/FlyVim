" recognize .bundles files
if has("autocmd")
    autocmd BufNewFile,BufRead *.bundles setf vim
endif
