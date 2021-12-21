setlocal foldmethod=expr
setlocal foldexpr=GetManualMdFold(v:lnum)

function! GetManualMdFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif

  if getline(a:lnum) =~? '\v^(monday|tuesday|wednesday|thursday|friday|saturday|sunday)'
    return '0'
  endif

  if getline(a:lnum) =~? '\v^\=*$'
    return '0'
  endif

  if getline(a:lnum) =~? '\v^\s*###'
    return '1'
  endif

  return '2'
endfunction
