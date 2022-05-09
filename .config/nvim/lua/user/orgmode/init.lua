local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require('orgmode').setup_ts_grammar()

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
  org_todo_keywords = {'TODO(t)', 'NEXT(n)', "WAIT(w)", "HOLD(h)", '|', 'CNCL(c)', 'DONE(d)', 'MEET'},
  org_agenda_start_on_weekday = false,
  org_agenda_skip_scheduled_if_done = true,
  org_agenda_templates = {
    t = {
      description = 'Task',
      template = '* TODO %?\n  %T',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
    },
    s = {
      description = 'Schedule',
      template = '* TODO %?\n  SCHEDULED: %T',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/schedule.org',
    },
    p = {
      description = 'Project - used, probably sparingly, to create a new top level project',
      template = '* %?\n  %u\n  :PROPERTIES: \n  :Summary: \n  :END:\n** Notes :NOTE:',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/projects.org',
    }
  },
})

require 'user.orgmode.local-orgfiles'
