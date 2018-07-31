" 防止重复加载
if exists("b:did_php_ftplugin")
    finish
endif
let b:did_php_ftplugin = 1

let b:delimitMate_matchpairs = "(:),[:],{:}"
