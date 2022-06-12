local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
configs.setup({

	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	endwise = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	-- nvim-treesitter-textsubjects
	textsubjects = {
		enable = true,
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
		},
	},
	-- JoosepAlviste/nvim-ts-context-commentstring
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["icl"] = "@call.inner",
				["acl"] = "@call.outer",
				["ilp"] = "@loop.inner",
				["ipm"] = "@parameter.inner",
				["ib"] = "@block.inner",
				["icn"] = "@conditional.inner",
			},
		},
	},
})

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--  parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
