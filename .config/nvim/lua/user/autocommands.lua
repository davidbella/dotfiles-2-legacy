-- Sets block cursor in normal, vertical bar in insert, underscore in replace
-- Resets to vertical bar on leaving vim
vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd VimEnter,VimResume * set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
    autocmd VimLeave,VimSuspend * set guicursor=a:ver100
  augroup end
]]
