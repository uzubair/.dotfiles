if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif



call plug#begin()

if has("nvim")
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
endif

call plug#end()
