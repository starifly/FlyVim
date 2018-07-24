" 防止重复加载
if exists("b:did_lua_ftplugin")
    finish
endif
let b:did_lua_ftplugin = 1

let b:ale_linters = ['luac']

