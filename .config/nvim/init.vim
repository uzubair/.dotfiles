" init.vim

" General settings
" init autocmd
autocmd!

set nocompatible

let mapleader = "\<Space>"

filetype plugin indent on

set encoding=utf-8
set backspace=indent,eol,start
set nobackup
" set nowritebackup
set noswapfile
set history=100
set ruler		                    " Show the cursor position all the time
set showcmd		                    " Display incomplete commands
set incsearch		                " Do incremental search
set autowrite		                " Automatially :write before running commands
set formatoptions-=t 	            " Don't auto-break long lines
set noerrorbells	                " Stop annoying bell on errors
set nohlsearch		                " Stop the highlighting for the 'hlsearch' option
set noshowmatch		                " Don't jump to matching bracket
set hidden		                    " Don't require saving before closing a buffer
set nowrap
set ignorecase
set smartcase
set undofile
set cmdheight=2		                " Give more space for displaying msgs
set updatetime=50	                " Having longer updatetime leades to noticeable delays
set shortmess+=c	                " Don't pass msg to |ins-completion-menu|
set tags=tags
set clipboard+=unnamedplus
set splitright
set splitbelow
set scrolloff=12
set re=1
set spell spelllang=en_us
set iskeyword+=-                    " Treat dash separated words as a word text object
set mouse=a
set conceallevel=0                  " To view `` in the markdown files
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nojoinspaces                    " Use one space after punctuation instead of 2
set number                          " Display relative line numbers along with absolute for the current line
set numberwidth=2
set relativenumber
set backupskip=/tmp/*,/private/tmp/*
set lazyredraw                      " Don't redraw while executing macros
set t_BE=                           " Suppress appending 'PasteStart' and 'PasteEnd' when pasting
set path+=**                        " Search down into subfolders when finding files
set wildignore+=*/node_modules/*

" Use a line cursor within insert mode and a block cursor everywhere else.
" Reference chart for values
" Ps = 0 -> blinking block
" Ps = 1 -> blinking block (default)
" Ps = 2 -> steady block
" Ps = 3 -> blinking underline
" Ps = 4 -> steady underline
" Ps = 5 -> blinking bar
" Ps = 6 -> steady bar (xterm)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

if has("nvim")
    set inccommand=split            " incremental substituion for neovim
endif

" ------------------------------------------------------------------------------
" File Types
au BufNewFile,BufRead *.{es5,es6} setf javascript       " JavaScript
au BufNewFile,BufRead *.tsx setf typescriptreact        " TypeScript
au BufNewFile,BufRead *.{md,rst} set filetype=markdown  " Markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
au BufNewFile,BufRead *.flow set filetype=javascript    " Flow
au BufNewFile,BufRead *.{yaml,yml,tf,template} set filetype=yaml      " Template
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()


" ------------------------------------------------------------------------------
" Imports
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Import MacOS specific settings
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim

" ------------------------------------------------------------------------------
" True color
if exists("&termguicolors")
  syntax enable
  set termguicolors
  set background=dark

  autocmd VimEnter * colorscheme gruvbox
  " autocmd VimEnter * colorscheme monokai
  " autocmd VimEnter * colorscheme monokai_tasty

  " let g:neosolarized_termtrans=1
  " runtime ./colors/NeoSolarized.vim
  " colorscheme NeoSolarized
endif

" ------------------------------------------------------------------------------
" Extras
set exrc

" vim: set foldmethod=marker foldlevel=0:
