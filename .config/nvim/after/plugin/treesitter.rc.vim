if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
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
    "scss"
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
