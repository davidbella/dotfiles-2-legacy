""" vim
" tab-complete, see https://vi.stackexchange.com/q/19675/15292.
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" opens buffer list, use # or type in name of file to open
" replaced by LeaderF
" nnoremap <silent> <leader>b :ls<CR>:b<Space>

nmap <leader>l <Plug>VinegarUp

" Search brings result to middle of screen
nnoremap n nzz
nnoremap N Nzz

" H/L for beginning/end of line
nnoremap H ^
nnoremap L $

" Ctrl-j/Ctrl-k for scrolling, escaping insert mode
noremap <C-j> <esc><C-e>
noremap <C-k> <esc><C-y>

" leader-c to copy current file name into clipboard buffer
map <silent> <leader>c :let @+ = expand("%")<CR>

" leader-d/D to close buffers
map <leader>d :bd<cr>
map <leader>D :bufdo bd<cr>

" Display list of matching tags if more than one, credit: Thomas Wack
noremap <C-]> g<C-]>

""" ManualMD
" Find most recent undone task
map <silent> <leader>mt /- \[ \]<CR>N3l

function! DaySearch(date)
  let @/=a:date
endfunction

map <silent> <leader>mp :call DaySearch(strftime("%Y-%m-%d", localtime() - 3600 * 24))<CR>N

""" vim-projectionist
map <silent> <leader>a :A<cr>
