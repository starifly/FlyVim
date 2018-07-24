"======================================================================
"
" plugins.vim -
"
" Created: 2018-07-23
" URL: https://github.com/if2012/FlyVim
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_groups')
    let g:bundle_groups = []
    let g:bundle_groups += ['default', 'basic', 'tags', 'enhanced', 'filetypes', 'textobj']
    let g:bundle_groups += ['appearance', 'nerdtree', 'ale', 'echodoc', 'leaderf', 'youcompleteme']
endif


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(FlyVimBundleDir(''))

if exists('g:bundle_groups')
    for $bundle_group in g:bundle_groups
        source $flyvim_root/mp/$bundle_group/$bundle_group.bundles
    endfor
endif


"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
