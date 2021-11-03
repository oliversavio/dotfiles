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
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'
Plug 'scalameta/nvim-metals'
Plug 'tpope/vim-commentary'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'mattn/emmet-vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

colorscheme nord
highlight Normal guifg=none
let g:airline_theme='nord'
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
let mapleader = " "


:command WQ wq
:command Wq wq
:command W w
:command Q q


let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript'],
      \   'style': ['css'],
      \},
      \'full_syntax': [],
      \'initial_indent': [],
      \'attribute': 0,
      \'keyword': 0,
      \'foldexpr': 0,
      \'debug': 0,
      \}

" Must have remaps
" Undo Breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist for numbered jumping
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text -- This needs a bit more work!!
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2'<CR>gv=gv    
" vnoremap J :m '>+1'<CR>gv=gv    
" inoremap <C-j> :m .+1<CR>==    
" inoremap <C-k> :m .-2<CR>==    

" nnoremap <leader>j :m .+1<CR>==    
" nnoremap <leader>k :m .-2<CR>==    
"" Must have remaps

source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/nav.vim
source ~/.config/nvim/plugins/vimspector.vim
source ~/.config/nvim/plugins/nvimlsp.vim
source ~/.config/nvim/plugins/metals.vim
