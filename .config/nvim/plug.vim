if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

" vim/nvim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'NLKNguyen/papercolor-theme'

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has("nvim")
  Plug 'navarasu/onedark.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'BurntSushi/ripgrep'
  Plug 'nvim-telescope/telescope.nvim'
endif

call plug#end()
