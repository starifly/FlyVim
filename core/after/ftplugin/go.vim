" 防止重复加载
if exists('b:did_go_ftplugin')
    finish
endif
let b:did_go_ftplugin = 1

let b:ale_linters = ['go build', 'gofmt']

