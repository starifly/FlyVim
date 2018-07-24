" 防止重复加载
if exists("b:did_python_ftplugin")
    finish
endif
let b:did_python_ftplugin = 1

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

"sudo pip3 install yapf
if executable('yapf')
    nnoremap <buffer><leader>yf :0,$!yapf<CR>
    vnoremap <buffer><leader>yf :!yapf<CR>
endif

" let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h:h')

" function! s:path(path)
"     let path = expand(s:home . '/' . a:path )
"     return substitute(path, '\\', '/', 'g')
" endfunc

" " 获取 pylint, flake8 的配置文件，在 .vim/tools/conf 下面
" function s:lintcfg(name)
"     let conf = s:path('tools/conf/')
"     let path1 = conf . a:name
"     let path2 = expand('~/.vim/linter/'. a:name)
"     if filereadable(path2)
"         return path2
"     endif
"     return shellescape(filereadable(path2)? path2 : path1)
" endfunc

" " 设置 flake8/pylint 的参数
" let b:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
" let b:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
" let b:ale_python_pylint_options .= ' --disable=W'

" let b:ale_python_yapf_options = '--style='.s:lintcfg('yapf.cfg')

" noremap <buffer> <leader>ef :ALEFix<CR>
" let b:ale_linters = ['flake8', 'pylint']
" let b:ale_fixers = [
"             \   'add_blank_lines_for_python_control_statements',
"             \     'autopep8',
"             \   'isort',
"             \   'ale#fixers#generic_python#BreakUpLongLines',
"             \   'yapf',
"             \    'trim_whitespace',
"             \   'remove_trailing_lines',
"             \]

let b:ale_linters = ['flake8']
let b:ale_fixers = [
            \   'remove_trailing_lines',
            \   'isort',
            \   'yapf',
            \]
