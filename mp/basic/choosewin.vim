if isdirectory(expand(FlyVimBundleDir("vim-choosewin")))
    " 使用 ALT+E 来选择窗口
    " nmap <m-e> <Plug>(choosewin)
	nmap  -  <Plug>(choosewin)
	" if you want to use overlay feature
	let g:choosewin_overlay_enable = 1
endif
