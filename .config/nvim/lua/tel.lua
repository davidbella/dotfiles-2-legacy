local actions = require('telescope.actions')

local picker_theme = {
  theme = "ivy",
  layout_config = {
    height = 15,
  },
  border = true,

  borderchars = {
    "z",
    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
    results = { " " },
    preview = { "─", " ", " ", " ", "─", "─", " ", " " },
  }
}

require('telescope').setup{
  defaults = {
    file_sorter = require("telescope.sorters").get_generic_fuzzy_sorter, -- gief me regex
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    find_files = picker_theme,
    live_grep = picker_theme,
    grep_string = picker_theme,
    buffers = picker_theme,
    lsp_document_symbols = picker_theme,
    lsp_references = picker_theme,
  },
}

local map = vim.api.nvim_set_keymap

function files()
  require('telescope.builtin').find_files()
end

function grep()
  require('telescope.builtin').live_grep()
end

function buffers()
  require('telescope.builtin').buffers()
end

function lsp()
  require('telescope.builtin').lsp_document_symbols()
end

options = { noremap = true }
map('n', '<leader>f', "<cmd>lua files()<cr>", options)
map('n', '<leader>g', "<cmd>lua grep()<cr>", options)
map('n', '<leader>b', "<cmd>lua buffers()<cr><Esc>", options)
map('n', '<leader>v', "<cmd>lua lsp()<cr><Esc>", options)

map('n', '<leader>F', "<cmd>lua require('telescope.builtin').grep_string()<cr>", options)
map('n', '<leader>V', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr><Esc>", options)

map('n', '<leader>h', "<cmd>lua require('vim.diagnostic').open_float()<cr>", options)

vim.cmd [[
set tagfunc=v:lua.vim.lsp.tagfunc
]]
