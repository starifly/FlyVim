"======================================================================
"
" init.vim - initialize config
"
" Created: 2018-07-23
" From: https://github.com/if2012/FlyVim
"
"======================================================================

if empty($flyvim_root)
    let $flyvim_root = "~/.FlyVim"
endif

if empty($bundle_root)
    let $bundle_root = "~/.vim"
endif


let mapleader = "\\"
let maplocalleader = "\<Space>"


" Platform
let g:FlyVim = get(g:, 'FlyVim', {})
let g:FlyVim.os = {}
let g:FlyVim.os.mac = has('macunix')
let g:FlyVim.os.linux = has('unix') && !has('macunix') && !has('win32unix')
let g:FlyVim.os.windows = has('win32') || has('win64')

let g:FlyVim.nvim = has('nvim') && exists('*jobwait') && !g:FlyVim.os.windows
let g:FlyVim.vim8 = exists('*job_start')
let g:FlyVim.timer = exists('*timer_start')


command! -nargs=1 LoadScript exec 'so '.$flyvim_root.'/'.'<args>'
set runtimepath+=$flyvim_root/core
set runtimepath+=$flyvim_root/core/after

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim

if g:FlyVim.os.windows
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif


"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" Functions
LoadScript personal/functions.vim

" 加载基础配置
LoadScript personal/basic.vim

" 加载扩展配置
LoadScript personal/config.vim

" 插件加载
LoadScript personal/plugins.vim

" 界面样式
LoadScript personal/style.vim

" 自定义按键
LoadScript personal/keymaps.vim

" Plugin Configuration
LoadScript mp/plugin-config.vim
