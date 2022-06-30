-- currently being migrated to lua config
-- https://github.com/kyazdani42/nvim-tree.lua/issues/674
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = false,
  hijack_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    highlight_opened_files = "all",

    icons = {
      glyphs = {
        default = "",
        symlink = "", -- "",
        git = {
          unstaged = "✚", -- "",
          staged = "●",
          unmerged = "",
          renamed = "➜",
          deleted = "✖", -- "",
          untracked = "◌",
          ignored = "",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "", -- "",
        },
      },
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      }
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        -- { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        -- { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "C", cb = tree_cb "cd" },
      },
    },
    number = false,
    relativenumber = false,
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = false,
    }
  },
  trash = {
    cmd = "trash",
    require_confirm = false,
  },
  -- highlight_focused_file = true,
}

vim.cmd[[au VimEnter * hi NvimTreeGitDirty ctermfg=yellow]]
vim.cmd[[au VimEnter * hi NvimTreeGitNew ctermfg=green]]
vim.cmd[[au VimEnter * hi NvimTreeOpenedFile cterm=bold ctermbg=NONE]]
