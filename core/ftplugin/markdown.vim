" 防止重复加载
if exists('b:did_markdown_ftplugin')
    finish
endif
let b:did_markdown_ftplugin = 1

setlocal wrap

let b:delimitMate_nesting_quotes = ['`']

let b:indentLine_enabled = 0

if has('gui_running')
    setlocal spell
endif
