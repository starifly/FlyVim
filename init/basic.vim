"======================================================================
"
" basic.vim - basic configuration, this configuration needs to be compatible
" with vim tiny mode
"
" acceptable to everyone, without any keymap and preference settings
"
" Created: 2018-07-23
" URL: https://github.com/if2012/FlyVim
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" basic setting
"----------------------------------------------------------------------

" disable vi compatibility mode
set nocompatible

" set Backspace key mode
set bs=eol,start,indent

" auto indent
set autoindent

" Windows disables ALT act-menu (making ALT available in Vim)
set winaltkeys=no

" disable auto wrap
set nowrap

" turn on the function key timeout detection
" the function key under terminal is a strings starting with ESC
set ttimeout

" function key timeout detection 50ms
set ttimeoutlen=50

" display cursor position
set ruler


"----------------------------------------------------------------------
" search setting
"----------------------------------------------------------------------

" ignore case when searching
set ignorecase

" smart search case delimiter
" case is ignore by default, unless the search contains uppercase
set smartcase

" highlight search content
set hlsearch

" dynamic incremental display of search results when input
set incsearch


"----------------------------------------------------------------------
" encoding setting
"----------------------------------------------------------------------
if has('multi_byte')
	" internal work encoding
	set encoding=utf-8

    " file default encoding
	set fileencoding=utf-8

    " auto try the following sequential encoding when opening a file
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


"----------------------------------------------------------------------
" allow Vim's own script to auto set indent based on file type, etc
"----------------------------------------------------------------------
if has('autocmd')
	filetype plugin indent on
endif


"----------------------------------------------------------------------
" syntax highlight setting
"----------------------------------------------------------------------
if has('syntax')
	syntax enable
	syntax on
endif


"----------------------------------------------------------------------
" other setting
"----------------------------------------------------------------------

" show matching brackets
set showmatch

" show the time when match
set matchtime=2

" show last line
set display=lastline

" allow the below display directories
set wildmenu

" delayed draw (boost performance)
set lazyredraw

" error format
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

" the separator visible
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<


" set tags: the current up to the root directory until find the .tags
" or Vim's current directory contains a .tags file
set tags=./.tags;,.tags

" if het Unicode is bigger than 255,
" don't have to wait for the space to break
set formatoptions+=m

" don't add space in between when merging two lines of Chinese
set formatoptions+=B

" file line breaks, defaults to unix line breaks
set ffs=unix,dos,mac


"----------------------------------------------------------------------
" fold setting
"----------------------------------------------------------------------
if has('folding')
	" fold enable
	set foldenable

	" indentation by default
	set fdm=indent

	" open all indents by default
	set foldlevel=99
endif


"----------------------------------------------------------------------
" ignore the extensions when file searching and completing
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
