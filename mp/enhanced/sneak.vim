if isdirectory(expand(FlyVimBundleDir("vim-sneak")))
    let g:sneak#s_next = 1 " clever-f-like s/S support
    let g:sneak#label = 1 " eazymotion-like s/S enhance
    let g:sneak#f_reset = 0 " continue to use ;, for sneak
    let g:sneak#t_reset = 0 " ^
    let g:sneak#absolute_dir = 1 " s; forwards only and S, backwards only

    aug Sneak_color
        au!
        autocmd VimEnter,ColorScheme * :hi Sneak guifg=black ctermfg=black guibg=#FFE53D ctermbg=003
    aug END

    " Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
    Plug 'sarrow104/simple-cmake.vim'
endif

