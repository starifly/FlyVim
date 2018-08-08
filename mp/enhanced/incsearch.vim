if has('patch-8.0.1238')
            \   && isdirectory(expand(FlyVimBundleDir("vim-anzu")))
    map n <Plug>(anzu-n-with-echo)
    map N <Plug>(anzu-N-with-echo)
elseif !g:FlyVim.nvim
            \   && isdirectory(expand(FlyVimBundleDir("incsearch.vim")))
    " incsearch.vim has bug with GUI vim
    if !has('gui_running')
        map /  <Plug>(incsearch-forward)
        map ?  <Plug>(incsearch-backward)
        map g/ <Plug>(incsearch-stay)

        map z/ <Plug>(incsearch-fuzzyspell-/)
        map z? <Plug>(incsearch-fuzzyspell-?)
        map zg/ <Plug>(incsearch-fuzzyspell-stay)
    endif
endif
