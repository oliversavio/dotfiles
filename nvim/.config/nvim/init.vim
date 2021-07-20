set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set hidden
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set number
set completeopt=menuone,noinsert,noselect
set relativenumber

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'
Plug 'scalameta/nvim-metals'
Plug 'tpope/vim-commentary'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
call plug#end()

colorscheme nord
highlight Normal guibg=none
let g:airline_theme='nord'
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
let mapleader = " "

" quick fix list nav
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
" quick fix list nav

source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/vimspector.vim
source ~/.config/nvim/plugins/nvimlsp.vim
source ~/.config/nvim/plugins/metals.vim

