if isdirectory(expand(FlyVimBundleDir("clever-f.vim")))
    let g:clever_f_across_no_line=1 " only match the current line
    let g:clever_f_fix_key_direction=1 " fix f to forward and F backword, tT etc.
    let g:clever_f_chars_match_any_signs=";" " use ; to match all signs
    let g:clever_f_use_migemo=1 " enable migemo support
endif
