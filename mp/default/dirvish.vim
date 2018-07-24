if isdirectory(expand(FlyVimBundleDir("vim-dirvish")))
    "----------------------------------------------------------------------
    " Dirvish 设置：自动排序并隐藏文件，同时定位到相关文件
    " 这个排序函数可以将目录排在前面，文件排在后面，并且按照字母顺序排序
    " 比默认的纯按照字母排序更友好点。
    "----------------------------------------------------------------------
    function! s:setup_dirvish()
        if &buftype != 'nofile' && &filetype != 'dirvish'
            return
        endif
        if has('nvim')
            return
        endif
        " 取得光标所在行的文本（当前选中的文件名）
        let text = getline('.')
        if ! get(g:, 'dirvish_hide_visible', 0)
            exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
        endif
        " 排序文件名
        exec 'sort ,^.*[\/],'
        let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
        " 定位到之前光标处的文件
        call search(name, 'wc')
        noremap <silent><buffer> ~ :Dirvish ~<cr>
        noremap <buffer> % :e %
    endfunc

    aug MyPluginSetup
        autocmd!
        autocmd FileType dirvish call s:setup_dirvish()
    aug END
endif

