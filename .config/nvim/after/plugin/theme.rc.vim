

if exists('g:vscode')
	finish
endif

lua <<EOF
vim.cmd[[colorscheme gruvbox]]
vim.cmd[[highlight Normal guibg=none]]
EOF
