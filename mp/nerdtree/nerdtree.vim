if isdirectory(expand(FlyVimBundleDir("nerdtree")))
    " NERDTree {{{
    " o.......打开文件目录或书签
    " t.......在新的tab页中打开文件或书签
    " T.......在新的tab页中打开文件或书签，但光标仍然留在 NERDTree
    " r.......刷新光标所在的目录
    " R.......刷新当前根路径
    " i.......在split window中打开选择的文件
    " s.......在vsplit window中打开选择的文件
    " O.......Recursively open the selected directory
    " x.......Close the current nodes parent
    " X.......Recursively close all children of the current node
    " e.......Edit the current dir
    " D.......删除当前书签
    " p.......返回当前节点父节点
    " P.......返回根节点
    " J.......到第一个节点
    " K.......到最后一个节点
    " I.......显示隐藏文件
    " B.......切换书签隐藏显示
    " m.......显示文件操作菜单
    " C.......将根路径设置为光标所在的目录
    " u.......设置上级目录为根路径
    " cd......Change the CWD to the dir of the selected node
    " CD......Change tree root to the CWD
    " ctrl + w + w......光标自动在左右侧窗口切换
    " }}}

    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeDirArrows = 1
    let g:NERDTreeHijackNetrw = 0
    noremap <space>nt :NERDTreeToggle<cr>
    nnoremap <Leader>fd :NERDTreeFind<CR>
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
endif
