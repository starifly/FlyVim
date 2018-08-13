" 防止重复加载
if exists('b:did_qf_ftplugin')
    finish
endif
let b:did_qf_ftplugin = 1

setlocal linebreak
setlocal nolist
setlocal wrap
setlocal nobuflisted
setlocal nonumber
setlocal norelativenumber

" map <buffer> q :q<Return>
nnoremap <buffer> q :ccl<cr>:lcl<cr>

" quickfix中按v/x分屏打开
nnoremap <buffer> v <C-w><Enter><C-w>L
nnoremap <buffer> x <C-w><Enter><C-w>K
