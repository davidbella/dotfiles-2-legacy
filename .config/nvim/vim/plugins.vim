colorscheme monochrome

""" LeaderF
"" globals
" Show hidden files
let g:Lf_ShowHidden = 1

" Do not use cache file
let g:Lf_UseCache = 0

" Refresh each time we call leaderf
let g:Lf_UseMemoryCache = 0

" Ignore certain files and directories when searching files
let g:Lf_WildIgnore = {
  \ 'dir': ['.git', 'node_modules'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  \ '*.mp3', '*.aac']
  \}

"" mappings
" search buffers
nnoremap <silent> <leader>b :Leaderf buffer --left<CR><Tab>

" search files
nnoremap <silent> <leader>f :Leaderf file --popup<CR>

" grep files in popup window
nnoremap <silent> <leader>g :Leaderf rg --popup<CR>


""" NERDTree
" Automagically open NERDTree on vim startup and default to file window instead of NERDTree
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p

" Automagically close NERDTree if it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Keep NERDTree closed after opening a file
let NERDTreeQuitOnOpen=1

" Adjust NERDTree window size
let NERDTreeWinSize=80

" Hide cursorline in NERDTree
let NERDTreeHighlightCursorline=0

" Customize NERDTree statusline
" current file highlighted
" let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
" Nothing
let NERDTreeStatusline="\ "

" Binding to locate current file in NERDTree
map <leader>l :NERDTreeFind<cr>


""" NERDCommenter
" Create default mappings
" Makes my filename copier (leader-c) instant
let g:NERDCreateDefaultMappings = 0

" filetype checking
filetype plugin on

" Puts a space after the comment
let g:NERDSpaceDelims = 1

" Use / and space to toggle comments
map <leader>/ <plug>NERDCommenterToggle
map <leader><space> <plug>NERDCommenterToggle
