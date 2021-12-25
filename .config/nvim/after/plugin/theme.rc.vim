

if exists('g:vscode')
	finish
endif

lua <<EOF
-- vim.cmd[[colorscheme gruvbox]]
-- vim.cmd[[highlight Normal guibg=none]]

vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
EOF
