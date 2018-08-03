if isdirectory(expand(FlyVimBundleDir("tagbar")))
    nnoremap <F4> :TagbarToggle<cr>
    inoremap <F4> <esc> :TagbarToggle<cr>
    let g:tagbar_sort = 0
endif

