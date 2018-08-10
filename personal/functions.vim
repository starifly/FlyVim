"======================================================================
"
" functions.vim -
"
" Created: 2018-07-23
" URL: https://github.com/if2012/FlyVim
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


function! FlyVimBundleDir(bundlename)
    return $VIMHOME . "/bundle/" . a:bundlename
endfunction

function! SourceConfigsIn(dir)
    let filelist = split(globpath(a:dir, '*.vim'), '\n')
    for vimconf in filelist
        execute 'source' vimconf
    endfor
endfunction

function! CloseWindowOrKillBuffer() "{{{
    " never bdelete a nerd tree
    if matchstr(expand("%"), 'NERD') ==# 'NERD'
        wincmd c
        return
    endif

    let number_of_windows_to_this_buffer =
                \ len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

    if number_of_windows_to_this_buffer > 1
        wincmd c
    else
        bdelete
    endif
endfunction "}}}

" Make pressing Enter accept a completion entry.
function! SmartEnter()
    if pumvisible()
        return "\<C-y>"
    endif

    return "\<CR>"
endfunction
