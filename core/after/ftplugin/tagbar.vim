" 防止重复加载
if exists('b:did_tagbar_ftplugin')
    finish
endif
let b:did_tagbar_ftplugin = 1
setlocal updatetime=20
