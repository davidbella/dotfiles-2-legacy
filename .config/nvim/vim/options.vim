" Set number column unless a sign is shown
set number relativenumber
set signcolumn=number
set numberwidth=6
" Allow buffers to be hidden - does not require a save to switch
set hidden

" >> and << move over by 2
set shiftwidth=2
" how many columns a tab counts for
set tabstop=2
" backspace for 2 on blank chars
set backspace=2
" tab becomes spaces
set expandtab
" copy indentation from previous line
set autoindent
" attempt to indent to the correct level per source type
set smartindent
" Show tabs and trailing spaces
set listchars=tab:>-,trail:.
set list!

" Change end of buffer from ~ to blank
set fillchars=eob:\ 
" Change fold . to blank
set fillchars+=fold:\ 
" Change vertical separator | to blank
set fillchars+=vert:\ 

" Case insensitive searches, smartly
set ignorecase
set smartcase

" Sets block cursor in normal, vertical bar in insert, underscore in replace
" Run these as autocommands
au VimEnter,VimResume * set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
au VimLeave,VimSuspend * set guicursor=a:hor100

" Autofold markdown files on save
au BufWritePost *.md set ft=markdown

" Make the foldtext simply reprint the line, instead of number of lines folded
set foldtext=CleanFoldText()

function CleanFoldText()
  let line = getline(v:foldstart)
  " let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  " return v:folddashes . ' ' . line
  return line
endfunction
