if isdirectory(expand(FlyVimBundleDir("vim-gutentags")))
    " need: pip install pygments
    " let $GTAGSLABEL = 'native-pygments'
    " let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

    " 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
    " let g:gutentags_project_root =  ['.root', '.svn', '.git', '.hg', '.project']	" ['.root']
    let g:gutentags_add_default_project_roots=0
    let g:gutentags_project_root =  ['.root']
    let g:gutentags_ctags_tagfile = '.tags'

    " 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " 默认禁用自动生成
    let g:gutentags_modules = []

    " 如果有 ctags 可执行就允许动态生成 ctags 文件
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    " 如果有 gtags 可执行就允许动态生成 gtags 数据库
    if executable('gtags') && executable('gtags-cscope')
        let g:gutentags_modules += ['gtags_cscope']
    endif

    " 设置 ctags 的参数
    let g:gutentags_ctags_extra_args = []
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 使用 universal-ctags 的话需要下面这行，请反注释
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁止 gutentags 自动链接 gtags 数据库
    let g:gutentags_auto_add_gtags_cscope = 0

    " manually update tags, or open buffer will be stuck
    let g:gutentags_generate_on_missing = 0
    let g:gutentags_generate_on_new = 0
    let g:gutentags_generate_on_write = 1
    nnoremap <leader>tg :GutentagsUpdate<CR>

    " let g:gutentags_plus_nomap = 1
    " noremap <silent> <leader>cs :GscopeFind s <C-R><C-W><cr>
    " noremap <silent> <leader>cg :GscopeFind g <C-R><C-W><cr>
    " noremap <silent> <leader>cc :GscopeFind c <C-R><C-W><cr>
    " noremap <silent> <leader>ct :GscopeFind t <C-R><C-W><cr>
    " noremap <silent> <leader>ce :GscopeFind e <C-R><C-W><cr>
    " noremap <silent> <leader>cf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
    " noremap <silent> <leader>ci :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
    " noremap <silent> <leader>cd :GscopeFind d <C-R><C-W><cr>
    " noremap <silent> <leader>ca :GscopeFind a <C-R><C-W><cr>
endif
