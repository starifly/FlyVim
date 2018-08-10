if isdirectory(expand(FlyVimBundleDir("YouCompleteMe")))
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_global_ycm_extra_conf=$FlyVim_Dir . '/tools/conf/.ycm_extra_conf.py'

    " let g:ycm_python_binary_path = 'python3'

    nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_autoclose_preview_window_after_completion = 1

    " 禁用预览功能：扰乱视听
    let g:ycm_add_preview_to_completeopt = 0

    " 禁用诊断功能：我们用前面更好用的 ALE 代替
    let g:ycm_goto_buffer_command = 'horizontal-split'
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings=1
    let g:ycm_seed_identifiers_with_syntax=1
    let g:ycm_key_invoke_completion = '<c-z>'
    set completeopt=menu,menuone

    noremap <c-z> <NOP>

    let g:ycm_filetype_blacklist = {
                \ 'tagbar' : 1,
                \ 'qf' : 1,
                \ 'notes' : 1,
                \ 'markdown' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'vimwiki' : 1,
                \ 'pandoc' : 1,
                \ 'infolog' : 1,
                \ 'mail' : 1
                \}

    " 两个字符自动触发语义补全
    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{3}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }

    " let g:ycm_semantic_triggers = get(g:, 'ycm_semantic_triggers', {})

    " function! s:set_ft_triggers(ft, expr, override) abort
    "     if a:override
    "         let g:ycm_semantic_triggers[a:ft] = a:expr
    "     elseif !has_key(g:ycm_semantic_triggers, a:ft)
    "         let g:ycm_semantic_triggers[a:ft] = a:expr
    "     endif
    " endfunction

    " call s:set_ft_triggers('c', ['->', '.'], 0)
    " call s:set_ft_triggers('objc', ['->', '.'], 0)
    " call s:set_ft_triggers('ocaml', ['.', '#'], 0)
    " call s:set_ft_triggers('cpp,objcpp', ['->', '.', '::'], 0)
    " call s:set_ft_triggers('perl', ['->'], 0)
    " call s:set_ft_triggers('php', ['->', '::'], 0)
    " call s:set_ft_triggers('cs,javascript,d,python,perl6,scala,vb,elixir,go', ['.'], 0)
    " call s:set_ft_triggers('java,jsp', ['.'], 0)
    " call s:set_ft_triggers('vim', ['re![_a-zA-Z]+[_\w]*\.'], 0)
    " call s:set_ft_triggers('ruby', ['.', '::'], 0)
    " call s:set_ft_triggers('lua', ['.', ':'], 0)
    " call s:set_ft_triggers('erlang', [':'], 0)
    " call s:set_ft_triggers('sh', ['re![\w-]{2}', '/', '-'], 0)
    " call s:set_ft_triggers('zsh', ['re![\w-]{2}', '/', '-'], 0)
endif
