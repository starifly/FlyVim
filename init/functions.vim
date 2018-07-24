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
    return $bundle_root . "/bundle/" . a:bundlename
endfunction

function! SourceConfigsIn(dir)
    let filelist = split(globpath(a:dir, '*.vim'), '\n')
    for vimconf in filelist
        execute 'source' vimconf
    endfor
endfunction
