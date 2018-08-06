" 防止重复加载
if exists("b:did_make_ftplugin")
    finish
endif
let b:did_make_ftplugin = 1

setlocal noexpandtab
setlocal tabstop=8
setlocal shiftwidth=8
