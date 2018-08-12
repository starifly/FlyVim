" 防止重复加载
if exists('b:did_help_ftplugin')
    finish
endif
let b:did_help_ftplugin = 1

function! CloseHelpFilesWithQ() abort
    if !&modifiable
        :q!
    else
        call feedkeys('q', 'n')
    endif
endfunction

" Open links with enter
nnoremap <buffer> <CR> <C-]>

" Jump back with backspace
nnoremap <buffer> <BS> <C-T>


" Quit help windows by just pressing q
nnoremap <buffer> <silent> q :call CloseHelpFilesWithQ()<CR>
