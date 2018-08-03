if isdirectory(expand(FlyVimBundleDir("tagbar")))
    nnoremap <silent> <leader>t :TagbarToggle<cr>
    inoremap <silent> <leader>t <esc> :TagbarToggle<cr>
    let g:tagbar_sort = 0
endif

