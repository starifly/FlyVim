" 防止重复加载
if exists('b:did_lisp_ftplugin')
    finish
endif
let b:did_lisp_ftplugin = 1

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
