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

map <buffer> q :q<Return>
