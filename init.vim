"======================================================================
"
" init.vim - initialize config
"
" Created: 2018-07-23
" From: https://github.com/if2012/FlyVim
"
"======================================================================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
    finish
else
    let s:loaded = 1
endif

let $VIMFILES=fnamemodify(expand('<sfile>'), ":p:h")
command! -nargs=1 LoadScript exec 'so '.$VIMFILES.'/'.'<args>'
set runtimepath+=$VIMFILES/core

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim


"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" Functions
LoadScript init/functions.vim

" 加载基础配置
LoadScript init/basic.vim

" 加载扩展配置
LoadScript init/config.vim

" 插件加载
LoadScript init/plugins.vim

" 界面样式
LoadScript init/style.vim

" 自定义按键
LoadScript init/keymaps.vim

" Plugin Configuration
so $flyvim_root/mp/plugin-config.vim

