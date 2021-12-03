call plug#begin('~/.local/share/nvim/plugged')
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" NERDTree remains for now - I'm just too used to its functionality
" Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" Generally Useful Tools
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'

" Themes
Plug 'fxn/vim-monochrome'
Plug 'phucngodev/mono'
Plug 'arcticicestudio/nord-vim'

" Languages/Specialty
Plug 'nathangrigg/vim-beancount'
Plug 'elixir-lang/vim-elixir'
Plug 'nvim-orgmode/orgmode'
call plug#end()

let g:config_files = [
      \ 'options.vim',
      \ 'globals.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ ]
      " \ 'legacy.vim'

for s:fname in g:config_files
  execute printf('source %s/vim/%s', stdpath('config'), s:fname)
endfor

lua require('lsp')
lua require('org')
lua require('tel')
