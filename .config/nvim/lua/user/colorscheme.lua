vim.cmd [[
  try
    colorscheme nord
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  catch
    colorscheme default
    set background=dark
  endtry
]]
