if isdirectory(expand(FlyVimBundleDir("ultisnips")))
    let g:UltiSnipsExpandTrigger="<c-e>"
    let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
    let g:UltiSnipsSnippetsDir = $flyvim_root.'/UltiSnips'
    " 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
    " 进入对应filetype的snippets进行编辑
    noremap <leader>us :UltiSnipsEdit<CR>
endif
