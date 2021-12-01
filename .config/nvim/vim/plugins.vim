" colorscheme monochrome
colorscheme mono

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
