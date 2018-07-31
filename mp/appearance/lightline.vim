if isdirectory(expand(FlyVimBundleDir("lightline.vim")))
    let g:lightline = {
                \ 'colorscheme': 'srcery_drk',
                \ 'separator': { 'left': '⮀', 'right': '⮂'  },
                \ 'subseparator': { 'left': '⮁', 'right': '⮃'  },
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'fugitive', 'filename' ],
                \             [ 'ctrlpmark' ] ],
                \   'right': [ [ 'lineinfo' ],
                \            [ 'percent' ],
                \            [ 'filetype', 'fileencoding', 'fileformat' ],
                \           [ 'linter_warnings', 'linter_errors', 'linter_ok'] ],
                \ },
                \   'tabline': {
                \       'left': [ ['buffers'] ],
                \       'right': [ ['close'] ],
                \ },
                \ 'component_function': {
                \   'fugitive': 'LightlineFugitive',
                \   'filename': 'LightlineFilename',
                \   'fileformat': 'LightlineFileformat',
                \   'filetype': 'LightlineFiletype',
                \   'fileencoding': 'LightlineFileencoding',
                \   'mode': 'LightlineMode',
                \   'ctrlpmark': 'CtrlPMark',
                \ },
                \ 'component_expand': {
                \  'linter_checking': 'lightline#ale#checking',
                \   'linter_warnings': 'LightlineLinterWarnings',
                \   'linter_errors': 'LightlineLinterErrors',
                \   'buffers': 'lightline#bufferline#buffers',
                \  'tabs': 'LightlineTabs',
                \ },
                \ 'component_type': {
                \     'linter_checking': 'left',
                \   'readonly': 'error',
                \   'linter_warnings': 'warning',
                \   'linter_errors': 'error',
                \   'buffers': 'tabsel',
                \ },
                \ }

    function! LightlineModified()
        return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LightlineReadonly()
        return &ft !~? 'help' && &readonly ? '⭤' : ''
    endfunction

    function! LightlineFilename()
        let fname = expand('%:t')
        return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                    \ fname == '__Tagbar__' ? g:lightline.fname :
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
        return fname == '__Tagbar__' ? 'Tagbar' :
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

    let g:lightline#bufferline#show_number  = 1
    let g:lightline#bufferline#shorten_path = 1
    let g:lightline#bufferline#unnamed      = '[No Name]'

    function! LightlineTabs() abort
        let [x, y, z] = [[], [], []]
        let nr = tabpagenr()
        let cnt = tabpagenr('$')
        for i in range(1, cnt)
            call add(i < nr ? x : i == nr ? y : z,
                        \ '%' . i . '%%{lightline#onetab(' . i . ',' . (i == nr) . ')}'
                        \ . (i == cnt ? '%T' : ''))
        endfor
        if len(x) > 3
            let x = x[len(x)-3:]
            let x[0] = '<' . x[0]
        endif
        if len(z) > 3
            let z = z[:2]
            let z[len(z)-1] = z[len(z)-1] . '>'
        endif
        return [x, y, z]
    endfunction

    noremap <Leader>1 <Plug>lightline#bufferline#go(1)
    noremap <Leader>2 <Plug>lightline#bufferline#go(2)
    noremap <Leader>3 <Plug>lightline#bufferline#go(3)
    noremap <Leader>4 <Plug>lightline#bufferline#go(4)
    noremap <Leader>5 <Plug>lightline#bufferline#go(5)
    noremap <Leader>6 <Plug>lightline#bufferline#go(6)
    noremap <Leader>7 <Plug>lightline#bufferline#go(7)
    noremap <Leader>8 <Plug>lightline#bufferline#go(8)
    noremap <Leader>9 <Plug>lightline#bufferline#go(9)
    noremap <Leader>0 <Plug>lightline#bufferline#go(10)
endif
