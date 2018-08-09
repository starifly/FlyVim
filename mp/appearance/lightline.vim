if isdirectory(expand(FlyVimBundleDir("lightline.vim")))
    let g:lightline = {
                \ 'colorscheme': 'lightline_solarized',
                \ 'separator': { 'left': '', 'right': ''  },
                \ 'subseparator': { 'left': '', 'right': ''  },
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'fugitive', 'filename' ],
                \             [ 'ctrlpmark' ] ],
                \   'right': [ [ 'lineinfo' ],
                \              [ 'fileencoding', 'fileformat' ],
                \              [ 'linter_warnings', 'linter_errors', 'linter_ok'],
                \              [ 'filetype' ] ],
                \ },
                \ 'inactive': {
                \   'left': [ [ 'filename' ], ],
                \   'right': [ [ 'lineinfo' ], ],
                \ },
                \ 'tabline': {
                \   'left': [ [ 'bufferinfo' ],
                \             [ 'separator' ],
                \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
                \   'right': [ [ 'close' ], ],
                \ },
                \ 'component_expand': {
                \  'linter_checking': 'lightline#ale#checking',
                \   'linter_warnings': 'LightlineLinterWarnings',
                \   'linter_errors': 'LightlineLinterErrors',
                \   'buffercurrent': 'lightline#buffer#buffercurrent',
                \   'bufferbefore': 'lightline#buffer#bufferbefore',
                \   'bufferafter': 'lightline#buffer#bufferafter',
                \   'bufferall': 'lightline#buffer#bufferall',
                \ },
                \ 'component_type': {
                \     'linter_checking': 'left',
                \   'readonly': 'error',
                \   'linter_warnings': 'warning',
                \   'linter_errors': 'error',
                \   'buffercurrent': 'tabsel',
                \   'bufferbefore': 'raw',
                \   'bufferafter': 'raw',
                \   'bufferall': 'tabsel',
                \ },
                \ 'component_function': {
                \   'fugitive': 'LightlineFugitive',
                \   'filename': 'LightlineFilename',
                \   'fileformat': 'LightlineFileformat',
                \   'filetype': 'LightlineFiletype',
                \   'fileencoding': 'LightlineFileencoding',
                \   'mode': 'LightlineMode',
                \   'ctrlpmark': 'CtrlPMark',
                \   'bufferinfo': 'lightline#buffer#bufferinfo',
                \ },
                \ 'component': {
                \   'separator': '',
                \   'lineinfo': '%3p%%  %3l:%-2c',
                \ },
                \ }

    function! LightlineModified()
        return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LightlineReadonly()
        return &ft !~? 'help' && &readonly ? '⭤' : ''
    endfunction

    function! LightlineFilename()
        " if &filetype ==# 'qf'
        "     let fname = 'qf'
        " elseif &buftype ==# 'terminal'
        "     let fname = ''
        " elseif !&buflisted
        "     let fname = 'ac'
        " else
        "     let fname = expand('%:t')
        " endif
        let fname = expand('%:.')
        return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                    \ fname =~ '__Tagbar__' ? "" :
                    \ fname =~ '__Gundo\|NERD_tree' ? '' :
                    \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                    \ &ft == 'unite' ? unite#get_status_string() :
                    \ &ft == 'vimshell' ? vimshell#get_status_string() :
                    \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                    \ ('' != fname ? fname : '[No Name]') .
                    \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
    endfunction

    function! LightlineFugitive()
        try
            if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
                let mark = '⭠ '  " edit here for cool mark
                let branch = fugitive#head()
                return branch !=# '' ? mark.branch : ''
            endif
        catch
        endtry
        return ''
    endfunction

    function! LightlineFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! LightlineFiletype()
        return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
    endfunction

    function! LightlineFileencoding()
        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
    endfunction

    function! LightlineMode()
        let fname = expand('%:t')
        return fname =~ '__Tagbar__' ? 'Tagbar' :
                    \ fname == 'ControlP' ? 'CtrlP' :
                    \ fname == '__Gundo__' ? 'Gundo' :
                    \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                    \ fname =~ 'NERD_tree' ? 'NERDTree' :
                    \ &ft == 'unite' ? 'Unite' :
                    \ &ft == 'vimfiler' ? 'VimFiler' :
                    \ &ft == 'vimshell' ? 'VimShell' :
                    \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! CtrlPMark()
        if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
            call lightline#link('iR'[g:lightline.ctrlp_regex])
            return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                        \ , g:lightline.ctrlp_next], 0)
        else
            return ''
        endif
    endfunction

    let g:ctrlp_status_func = {
                \ 'main': 'CtrlPStatusFunc_1',
                \ 'prog': 'CtrlPStatusFunc_2',
                \ }

    function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
        let g:lightline.ctrlp_regex = a:regex
        let g:lightline.ctrlp_prev = a:prev
        let g:lightline.ctrlp_item = a:item
        let g:lightline.ctrlp_next = a:next
        return lightline#statusline(0)
    endfunction

    function! CtrlPStatusFunc_2(str)
        return lightline#statusline(0)
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
        return lightline#statusline(0)
    endfunction

    " augroup AutoSyntastic
    " 	autocmd!
    " 	autocmd BufWritePost *.c,*.cpp call s:syntastic()
    " augroup END
    " function! s:syntastic()
    " 	SyntasticCheck
    " 	call lightline#update()
    " endfunction

    let g:unite_force_overwrite_statusline = 0
    let g:vimfiler_force_overwrite_statusline = 0
    let g:vimshell_force_overwrite_statusline = 0

    function! LightlineLinterWarnings() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
    endfunction
    function! LightlineLinterErrors() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
    endfunction
    function! LightlineLinterOK() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '✓ ' : ''
    endfunction

    " autocmd User ALELint call lightline#update()

    " lightline-buffer ui settings
    " replace these symbols with ascii characters if your environment does not support unicode
    " let g:lightline_buffer_logo = ' '
    let g:lightline_buffer_logo = ''  " ' '
    let g:lightline_buffer_readonly_icon = ''
    let g:lightline_buffer_modified_icon = '✭'
    let g:lightline_buffer_git_icon = ' '
    let g:lightline_buffer_ellipsis_icon = '..'
    let g:lightline_buffer_expand_left_icon = '◀ '
    let g:lightline_buffer_expand_right_icon = ' ▶'
    let g:lightline_buffer_active_buffer_left_icon = ''
    let g:lightline_buffer_active_buffer_right_icon = ''
    let g:lightline_buffer_separator_icon = '  '

    " enable devicons, only support utf-8
    " require <https://github.com/ryanoasis/vim-devicons>
    " let g:lightline_buffer_enable_devicons = 1

    " lightline-buffer function settings
    let g:lightline_buffer_show_bufnr = 1

    " :help filename-modifiers
    let g:lightline_buffer_fname_mod = ':t'

    " hide buffer list
    let g:lightline_buffer_excludes = ['vimfiler']

    " max file name length
    let g:lightline_buffer_maxflen = 30

    " max file extension length
    let g:lightline_buffer_maxfextlen = 3

    " min file name length
    let g:lightline_buffer_minflen = 16

    " min file extension length
    let g:lightline_buffer_minfextlen = 3

    " reserve length for other component (e.g. info, close)
    let g:lightline_buffer_reservelen = 20
endif
