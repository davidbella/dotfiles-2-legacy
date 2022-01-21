local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Search results to middle of screen
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- H/L for beginning/end of line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

-- Ctrl-j/Ctrl-k for scrolling and escaping insert mode
keymap("n", "<C-j>", "<C-e>", opts)
keymap("n", "<C-k>", "<C-y>", opts)
keymap("i", "<C-j>", "<esc><C-e>", opts)
keymap("i", "<C-k>", "<esc><C-y>", opts)

-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)
