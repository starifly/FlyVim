if isdirectory(expand(FlyVimBundleDir("vim-multiple-cursors")))
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_next_key='<C-l>'
    let g:multi_cursor_prev_key='<C-g>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
endif
