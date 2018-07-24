if isdirectory(expand(FlyVimBundleDir("errormarker.vim")))
    " 使用 <space>ha 清除 errormarker 标注的错误
    noremap <silent><localleader>ha :RemoveErrorMarkers<cr>
endif

