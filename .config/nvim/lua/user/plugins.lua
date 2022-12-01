local utils = require("user.functions")
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the useins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost useins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your useins here
return packer.startup(function(use)
	-- must have: without it, i can't work

	local basic = {
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.x",
			requires = { { "nvim-lua/plenary.nvim" } },
		},
		"kyazdani42/nvim-tree.lua",
		"neovim/nvim-lspconfig",
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		"jose-elias-alvarez/null-ls.nvim",
		{ "hrsh7th/nvim-cmp", requires = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		} },
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lua",
		"folke/which-key.nvim",

		{
			"nvim-treesitter/nvim-treesitter",
			run = "TSUpdate",
		},
		"windwp/nvim-autopairs",
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
	}

	local enhanced = {
		"kyazdani42/nvim-web-devicons",
		"kristijanhusak/defx-git",
		"kristijanhusak/defx-icons",

		"b0o/SchemaStore.nvim",

		{
			"tzachar/cmp-tabnine",
			config = function()
				local tabnine = require("cmp_tabnine.config")
				tabnine:setup({
					max_lines = 1000,
					max_num_results = 20,
					sort = true,
					run_on_every_keystroke = true,
					snippet_placeholder = "..",
					ignored_file_types = { -- default is not to ignore
						-- uncomment to ignore in lua:
						-- lua = true
					},
				})
			end,

			run = "./install.sh",
			requires = "hrsh7th/nvim-cmp",
		},
		"akinsho/bufferline.nvim",
		"hoob3rt/lualine.nvim",
		"lewis6991/gitsigns.nvim",
		"rcarriga/nvim-notify",
		"lewis6991/impatient.nvim",
		"nathom/filetype.nvim",
		"moll/vim-bbye",
		"antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
		"onsails/lspkind-nvim",
		"nvim-lua/popup.nvim",
		"tami5/lspsaga.nvim",
		"lukas-reineke/indent-blankline.nvim",
		"rafamadriz/friendly-snippets",
		"tpope/vim-rhubarb",
		"folke/lsp-colors.nvim",
		"ray-x/lsp_signature.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-telescope/telescope-frecency.nvim",
		"tami5/sqlite.lua",
		"numToStr/Comment.nvim", -- Easily comment stuff
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
		"RRethy/nvim-treesitter-textsubjects",
		"christoomey/vim-tmux-navigator",
		"https://gitlab.com/yorickpeterse/nvim-window.git",
		"akinsho/toggleterm.nvim",
		"chentau/marks.nvim",
		"editorconfig/editorconfig-vim",
		"tpope/vim-surround",
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"Pocco81/DAPInstall.nvim",
		"shaunsingh/nord.nvim",
		"folke/tokyonight.nvim",
		"phaazon/hop.nvim",
		"ggandor/lightspeed.nvim",
		"ggandor/leap.nvim",
		"unblevable/quick-scope",
		"ThePrimeagen/harpoon",
		{ "nathangrigg/vim-beancount", ft = { "bean" } },
		"brglng/vim-im-select",
		"norcalli/nvim-colorizer.lua",
		"karb94/neoscroll.nvim",
		"matbme/JABS.nvim",
		"windwp/nvim-spectre",
		"MattesGroeger/vim-bookmarks",
		{
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		},
		"simrat39/symbols-outline.nvim",
		"tmux-plugins/vim-tmux-focus-events",
		{
			"zbirenbaum/copilot.lua",
			event = { "VimEnter" },
			config = function()
				vim.defer_fn(function()
					require("user.copilot")
				end, 100)
			end,
		},
		"zbirenbaum/copilot-cmp",
		{
			"ghillb/cybu.nvim",
			branch = "v1.x", -- won't receive breaking changes
			-- branch = "main", -- timely updates
			requires = { "kyazdani42/nvim-web-devicons" }, --optional
		},
		"SmiteshP/nvim-gps",
		"dstein64/vim-startuptime",
		{
			"fgheng/winbar.nvim",
		},
	}

	local deluxe = {
		"ahmedkhalf/project.nvim",
		"goolord/alpha-nvim",
		"RRethy/vim-illuminate",
	}

	local function merge(t1, t2)
		for k, v in pairs(t2) do
			if (type(v) == "table") and (type(t1[k] or false) == "table") then
				merge(t1[k], t2[k])
			else
				t1[k] = v
			end
		end
		return t1
	end

	local plugins = {}
	local running_mode = utils.get_running_mode()
	if running_mode == "basic" then
		plugins = merge({}, basic)
	elseif running_mode == "enhanced" then
		plugins = merge(merge({}, basic), enhanced)
	elseif running_mode == "deluxe" then
		plugins = merge(merge(merge({}, basic), enhanced), deluxe)
	end

	for k, v in ipairs(plugins) do
		-- print(k, v)
		use(v)
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all useins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
