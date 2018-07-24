" 防止重复加载
if exists('b:did_java_ftplugin')
    finish
endif
let b:did_java_ftplugin = 1

let b:ale_linters = ['javac']

