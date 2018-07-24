let g:textobj_indent_no_default_key_mappings    = 1
let g:textobj_syntax_no_default_key_mappings    = 1
let g:textobj_function_no_default_key_mappings  = 1
let g:textobj_parameter_no_default_key_mappings = 1

for s:mode in ['x', 'o']
  for s:motion in ['i', 'a']
    execute s:mode . 'map ' . s:motion . 'f       <Plug>(textobj-function-'     . s:motion          . ')'
    execute s:mode . 'map ' . s:motion . 'F       <Plug>(textobj-function-'     . toupper(s:motion) . ')'
    execute s:mode . 'map ' . s:motion . 'i       <Plug>(textobj-indent-same-'  . s:motion          . ')'
    execute s:mode . 'map ' . s:motion . 'I       <Plug>(textobj-indent-'       . s:motion          . ')'
    execute s:mode . 'map ' . s:motion . ',       <Plug>(textobj-parameter-'    . s:motion          . ')'
    execute s:mode . 'map ' . s:motion . 'y       <Plug>(textobj-syntax-'       . s:motion          . ')'
  endfor
endfor
