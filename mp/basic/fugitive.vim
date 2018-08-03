if isdirectory(expand(FlyVimBundleDir("vim-fugitive")))
    nmap <leader>gs :Gstatus<CR>gg<c-n>
    nnoremap <Leader>df :Gdiff<CR>
endif
