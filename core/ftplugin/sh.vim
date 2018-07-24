if exists('b:did_sh_ftplugin')
  finish
endif
let b:did_sh_ftplugin = 1

setlocal tabstop=2 softtabstop=2 shiftwidth=2

let b:ale_linters = ['shellcheck']

let b:ale_fixers = {
\   'sh': ['shfmt'],
\}
