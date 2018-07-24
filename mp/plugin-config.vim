" Plugin Configuration {{{
if exists('g:bundle_groups')
    for $bundle_group in g:bundle_groups
        call SourceConfigsIn($flyvim_root . "/mp/" . $bundle_group)
    endfor
endif
" }}}
