call plug#begin()
if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
  " theme
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

  Plug 'moll/vim-bbye'
  Plug 'antoinemadec/FixCursorHold.nvim' "- This is needed to fix lsp doc highlight
  Plug 'akinsho/bufferline.nvim'
  Plug 'goolord/alpha-nvim'
  Plug 'folke/which-key.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'tami5/lspsaga.nvim',
  Plug 'ahmedkhalf/project.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  " plug for git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'lewis6991/gitsigns.nvim'

  " ui
  Plug 'folke/lsp-colors.nvim'

  " file explorer
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

  " Plug 'kyazdani42/nvim-tree.lua'
  " snippet
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'

  " core lsp
  Plug 'neovim/nvim-lspconfig' "" enable LSP
  Plug 'williamboman/nvim-lsp-installer' "" simple to use language server installer
  Plug 'tamago324/nlsp-settings.nvim' " " language server settings defined in json for
  Plug 'jose-elias-alvarez/null-ls.nvim' " for formatters and linters

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
  Plug 'numToStr/Comment.nvim' "- Easily comment stuff
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  Plug 'RRethy/nvim-treesitter-textsubjects'

  Plug 'christoomey/vim-tmux-navigator'

  Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
  Plug 'akinsho/toggleterm.nvim'
  Plug 'chentau/marks.nvim'

  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-surround'

  Plug 'mfussenegger/nvim-dap'
  Plug 'Pocco81/DAPInstall.nvim'

  Plug  'lewis6991/impatient.nvim'
endif
call plug#end()

