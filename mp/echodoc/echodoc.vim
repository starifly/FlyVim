if isdirectory(expand(FlyVimBundleDir("echodoc.vim")))
    set noshowmode
    let g:echodoc#enable_at_startup = 1
endif
