local options = {
  number = true,                           -- set numbered lines
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text
  numberwidth = 4,                         -- set number column width to 6

  hidden = true,                           -- allow buffers to be hidden (does not require save on switch)

  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  expandtab = true,                        -- convert tabs to spaces
  smartindent = true,                      -- make indenting smarter again

  listchars = { tab = ">-", trail = "." }, -- show trailing spaces and all tabs
  list = true,
  fillchars = { eob = " ", fold = " ", vert = " " }, -- cleaner "fills" of buffer end, folds, etc.

  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case

  updatetime = 100,                        -- faster completion (4000ms default)
  timeoutlen = 1000,

  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window

  swapfile = false,                        -- do not create swapfile
  undofile = true,                         -- enable persistent undo

  scrolloff = 8,                           -- allow up to 8 lines when scrolling
  sidescrolloff = 8,

  completeopt = { "menuone", "noselect" }, -- mostly just for cmp

  conceallevel = 2,
}

vim.cmd[[au VimEnter * hi Visual cterm=bold ctermbg=NONE]]

vim.opt.shortmess:append "c"               -- avoids "hit enter" menus on completion pop ups

for k, v in pairs(options) do
  vim.opt[k] = v
end

function _G.custom_fold_text()
  return vim.fn.getline(vim.v.foldstart)
end

vim.opt.foldtext = 'v:lua.custom_fold_text()'
