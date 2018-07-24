function! FlyVim#plug#youcompleteme#build(info)
  let args = ['install.py', '--clang-completer']

  call system('go version')
  if !v:shell_error
    call add(args, '--go-completer')
  endif

  call system('rustc --version')
  if !v:shell_error
    call add(args, '--rust-completer')
  endif

  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status ==# 'installed' || a:info.force
    " Prefer python3
    call insert(args, executable('python3') ? '!python3' : '!python')
    execute join(args, ' ')
  endif
endfunction
