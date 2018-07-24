if isdirectory(expand(FlyVimBundleDir("vim-choosewin")))
    " 使用 ALT+E 来选择窗口
    nmap <m-e> <Plug>(choosewin)
endif
