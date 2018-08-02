if isdirectory(expand(FlyVimBundleDir("vim-grammarous")))
    noremap <localleader>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
    map <localleader>rr <Plug>(grammarous-open-info-window)
    map <localleader>rv <Plug>(grammarous-move-to-info-window)
    map <localleader>rs <Plug>(grammarous-reset)
    map <localleader>rx <Plug>(grammarous-close-info-window)
    map <localleader>rm <Plug>(grammarous-remove-error)
    map <localleader>rd <Plug>(grammarous-disable-rule)
    map <localleader>rn <Plug>(grammarous-move-to-next-error)
    map <localleader>rp <Plug>(grammarous-move-to-previous-error)
endif

