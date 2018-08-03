if isdirectory(expand(FlyVimBundleDir("tagbar")))
    nnoremap <silent> <localleader>t :TagbarToggle<cr>
    inoremap <silent> <localleader>t <esc> :TagbarToggle<cr>
    let g:tagbar_sort = 0
endif

