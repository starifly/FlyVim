if isdirectory(expand(FlyVimBundleDir("tabular")))
    nnoremap <Leader>t= :Tabularize assignment<CR>
    vnoremap <Leader>t= :Tabularize assignment<CR>
    nnoremap <Leader>t: :Tabularize symbol<CR>
    vnoremap <Leader>t: :Tabularize symbol<CR>
    nnoremap <Leader>t, :Tabularize comma<CR>
    vnoremap <Leader>t, :Tabularize comma<CR>
endif
