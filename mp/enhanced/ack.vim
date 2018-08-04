if isdirectory(expand(FlyVimBundleDir("ack.vim")))
    if executable('rg')
        let g:ackprg = 'rg -H --no-heading --vimgrep'
    elseif executable('ag')
        let g:ackprg = 'ag --nogroup --nocolor --column'
    else
        let g:ackprg = 'grep -rn $* *'
    endif
    nnoremap <localleader>F :Ack!<space>
endif
