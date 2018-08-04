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

if executable('rg')
    let &grepprg = 'rg -H --no-heading --vimgrep'
elseif executable('ag')
    let &grepprg = 'ag --nogroup --nocolor --column'
else
    let &grepprg = 'grep -rn $* *'
endif
command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen
