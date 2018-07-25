if empty($flyvim_root)
    let $flyvim_root = "~/.FlyVim"
endif

if empty($bundle_root)
    let $bundle_root = "~/.vim"
endif

" Init Config
source $flyvim_root/init.vim
