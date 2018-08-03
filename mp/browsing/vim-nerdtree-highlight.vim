if isdirectory(expand(FlyVimBundleDir("vim-nerdtree-syntax-highlight")))
    " NerdTree highlight
    let g:NERDTreeFileExtensionHighlightFullName = 1
    let g:NERDTreeExactMatchHighlightFullName = 1
    let g:NERDTreePatternMatchHighlightFullName = 1
    let g:NERDTreeHighlightFolders = 1
    let g:NERDTreeLimitedSyntax = 1
    let g:NERDTreeHighlightFoldersFullName = 1
endif
