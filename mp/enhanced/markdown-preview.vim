if isdirectory(expand(FlyVimBundleDir("markdown-preview.vim")))
    " this is temp conf
    let uname = system('uname -s')
    if uname == "Darwin\n"
        let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
    else
        let g:mkdp_path_to_chrome = '/usr/bin/google-chrome-stable %U'
    endif
    nmap <silent> <F11> <Plug>MarkdownPreview
    imap <silent> <F11> <Plug>MarkdownPreview
    nmap <silent> <F12> <Plug>StopMarkdownPreview
    imap <silent> <F12> <Plug>StopMarkdownPreview
endif
