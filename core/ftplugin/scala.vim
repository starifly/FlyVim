" 防止重复加载
if exists('b:did_scala_ftplugin')
    finish
endif
let b:did_scala_ftplugin = 1

setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
