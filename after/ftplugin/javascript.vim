" 防止重复加载
if exists("b:did_javascript_ftplugin")
    finish
endif
let b:did_javascript_ftplugin = 1

" let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h:h')

" function! s:path(path)
"     let path = expand(s:home . '/' . a:path )
"     return substitute(path, '\\', '/', 'g')
" endfunc

" " 获取 eslint 的配置文件，在 .vim/tools/conf 下面
" function s:lintcfg(name)
"     let conf = s:path('tools/conf/')
"     let path1 = conf . a:name
"     let path2 = expand('~/.vim/linter/'. a:name)
"     if filereadable(path2)
"         return path2
"     endif
"     return shellescape(filereadable(path2)? path2 : path1)
" endfunc

" let b:ale_javascript_eslint_options = '--config='.s:lintcfg('.eslintrc.js')

let b:ale_linters = ['eslint']

