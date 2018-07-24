if isdirectory(expand(FlyVimBundleDir("undotree")))
    " let g:undotree_WindowLayout = 2
    nnoremap <localleader>u :UndotreeToggle<cr>
endif
