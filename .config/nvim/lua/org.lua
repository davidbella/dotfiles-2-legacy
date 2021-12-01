local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {
    '~/Documents/MyDocuments/Orgmode/orgmode/*',
    '~/Documents/MyDocuments/ManualMD/orgmode/*',
    '~/Documents/MyDocuments/Budget/orgmode/*',
    '~/Documents/MyDocuments/MyDocumentsWeb/orgmode/*',
    '~/Documents/MyDocuments/Neovim/orgmode/*',
  },
  org_default_notes_file = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
  org_agenda_templates = {
    t = {
      description = 'Task',
      template = '* TODO %?\n  %T',
      target = '~/Documents/MyDocuments/ManualMD/orgmode/manualmd.org',
    },
    b = {
      description = 'Bookmark',
      template = '* [[%?][]]\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n',
      target = '~/Documents/MyDocuments/ManualMD/orgmode/bookmarks.org',
    }
  },
  -- org_agenda_start_on_weekday = 0,
  org_todo_keywords = {'TODO(t)', 'DEFD(f)', '|', 'DONE(d)'}
})
