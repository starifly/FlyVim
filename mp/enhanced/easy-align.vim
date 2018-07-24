if isdirectory(expand(FlyVimBundleDir("vim-easy-align")))
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    xmap <leader>al <Plug>(LiveEasyAlign)
    " Live easy align
    nmap <leader>al <Plug>(LiveEasyAlign)
    if !exists('g:easy_align_delimiters')
        let g:easy_align_delimiters = {}
    endif
    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String']  }
endif
