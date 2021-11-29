call plug#begin('~/.local/share/nvim/plugged')
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-vinegar'
" Switching back to NERDTree for now - I'm just too used to its functionality

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'liuchengxu/vista.vim'

Plug 'nathangrigg/vim-beancount'

Plug 'fxn/vim-monochrome'

Plug 'elixir-lang/vim-elixir'

Plug 'nvim-treesitter/nvim-treesitter'
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
