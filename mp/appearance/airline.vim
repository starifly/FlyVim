if isdirectory(expand(FlyVimBundleDir("vim-airline-themes")))
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_theme='onedark'
    let g:airline_solarized_bg='dark'
    let g:Powerline_symbols='fancy'
    let g:airline#extensions#tabline#enabled=1
    " let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s:'
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#fnamecollapse = 1
    let g:airline#extensions#tabline#fnametruncate = 0
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#default#section_truncate_width = {
                \ 'b': 79,
                \ 'x': 60,
                \ 'y': 88,
                \ 'z': 45,
                \ 'warning': 80,
                \ 'error': 80,
                \ }
    " let g:airline#extensions#default#layout = [
    "             \ [ 'a', 'error', 'warning', 'b', 'c' ],
    "             \ [ 'x', 'y', 'z' ]
    "             \ ]
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'
    " Distinct background color is enough to discriminate the warning and
    " error information.
    let g:airline#extensions#ale#error_symbol = '•'
    let g:airline#extensions#ale#warning_symbol = '•'

    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#tab_nr_type= 2
    let g:airline#extensions#tabline#show_tab_type = 1
    let g:airline#extensions#tabline#buffers_label = 'BUFFERS'
    let g:airline#extensions#tabline#tabs_label = 'TABS'
    " }
endif
