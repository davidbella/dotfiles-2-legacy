require('orgmode').setup({
  org_agenda_files = {
    '~/Documents/MyDocuments/Orgmode/orgmode/*',
  },
  org_default_notes_file = '~/Documents/MyDocuments/Orgmode/orgmode/refile.org',
  org_agenda_templates = {
    t = {
      description = 'Task',
      template = '* TODO %?\n  %T',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/tasks.org',
    },
    b = {
      description = 'Bookmark',
      template = '* [[%?][]]\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/bookmarks.org',
    },
    c = {
      description = 'Citation',
      template = '* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :TITLE:     \n  :BTYPE:     \n  :CUSTOM_ID: \n  :AUTHOR:    \n  :YEAR:      \n  :PUBLISHER: \n  :END:\n\n',
      target = '~/Documents/MyDocuments/Orgmode/orgmode/citations.org',
    }
  },
  -- org_agenda_start_on_weekday = 0,
  org_todo_keywords = {'TODO(t)', '|', 'DONE(d)'}
})
