if isdirectory(expand(FlyVimBundleDir("ctrlsf.vim")))
    " 设置 ctrlsf 使用 ag
    let g:ctrlsf_ackprg = 'ag'
    let g:ctrlsf_open_left = 0
    nmap <C-F>f <Plug>CtrlSFPrompt
    "vmap <C-F>f <Plug>CtrlSFVwordPath
    vmap <C-F>f <Plug>CtrlSFVwordExec
    nmap <C-F>n <Plug>CtrlSFCwordPath
    "nmap <C-F>p <Plug>CtrlSFPwordPath
    nnoremap <C-F>o :CtrlSFOpen<CR>
    nnoremap <C-F>t :CtrlSFToggle<CR>
    inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
    let g:ctrlsf_search_mode = 'async'  " vim >= 8.0
    " let g:ctrlsf_winsize = '40%'
endif
