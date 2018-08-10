" Plugin Configuration {{{
if exists('g:bundle_groups')
    for $bundle_group in g:bundle_groups
        call SourceConfigsIn($FlyVim_Dir . "/mp/" . $bundle_group)
    endfor
endif
" }}}
