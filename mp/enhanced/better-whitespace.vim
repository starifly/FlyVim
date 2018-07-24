if isdirectory(expand(FlyVimBundleDir("vim-better-whitespace")))
    let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
    autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace
endif
