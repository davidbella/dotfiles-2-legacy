local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    theme = "ivy",
    layout_strategy = "bottom_pane",
    layout_config = {
      height = 15,
    },
    border = true,

    borderchars = {
      "z",
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { "─", " ", " ", " ", "─", "─", " ", " " },
    },
    file_sorter = require("telescope.sorters").get_generic_fuzzy_sorter, -- gief me regex
    sorting_strategy = "ascending",
    -- selection_strategy = "follow",
    scroll_strategy = "limit",
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
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
        n = {
          ["d"] = actions.delete_buffer,
        }
      },
      sort_lastused = true
    },
    grep_string = {
      sorting_strategy = "ascending", -- doesn't seem to work, how can I sort my grep results better?
      scroll_strategy = "cycle",
    }
  },
}

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

local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader>f', "<cmd>lua files()<cr>", options)
map('n', '<leader>g', "<cmd>lua grep()<cr>", options)
map('n', '<leader>b', "<cmd>lua buffers()<cr><Esc>", options)
map('n', '<leader>v', "<cmd>lua lsp()<cr><Esc>", options)
map('n', '<leader>G', "<cmd>lua require('telescope.builtin').grep_string()<cr>", options)
