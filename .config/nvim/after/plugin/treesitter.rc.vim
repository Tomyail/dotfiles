if !exists('g:loaded_nvim_treesitter')
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
	  enable = true,
	  keymaps = {
		init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
		  }
	  },
  ensure_installed = {
    "javascript",
    "tsx",
    "typescript",

    "json",
    "json5",
    "yaml",
    "toml",

    "html",
    "scss",
	"vim"
  },
  -- nvim-treesitter-textsubjects
  textsubjects = {
        enable = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
        }
    },
  -- JoosepAlviste/nvim-ts-context-commentstring
  context_commentstring = {
    enable = true
    },
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
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--  parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF
