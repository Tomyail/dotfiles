local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the useins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost useins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your useins here
return packer.startup(function(use)

  use 'github/copilot.vim'
	use 'moll/vim-bbye'
  use 'antoinemadec/FixCursorHold.nvim' -- This is needed to fix lsp doc highlight
  use 'akinsho/bufferline.nvim'
  use 'goolord/alpha-nvim'
  use 'folke/which-key.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/popup.nvim'
  use 'tami5/lspsaga.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'lukas-reineke/indent-blankline.nvim'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  use 'folke/lsp-colors.nvim'

  use 'kristijanhusak/defx-git'
  use 'kristijanhusak/defx-icons'
  -- use 'Shougo/defx.nvim', { 'do': ':UpdateRemoteuseins' }

  use 'kyazdani42/nvim-tree.lua'
  use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
  use 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-copilot'
  use 'hrsh7th/cmp-nvim-lua'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'ray-x/lsp_signature.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'nvim-telescope/telescope.nvim'
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-frecency.nvim'
  use 'tami5/sqlite.lua'

  use 'numToStr/Comment.nvim' -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {'nvim-treesitter/nvim-treesitter', run= 'TSUpdate' }
	use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'

  use 'RRethy/nvim-treesitter-textsubjects'

  use 'christoomey/vim-tmux-navigator'

  use 'https://gitlab.com/yorickpeterse/nvim-window.git'
  use 'akinsho/toggleterm.nvim'
  use 'chentau/marks.nvim'

  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-surround'

  use 'mfussenegger/nvim-dap'
  use 'Pocco81/DAPInstall.nvim'

  use 'folke/tokyonight.nvim'
  use  'lewis6991/impatient.nvim'

  use 'phaazon/hop.nvim'
	use 'ggandor/lightspeed.nvim'
	use 'unblevable/quick-scope'
	use 'ThePrimeagen/harpoon'

	use 'nathangrigg/vim-beancount'

	use 'brglng/vim-im-select'

  use 'norcalli/nvim-colorizer.lua'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all useins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
