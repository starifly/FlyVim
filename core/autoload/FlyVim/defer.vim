function! s:lod(...)
  " Ignore unknown plugins from vim-plug due to the excluded plugins
  for l:plug in a:000
    silent! call plug#load(l:plug)
  endfor
endfunction

" 200
function! FlyVim#defer#basic(timer) abort
  call s:lod('vim-misc', 'vim-signify', 'errormarker.vim')
endfunction

" 300
function! FlyVim#defer#basic2(timer) abort
  call s:lod('vim-choosewin', 'vim-preview')
endfunction

" 400
function! FlyVim#defer#ale(timer) abort
  call s:lod('ale')
endfunction

" 500
function! FlyVim#defer#signature(timer) abort
  call s:lod('vim-signature')
endfunction

" 600
function! FlyVim#defer#motion(timer) abort
  call s:lod('vim-sneak', 'vim-easymotion', 'clever-f.vim')
endfunction

" 700
function! FlyVim#defer#fzf(timer) abort
  call s:lod('fzf', 'fzf.vim')
endfunction

" 750
function! FlyVim#defer#tags(timer) abort
  call s:lod('vim-gutentags', 'gutentags_plus')
endfunction

" 800
function! FlyVim#defer#fugitive(timer) abort
  call s:lod('vim-fugitive')
endfunction

" 900
function! FlyVim#defer#echodoc(timer) abort
  call s:lod('echodoc.vim')
endfunction

" 1000
function! FlyVim#defer#whitespace(timer) abort
  call s:lod('vim-better-whitespace')
endfunction
