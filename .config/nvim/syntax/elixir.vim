autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'lib/*.ex': {
\      'alternate': 'test/{}_test.exs'
\    },
\    'test/*_test.exs': {
\      'alternate': 'lib/{}.ex'
\    },
\    'lib/**/*.ex': {
\      'alternate': 'test/{dirname}/{basename}_test.exs'
\    },
\    'test/**/*_test.exs': {
\      'alternate': 'lib/{dirname}/{basename}.ex'
\    },
\ })
