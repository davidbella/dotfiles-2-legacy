call plug#begin('~/.local/share/nvim/plugged')
Plug 'elixir-lang/vim-elixir'
Plug 'chemzqm/vim-jsx-improve'
Plug 'rhysd/vim-crystal'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'

Plug 'neomake/neomake'

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mileszs/ack.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()


""" General VIM settings
set number

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
" Change trailing file vim ~ into blank character
set fcs=eob:\ 

" Allow buffer switching without saving them
set hidden

" Case insensitive searches, smartly
:set ignorecase
:set smartcase

" leader-c to copy current file name into clipboard buffer
nmap <leader>c :let @+ = expand("%")<cr>

" disables nvim from setting a guicursor (keeps terminal settings cursor)
:set guicursor=

" set column line at 80
set colorcolumn=101


""" vim-fugitive
" Make diffs vertical for vim-fugitive
set diffopt+=vertical


""" NERDTree
" Automagically open NERDTree on vim startup and default to file window instead of NERDTree
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" Automagically close NERDTree if it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Adjust NERDTree window size
let NERDTreeWinSize=30

" Hide cursorline in NERDTree
" let NERDTreeHighlightCursorline=0

" Binding to locate current file in NERDTree
map <leader>l :NERDTreeFind<cr>


""" NERDCommenter
" filetype checking
filetype plugin on

" Puts a space after the comment
let g:NERDSpaceDelims = 1

" Keybinding for comment - TODO: make this better?
map <C-c> \c<space>


""" Buffergator
" Have Buffergator open from the right and make it bigger
let buffergator_viewport_split_policy="R"
let buffergator_split_size=80

" Show relative path instead of absolute path
let buffergator_show_full_directory_path=0

" Sort by full filepath, alphabetically
let buffergator_sort_regime="filepath"


""" CtrlP
" Having trouble getting some files to show in non-MRU (most recently used)
" mode - default to MRU for now...
" let g:ctrlp_cmd = 'CtrlPMRU'

" Ignore some junk
" set wildignore+=*/tmp/*
" let g:ctrlp_custom_ignore = 'node_modules\|tmp'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|node_modules\|public\/assets\|tmp\|_build',
  \ }

" use OS `find`
" let g:ctrlp_user_command = 'find %s -type f' 

" let g:ctrlp_user_command = 'find %s -type d \( -path ./node_modules -o -path ./vendor \) -prune -o -type f -print'


""" Ack.vim
" Don't jump to first file (aka use Ack! instead of Ack)
cnoreabbrev Ack Ack!

" Prefer the silver searcher (if available)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


""" Neomake
" Autorun Neomake on file save
autocmd! BufWritePost * Neomake

" Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
let g:neomake_elixir_enabled_makers = ['mix', 'mycredo']

function! NeomakeCredoErrorType(entry)
  if a:entry.type ==# 'F'      " Refactoring opportunities
    let l:type = 'W'
  elseif a:entry.type ==# 'D'  " Software design suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'W'  " Warnings
    let l:type = 'W'
  elseif a:entry.type ==# 'R'  " Readability suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'C'  " Convention violation
    let l:type = 'W'
  else
    let l:type = 'M'           " Everything else is a message
  endif
  let a:entry.type = l:type
endfunction

let g:neomake_elixir_mycredo_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
      \ 'postprocess': function('NeomakeCredoErrorType'),
      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
      \ }


let g:neomake_javascript_eslint_maker = {
      \ 'args': ['--format', 'compact', '--config', './.eslintrc.yml'],
      \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
      \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#'
      \ }


let g:neomake_ruby_rubocop_maker = {
      \ 'args': ['--format', 'emacs', '--force-exclusion', '--display-cop-names'],
      \ 'errorformat': '%f:%l:%c: %t: %m,%E%f:%l: %m',
      \ 'postprocess': function('neomake#makers#ft#ruby#RubocopEntryProcess')
      \ }


""" ALT
" Run a given vim command on the results of alt from a given path.
" See usage below.
" function! AltCommand(path, vim_command)
  " let l:alternate = system("alt " . a:path)
  " if empty(l:alternate)
    " echo "No alternate file for " . a:path . " exists!"
  " else
    " exec a:vim_command . " " . l:alternate
  " endif
" endfunction

" Run a given vim command on the results of alt from a given path.
" See usage below.
" this is the author of Alt's personal vim config - says it's faster to use
" `find` instead of the build in finder in Alt
" it looks pretty OSX and Rust project specific, tweak to my own needs...
function! AltCommand(path, vim_command)
  let l:alternate = system("find . -path ./_site -prune -or -path ./target -prune -or -path ./.DS_Store -prune -or -path ./build -prune -or -path ./Carthage -prune -or -path tags -prune -or -path ./tmp -prune -or -path ./log -prune -or -path ./.git -prune -or -type f -print | alt -f - " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>a :call AltCommand(expand('%'), ':e')<cr>

" Writing mode
let g:limelight_conceal_ctermfg = 'gray'

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=25
  set textwidth=100
  set linespace=7

  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=0
  set textwidth=0
  set linespace=0

  set bg=light

  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" leader-h to clear highlights
nmap <leader>h :nohlsearch<cr>

" lots of very specific highlighting color changes
hi Search cterm=reverse ctermbg=0 guibg=NONE
hi Visual cterm=bold ctermbg=NONE guibg=NONE
hi DiffAdd cterm=bold ctermfg=2 ctermbg=NONE guibg=NONE
hi DiffChange cterm=bold ctermfg=3 ctermbg=NONE guibg=NONE
hi DiffDelete cterm=bold ctermfg=1 ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi DiffText cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
hi MatchParen cterm=underline ctermbg=NONE guibg=NONE
hi SpellCap cterm=underline ctermbg=NONE guibg=NONE
hi SpellBad cterm=underline ctermbg=NONE guibg=NONE
hi Folded cterm=underline ctermfg=1 ctermbg=NONE
