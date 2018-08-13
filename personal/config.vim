"======================================================================
"
" config.vim - 正常模式下的配置，在 basic.vim 后调用
"
" Created: 2018-07-23
" URL: https://github.com/if2012/FlyVim
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 有 tmux 何没有的功能键超时（毫秒）
"----------------------------------------------------------------------
if $TMUX != ''
	set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
	set ttimeoutlen=80
endif


"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
if has('nvim') == 0 && has('gui_running') == 0
	function! s:metacode(key)
		exec "set <M-".a:key.">=\e".a:key
	endfunc
	for i in range(10)
		call s:metacode(nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(nr2char(char2nr('a') + i))
		call s:metacode(nr2char(char2nr('A') + i))
	endfor
	for c in [',', '.', '/', ';', '{', '}']
		call s:metacode(c)
	endfor
	for c in ['?', ':', '-', '_', '+', '=', "'"]
		call s:metacode(c)
	endfor
endif


"----------------------------------------------------------------------
" 终端下功能键设置
"----------------------------------------------------------------------
function! s:key_escape(name, code)
	if has('nvim') == 0 && has('gui_running') == 0
		exec "set ".a:name."=\e".a:code
	endif
endfunc


"----------------------------------------------------------------------
" 功能键终端码矫正
"----------------------------------------------------------------------
call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')


"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif


"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

" 允许备份
set backup

" 保存时备份
set writebackup

" 备份文件地址，统一管理
" set backupdir=~/.vim/tmp
set backupdir=/var/tmp/vimbak

" 备份文件扩展名
set backupext=.bak

" 禁用交换文件
set noswapfile

" 禁用 undo文件
set noundofile

" undo文件
" set undolevels=1000 " How many undos
" set undoreload=10000 " number of lines to save for undo
" set undofile
" set undodir=/var/tmp/vimundo/
" try
"     set undodir=~/.vim/tmp/undodir
"     set undofile
" catch
" endtry

" 创建目录，并且忽略可能出现的警告
" silent! call mkdir(expand('~/.vim/tmp/undodir'), "p", 0755)
if !isdirectory(&backupdir)
    silent! call mkdir(expand('/var/tmp/vimbak'), "p", 0755)
endif
" if !isdirectory(&undodir)
"     silent! call mkdir(expand('/var/tmp/vimundo'), "p", 0755)
" endif

" 允许不保存buffer而切换buffer (w/o=without)
set hidden


" " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
" " reference: https://github.com/w0rp/ale/issues/1689
silent! set ttymouse=xterm
set mouse=nv
" set selection=exclusive
" set selectmode=mouse,key

" InsertLeave时设置非粘贴模式
au InsertLeave * silent! set nopaste

" 将当前工作路径设为Vim PATH
set path=$PWD/**

set fillchars=vert:│

if has("clipboard")
    set clipboard=unnamed

    if has("unnamedplus")
        set clipboard+=unnamedplus
    endif
endif


" vim is often slow with long lines that are syntax highlighted, so limit to 200 characters in length"
" set synmaxcol=200
set synmaxcol=1000
" http://vim.wikia.com/wiki/Speed_up_Syntax_Highlighting
" autocmd BufEnter * :syntax sync maxlines=200


"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------

" 修正 ScureCRT/XShell 以及某些终端乱码问题，主要原因是不支持一些
" 终端控制命令，比如 cursor shaping 这类更改光标形状的 xterm 终端命令
" 会令一些支持 xterm 不完全的终端解析错误，显示为错误的字符，比如 q 字符
" 如果你确认你的终端支持，不会在一些不兼容的终端上运行该配置，可以注释
if has('nvim')
	set guicursor=
elseif (!has('gui_running')) && has('terminal') && has('patch-8.0.1200')
	let g:termcap_guicursor = &guicursor
	let g:termcap_t_RS = &t_RS
	let g:termcap_t_SH = &t_SH
	set guicursor=
	set t_RS=
	set t_SH=
endif

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
aug InitFileTypesGroup

	" 清除同组的历史 autocommand
	au!

	" 强制对某些扩展名的 filetype 进行纠正
	au BufNewFile,BufRead *.as setlocal filetype=actionscript
	au BufNewFile,BufRead *.pro setlocal filetype=prolog
	au BufNewFile,BufRead *.es setlocal filetype=erlang
	au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	au BufNewFile,BufRead *.vl setlocal filetype=verilog

aug END


"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------
" 设置缩进宽度
set sw=4

" 设置 TAB 宽度
set ts=4

" 展开 tab (expandtab)
set expandtab

" 如果设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4
