if isdirectory(expand(FlyVimBundleDir("vim-startify")))
    " 默认不显示 startify
    let g:startify_disable_at_vimenter = 0
    let g:startify_session_dir = '~/.vim/session'
endif
