if isdirectory(expand(FlyVimBundleDir("gv.vim")))
    nnoremap <leader>g :GV<cr>
    nnoremap <leader>G :GV!<cr>
    nnoremap <leader>gg :GV?<cr>
endif
