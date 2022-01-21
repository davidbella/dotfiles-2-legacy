autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'lib/*.ex': {
\      'alternate': 'test/{}_test.exs',
\      'console': 'mix test test/{}_test.exs'
\    },
\    'test/*_test.exs': {
\      'alternate': 'lib/{}.ex',
\      'console': 'mix test test/{}_test.exs'
\    },
\    'lib/**/*.ex': {
\      'alternate': 'test/{dirname}/{basename}_test.exs',
\      'console': 'mix test test/{dirname}/{basename}_test.exs'
\    },
\    'test/**/*_test.exs': {
\      'alternate': 'lib/{dirname}/{basename}.ex',
\      'console': 'mix test {}'
\    },
\ })
