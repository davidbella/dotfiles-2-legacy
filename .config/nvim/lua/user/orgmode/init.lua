local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
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
    '~/Documents/MyDocuments/Orgmode/orgmode/agenda/recurring/*.org',
    '~/Documents/MyDocuments/Orgmode/orgmode/agenda/*.org',
  },
  org_default_notes_file = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
  org_todo_keywords = {'TODO(t)', 'CANCELED(c)', '|', 'RESCHED(r)', 'DONE(d)'},
  org_agenda_start_on_weekday = false,
  org_agenda_templates = {
    t = {
      description = 'Task',
      template = '* TODO %?\n  %T',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
    },
    e = {
      description = 'Event',
      template = '* DONE %?\n  %T',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/agenda/events.org',
    },
    b = {
      description = 'Bookmark',
      template = '* %?\n  %T\n  [[][]]',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/bookmarks.org',
    },
    c = {
      description = 'Citation',
      template = '* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :TITLE:     \n  :BTYPE:     \n  :CUSTOM_ID: \n  :AUTHOR:    \n  :YEAR:      \n  :PUBLISHER: \n  :END:\n\n',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/citations.org',
    }
  },
})

require 'user.orgmode.local-orgfiles'
