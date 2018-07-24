"======================================================================
"
" plugins.vim -
"
" Created: 2018-07-23
" URL: https://github.com/starifly/FlyVim
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 et :


"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_groups')
    let g:bundle_groups = []
    let g:bundle_groups += ['default', 'basic', 'tags', 'enhanced', 'filetypes', 'textobj']
    let g:bundle_groups += ['appearance', 'browsing', 'analysis', 'echodoc', 'leaderf', 'youcompleteme']
endif


"----------------------------------------------------------------------
" 在 ~/.vim/bundle 下安装插件
"----------------------------------------------------------------------
call plug#begin(FlyVimBundleDir(''))

if exists('g:bundle_groups')
    for $bundle_group in g:bundle_groups
        so $FlyVim_Dir/mp/$bundle_group/$bundle_group.bundles
    endfor
endif


"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
