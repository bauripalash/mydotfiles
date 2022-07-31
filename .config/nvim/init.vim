set nocompatible
set encoding=utf-8
set autoread
" ========== PLUGINS ===================
call plug#begin(stdpath('data') . '/plugged')

	Plug 'dracula/vim'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
    Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'
call plug#end()

" ======================================
let mapleader=","
set mouse=a
if (has("termguicolors"))
	set termguicolors
endif

nnoremap <ESC>[[h   <Home>

set t_Co=256
let maplocalleader = "\\"
syntax enable
colorscheme dracula
set number
set clipboard=unnamedplus
filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent

set incsearch

set noswapfile
set nobackup
set nowb

set backspace=indent,eol,start

if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
noremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

lua require('vim')
