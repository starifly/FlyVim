" 防止重复加载
if exists('b:did_cpp_ftplugin')
    finish
endif
let b:did_cpp_ftplugin = 1

" for include
let b:ale_c_parse_makefile = 1

let b:ale_linters = ['gcc', 'cppcheck']
let b:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'

" 如果没有 gcc 只有 clang 时（FreeBSD）
if executable('gcc') == 0 && executable('clang')
    let b:ale_linters.cpp += ['clang']
endif

let b:ale_fixers = ['clang-format']
let g:ale_cpp_clangformat_options = '-style=file:' . $FlyVim_Dir . '/tools/conf/.clang-format'
