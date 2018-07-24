" 防止重复加载
if exists('b:did_text_ftplugin')
    finish
endif
let b:did_text_ftplugin = 1

let b:ale_linters = ['textlint', 'write-good', 'languagetool']

