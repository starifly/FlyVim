function! s:lod(...)
  " Ignore unknown plugins from vim-plug due to the excluded plugins
  for l:plug in a:000
    silent! call plug#load(l:plug)
  endfor
endfunction

" 200
function! FlyVim#defer#basic(timer) abort
  call s:lod('vim-misc', 'vim-signature')
endfunction

" 300
function! FlyVim#defer#signify(timer) abort
  call s:lod('vim-signify')
endfunction

" 350
function! FlyVim#defer#basic2(timer) abort
  call s:lod('errormarker.vim', 'vim-choosewin', 'vim-preview',)
endfunction

" 400
function! FlyVim#defer#fugitive(timer) abort
  call s:lod('vim-fugitive')
endfunction

" 500
function! FlyVim#defer#tags(timer) abort
  call s:lod('vim-gutentags', 'gutentags_plus')
endfunction

" 600
function! FlyVim#defer#fzf(timer) abort
  call s:lod('fzf', 'fzf.vim')
endfunction

" 700
function! FlyVim#defer#motion(timer) abort
  call s:lod('vim-easymotion', 'clever-f.vim', 'vim-sneak')
endfunction

" 800
function! FlyVim#defer#whitespace(timer) abort
  call s:lod('vim-better-whitespace')
endfunction

" 850
function! FlyVim#defer#ale(timer) abort
  call s:lod('ale')
endfunction

" 900
function! FlyVim#defer#echodoc(timer) abort
  call s:lod('echodoc.vim')
endfunction

" 1000
function! FlyVim#defer#ycm(timer) abort
  call s:lod('YouCompleteMe')
endfunction
