autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    '*.lua': {
\      'alternate': '{}_spec.lua'
\    },
\    '*_spec.lua': {
\      'alternate': '{}.lua'
\    },
\ })
