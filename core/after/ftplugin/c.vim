" 防止重复加载
if exists("b:did_c_ftplugin")
    finish
endif
let b:did_c_ftplugin = 1

" for include
let b:ale_c_parse_makefile = 1

let b:ale_linters = ['gcc', 'cppcheck']
let b:ale_c_gcc_options = '-Wall -O2 -std=c99'

" 如果没有 gcc 只有 clang 时（FreeBSD）
if executable('gcc') == 0 && executable('clang')
    let b:ale_linters.c += ['clang']
endif

