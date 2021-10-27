if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'frazrepo/vim-rainbow'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'phanviet/vim-monokai-pro'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'unblevable/quick-scope'
" Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mbbill/undotree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tweekmonster/gofmt.vim'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

if has("nvim")
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'phaazon/hop.nvim'
  Plug 'mfussenegger/nvim-dap'
  Plug 'romainl/vim-qf'
endif

call plug#end()
