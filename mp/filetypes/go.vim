if isdirectory(expand(FlyVimBundleDir("vim-go")))
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = "goimports"
    let g:go_list_type = "quickfix"

    " map :GoErrCheck<CR>
    " map :GoBuild<CR>
    " map :GoDoc<CR>
    " map :GoTest<CR>
    " map :GoInstall<CR>
    " map :GoRename<CR>
endif
