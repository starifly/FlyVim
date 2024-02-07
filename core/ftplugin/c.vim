" 防止重复加载
if exists('b:did_c_ftplugin')
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

let b:ale_fixers = ['clang-format']
let b:ale_c_clangformat_options = '-style=file:' . $FlyVim_Dir . '/tools/conf/.clang-format'

" Let the matchit plugin know what items can be matched.
if exists("loaded_matchit")
  let b:match_ignorecase=0
  let b:match_words .=
        \ ',\<if\>:\<else\>' .
        \ ',\<switch\>:\<case\>:\<default\>' .
        \ ',\<do\>:\<while\>'
endif

" C/C++ 文件使用 // 作为注释
setlocal commentstring=//\ %s
