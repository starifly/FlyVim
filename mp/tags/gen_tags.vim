if isdirectory(expand(FlyVimBundleDir("gen_tags.vim")))
    let g:gen_tags#ctags_opts =  ['--fields=+niazS','--extras=+q']
    let g:gen_tags#ctags_opts += ['--c++-kinds=+px', '--c-kinds=+px']
    let g:gen_tags#ctags_opts += ['--output-format=e-ctags','--exclude=*.mk']
    let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
    let g:gen_tags#gtags_bin = '/usr/local/bin/gtags'
    let g:gen_tags#gtags_default_map = 1
    " let g:gen_tags#use_cache_dir = expand($HOME.'/.cache/tags')
    let g:gen_tags#verbose       = 1
    let g:gen_tags#statusline    = 1
    let g:gen_tags#blacklist     = ['$HOME', '$HOME/.vim']
endif
