if isdirectory(expand(FlyVimBundleDir("vim-floaterm")))
    nnoremap   <silent>   <F3>   :FloatermToggle<CR>
    tnoremap   <silent>   <F3>   <C-\><C-n>:FloatermToggle<CR>
endif

