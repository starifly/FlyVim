" 防止重复加载
if exists('b:did_yaml_ftplugin')
    finish
endif
let b:did_yaml_ftplugin = 1

setlocal shiftwidth=2 softtabstop=2 expandtab
