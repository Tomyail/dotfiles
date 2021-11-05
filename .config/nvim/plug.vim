if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

if has("nvim")

  " plug for git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'lewis6991/gitsigns.nvim'

  " ui
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  " file explorer
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'kyazdani42/nvim-tree.lua'
  " snippet
  Plug 'L3MON4D3/LuaSnip'

  " core lsp
  Plug 'neovim/nvim-lspconfig'
  " core code complete
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  " lib utils
  Plug 'nvim-lua/plenary.nvim'
  " search like fzf
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'tami5/sqlite.lua'
  " for comment
  Plug 'tpope/vim-commentary'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'

  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  " Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'RRethy/nvim-treesitter-textsubjects'

  Plug 'christoomey/vim-tmux-navigator'
  Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'chentau/marks.nvim'

  Plug 'editorconfig/editorconfig-vim'
  " Plug 'sbdchd/neoformat'
endif

call plug#end()

