if isdirectory(expand(FlyVimBundleDir("ack.vim")))
	if executable('ag')
		let &grepprg = 'ag --nogroup --nocolor --column'
	else
		let &grepprg = 'grep -rn $* *'
	endif
	command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen
endif
