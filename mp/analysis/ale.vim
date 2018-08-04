if isdirectory(expand(FlyVimBundleDir("ale")))
            \   && has_key(g:plugs, 'ale')
    " let g:ale_linters_explicit = 1

    " 设定延迟和提示信息
    let g:ale_completion_delay = 500
    let g:ale_echo_delay = 20
    let g:ale_lint_delay = 500
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '➤'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    " let g:ale_echo_msg_format = '[%linter%] %code: %%s'

    " let g:ale_statusline_format = ['%d', '%d', 'OK']

    " 设定检测的时机：normal 模式文字改变，或者离开 insert模式
    " 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
    " let g:ale_lint_on_text_changed = 'normal'
    " let g:ale_lint_on_insert_leave = 1

    let g:ale_fix_on_save = 1
    let g:ale_sign_column_always = 0 " 一般需要实时检查，默认关闭
    let g:ale_lint_on_save = 1 " save file auto check
    let g:ale_lint_on_text_changed = 0 " for ale_lint_on_save = 1
    let g:ale_lint_on_enter = 0 " for ale_lint_on_save = 1

    " 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
    if !g:FlyVim.os.windows && has('win32unix') == 0
        let g:ale_command_wrapper = 'nice -n5'
    endif

    " 允许 airline 集成
    let g:airline#extensions#ale#enabled = 1

    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)

    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 1

    " toggle quickfix list
    function! ToggleErrors()
        let old_last_winnr = winnr('$')
        cclose
        if old_last_winnr == winnr('$')
            " Nothing was closed, open syntastic_error location panel
            copen
        endif
    endfunction
    nnoremap <localleader>s :call ToggleErrors()<cr>
endif

